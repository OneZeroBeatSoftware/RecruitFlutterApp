import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/chat_history_entity.dart';
import 'package:recruit_app/entity/msg_list_entity.dart';
import 'package:recruit_app/entity/socket_msg_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class ChatHistoryModel {
  static ChatHistoryModel _instance;

  factory ChatHistoryModel() => _getInstance();

  static ChatHistoryModel get instance => _getInstance();

  ChatHistoryModel._internal() {
    //TODO
  }

  static ChatHistoryModel _getInstance() {
    if (_instance == null) {
      _instance = new ChatHistoryModel._internal();
    }
    return _instance;
  }

  Future<List<SocketMsgEntity>> getChatList(
      BuildContext context, String fromId, String toId, int pageIndex) async {
    ChatHistoryEntity chatHistoryEntity =
        await NetUtils.getChatList(context, fromId, toId, pageIndex);
    if (chatHistoryEntity != null && chatHistoryEntity.statusCode == 200) {
      return chatHistoryEntity.data.map((item) => SocketMsgEntity()
        ..fromId = item.fromId.toString()
        ..toId = item.toId.toString()
        ..content = item.content
        ..contentType = item.contentType.toString()
        ..sendTime = item.sendTime.toString()).toList();
    }
    Utils.showToast(chatHistoryEntity.msg ?? '获取失败，请重新尝试');
    return [];
  }

  List<MsgListData> _msgList=[];

  setMsgList(List<MsgListData> value) {
    _msgList = value;
  }

  List<MsgListData> get msgList => _msgList;

  Future<MsgListEntity> getMsgList(
      BuildContext context, String fromId,int type) async {
    MsgListEntity msgListEntity =
    await NetUtils.getMsgList(context, fromId, type);
    if (msgListEntity.statusCode ==200) {
      _msgList.clear();
      _msgList.addAll(msgListEntity.data);
      return msgListEntity;
    }
//    Utils.showToast(msgListEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }
}
