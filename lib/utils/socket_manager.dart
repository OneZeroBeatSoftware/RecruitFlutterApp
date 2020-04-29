import 'dart:async';
import 'dart:convert';
import 'dart:io';

class SocketManager {
  /// 心跳包定时器
  Timer _timer;
  /// Socket 实例
  Socket _socket;
  /// 接收数组
  List<int> _receiveList;

  factory SocketManager()=>_getInstance();

  static SocketManager _instance;

  static SocketManager get instance => _getInstance();

  SocketManager._internal() {
    /// 初始化
  }

  static SocketManager _getInstance(){
    if(_instance==null){
      _instance=new SocketManager._internal();
    }
    return _instance;
  }

  /// 初始化Socket并监听数据
  Future startClient(String address,int port)async{
    /// 初始化定时器
    _timer=Timer.periodic(Duration(minutes: 1), (time){
      sendMsg('heart beat');
    });
    /// 初始化接收数据数组
    _receiveList=new List<int>();
    /// 建立链接
    _socket=await Socket.connect(address, port);
    /// 监听接收信息
    _socket.listen((data){

    });
  }

  /// 发送消息
  void sendMsg(String msg){
    if(_socket!=null){
      _socket.write(msg);
    }
  }

  /// 处理接收的数据
  void readData(List dataList) {
    /// 接收暂存信息
    _receiveList= _receiveList+dataList;
    /// 接收的信息长度大于8
    while (_receiveList.length>8) {
      int length=8;
      /// 信息长度
      int msgLength= int.parse(utf8.decode(_receiveList.sublist(0,8)));
      /// 原长度
      int srcLength=_receiveList.length;
      /// 当收到的消息超过消息头描述的消息体长度时取出消息体并解码
      if(_receiveList.length>=length+msgLength){
        /// 消息处理

        _receiveList=_receiveList.sublist(length+msgLength,srcLength);
      }
    }
  }

  void dispose() async{
    if(_timer!=null){
      _timer.cancel();
      _timer=null;
    }
    if(_socket!=null){
      await _socket.flush();
      await _socket.close();
      _socket.destroy();
    }
  }
}