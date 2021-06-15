import 'package:flutter/material.dart';

import 'package:band_names/domain/entities/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metálica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 5),
    Band(id: '3', name: 'Heroes del silencio', votes: 5),
    Band(id: '4', name: 'Bon Jovi', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>
            _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewBand,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: ( direccion ) {
        // TODO: delete method
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
      key: Key(band.id),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: () {},
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
    if (name.length > 1) {
      setState(() {
        this
            .bands
            .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      });
    }
    Navigator.pop(context);
  }
}
