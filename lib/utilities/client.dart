import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Client {
  static const String ADDRESS = 'ws://echo.websocket.org';//'ws://localhost:8000';//'ws://127.0.0.1:8000';
  static WebSocketChannel _channel;
  static bool master = false;

  static void initialize() {
    _connectSocketChannel();
  }

  static void disconnect() {
    _disconnectSocketChannel();
  }
  
  static void _connectSocketChannel() {
    _channel = IOWebSocketChannel.connect(ADDRESS);
  }

  static void _disconnectSocketChannel() {
    _channel.sink.close();
  }

  void sendMessage(String type, String id) {
    _channel.sink.add(id);
    _channel.stream.listen((message) {
      print(message);
    });
  }


}