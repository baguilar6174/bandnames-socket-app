import 'package:band_names/data/services/socket_service.dart';
import 'package:flutter/material.dart';

import 'package:band_names/domain/entities/band.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [];

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('active-bands', _handleActiveBands);

    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    this.bands = (payload as List).map((b) => Band.fromJson(b)).toList();
    setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: socketService.serverStatus == ServerStatus.Offline
                ? Icon(
                    Icons.offline_bolt,
                    color: Colors.redAccent,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.blue[300],
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          _showGraph(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (BuildContext context, int index) => _bandTile(
                bands[index],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewBand,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    final socketService = Provider.of<SocketService>(context, listen: false);

    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direccion) {
        socketService.socket.emit('delete-band', {"id": band.id});
      },
      background: Container(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      key: UniqueKey(),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: () {
          setState(() {
            socketService.socket.emit('vote-band', {'id': band.id});
          });
        },
      ),
    );
  }

  _addNewBand() {
    final _textCrontroller = new TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Band Name'),
          content: TextField(
            controller: _textCrontroller,
          ),
          actions: [
            MaterialButton(
              child: Text('Add'),
              textColor: Colors.blue,
              onPressed: () => _addBandToList(_textCrontroller.text),
            ),
          ],
        );
      },
    );
  }

  void _addBandToList(String name) {
    final socketService = Provider.of<SocketService>(context, listen: false);

    if (name.length > 1) {
      setState(() {
        socketService.socket.emit('add-band', {'name': name});
      });
    }
    Navigator.pop(context);
  }

  Widget _showGraph() {
    Map<String, double> dataMap = new Map();
    this.bands.forEach((b) {
      dataMap[b.name] = b.votes.toDouble();
    });

    return Container(
      width: double.infinity,
      height: 250,
      child: PieChart(dataMap: dataMap),
    );
  }
}
