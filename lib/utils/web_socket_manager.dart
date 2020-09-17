import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:recruit_app/entity/socket_msg_entity.dart';
import 'package:recruit_app/main.dart';
import 'package:recruit_app/model/event_bus_notify.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager with ChangeNotifier {
  Timer _timer;

  LinkedHashMap<String, List<SocketMsgEntity>> _socketMsgList =
  new LinkedHashMap();

  List<SocketMsgEntity> chatList(String id) {
    if (_socketMsgList[id] != null)
      return _socketMsgList[id];
    return [];
  }

  resetChatList(String id) {
    if (_socketMsgList[id] != null) _socketMsgList[id] = [];
  }

  IOWebSocketChannel _channel;

  factory WebSocketManager() => _getInstance();

  static WebSocketManager _instance;

  static WebSocketManager get instance => _getInstance();

  WebSocketManager._internal() {
    /// 初始化
  }

  static WebSocketManager _getInstance() {
    if (_instance == null) {
      _instance = new WebSocketManager._internal();
    }
    return _instance;
  }

  /// 初始化Socket并监听数据
  startClient(String fromId) {
    _channel = new IOWebSocketChannel.connect("ws://34.229.235.238:7788/recruit");
    Map<String, dynamic> loginInfo = new Map();
    loginInfo["code"] = "10000";
    loginInfo["userId"] = fromId;
    _channel.sink.add(jsonEncode(loginInfo));

    _channel.stream.listen((data) {
      SocketMsgEntity socketMsgEntity=analyzeMsg(data);
      if(socketMsgEntity.code=="10016"){
        return;
      }
      print(data);
      eventBus.fire(NotifyNewMsg('refresh'));
      String toId=socketMsgEntity.toId==fromId?socketMsgEntity.fromId:socketMsgEntity.toId;
      List<SocketMsgEntity> chatList = _socketMsgList[toId];
      if (chatList != null) {
        chatList.add(socketMsgEntity);
      } else {
        chatList = [];
        chatList.add(socketMsgEntity);
      }
      _socketMsgList[toId] = chatList;
      notifyListeners();
    },onError: (e){
    },onDone: (){
      print("IOWebSocketChannel========================================onDone");
      this.startClient(fromId);
    },cancelOnError: false);

    final call = (time) {
      Map<String, dynamic> heart = new Map();
      heart["code"] = "10015";
      heart["content"] = "ozb";
      _channel.sink.add(jsonEncode(heart));
    };
    if(_timer==null){
      _timer = Timer.periodic(Duration(minutes: 4), call);
    }
  }

  sendMsg(String toId, String msg) {
    Map<String, dynamic> content = new Map();
    content["code"] = "10086";
    content["content"] = msg;
    content["toId"] = toId;
    _channel.sink.add(jsonEncode(content));
  }

  closeClient() {
    if (_timer != null) {
      _timer.cancel();
    }
    if (_channel != null) {
      _channel.sink.close();
    }
  }

  SocketMsgEntity analyzeMsg(String msg) {
    return SocketMsgEntity().fromJson(jsonDecode(msg));
  }
}
