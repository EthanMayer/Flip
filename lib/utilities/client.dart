import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class Client {
  static const String ADDRESS = 'ws://136.58.86.221:8000';//'ws://192.168.1.158:8000';//'ws://echo.websocket.org';//'ws://localhost:8000';//'ws://127.0.0.1:8000';
  static const String ADDRESS2 = 'ws://136.58.86.221:9000';
  static IOWebSocketChannel _channel;
  static bool master = false;
  static dynamic received;

  static void initialize() {
    _connectSocketChannel();
  }

  static void disconnect() {
    _disconnectSocketChannel();
  }
  
  static void _connectSocketChannel() {
    if (master) {
      _channel = IOWebSocketChannel.connect(Uri.parse(ADDRESS));
    } else {
      _channel = IOWebSocketChannel.connect(Uri.parse(ADDRESS2));
    }
    //_channel = IOWebSocketChannel.connect(Uri.parse(ADDRESS));
  }

  static void _disconnectSocketChannel() {
    _channel.sink.close();
  }

  void sendMessage(String type, String id) {
    _connectSocketChannel();
    _channel.sink.add(id);
    _disconnectSocketChannel();
    // _channel.stream.listen((message) {
    //   print(message);
    // });
  }

  Future<dynamic> listen() {
    _connectSocketChannel();
    String data;
    _channel.stream.listen((message) {
      print(message);
      received = message;
      return message;
    });
  }
}