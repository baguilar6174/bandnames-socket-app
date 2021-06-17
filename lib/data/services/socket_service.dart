import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

// Server status management
enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  // Default status
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client Socket.io.
    this._socket = IO.io(
      'https://bands-app-socket-server.herokuapp.com/',
      IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build()
    );

    this._socket.onConnect((_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    
    this._socket.onDisconnect((_) {
      print('disconnect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('new-message', ( payload ) {
    //   print('new-message $payload');
    // });
  }
}
