import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/boss_info_entity.dart';
import 'package:recruit_app/entity/socket_msg_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/chat_history_model.dart';
import 'package:recruit_app/model/event_bus_notify.dart';
import 'package:recruit_app/pages/jobs/chat_row_item.dart';
import 'package:recruit_app/utils/web_socket_manager.dart';

import '../../application.dart';
import '../../main.dart';

class BossChatRoom extends StatefulWidget {
  final String toId;
  final String toName;
  final String toAvatar;

  const BossChatRoom(
      {Key key, this.toId='',this.toName='',this.toAvatar=''})
      : super(key: key);

  @override
  _BossChatRoomState createState() {
    // TODO: implement createState
    return _BossChatRoomState();
  }
}

class _BossChatRoomState extends State<BossChatRoom> {
  List<SocketMsgEntity> _chatList=[];
  final ScrollController _scrollController = ScrollController();

  String _fromAvatar = '';
  StreamSubscription _newMsg;

  @override
  void initState() {
    super.initState();
    WebSocketManager.instance.resetChatList(widget.toId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getMainInfo();
      _getChatList();
    });
    _newMsg=eventBus.on<NotifyNewMsg>().listen((event) {
      Future.delayed(Duration(milliseconds: 250), (){
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 250), curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_newMsg!=null){
      _newMsg.cancel();
    }
    super.dispose();
  }

  _getMainInfo() async {
    BossInfoData mineInfoData = await BossMineModel.instance.getRecruiterInfo(
        context, Application.sp.get('recruiterId'));
    if (mineInfoData != null) {
      Application.sp.setString(
          'recruiterName', mineInfoData.recruiter.realName);
      Application.sp.setString(
          'recruiterAvatar', mineInfoData.recruiter.avatar);
      setState(() {
        _fromAvatar = mineInfoData.recruiter.avatar;
      });
    }
  }

  _getChatList() async {
    List<SocketMsgEntity> socketMsgList = await ChatHistoryModel.instance
        .getChatList(context, Application.sp.get('userId'),
            widget.toId, 1);
    setState(() {
      _chatList.insertAll(0, socketMsgList);
    });
    Future.delayed(Duration(milliseconds: 250), (){
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 250), curve: Curves.linear);
    });
    WebSocketManager.instance.resetChatList(widget.toId);
  }

  @override
  Widget build(BuildContext context) {
    final editController = TextEditingController();
    editController.addListener(() {});

    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('${widget.toName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(20, 20, 20, 1))),
//              Text('全栈工程师',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: const TextStyle(
//                      wordSpacing: 1,
//                      letterSpacing: 1,
//                      fontSize: 14,
//                      color: Color.fromRGBO(152, 154, 155, 1))),
            ],
          ),
          leading: IconButton(
              icon: Image.asset(
                'images/ic_back_arrow.png',
                width: ScreenUtil().setWidth(15),
                height: ScreenUtil().setWidth(30),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//          actions: <Widget>[
//            IconButton(
//                icon: Image.asset(
//                  'images/ic_view_more.png',
//                  width: 24,
//                  height: 24,
//                ),
//                onPressed: () {}),
//          ],
        ),
        body: Consumer<WebSocketManager>(builder: (context, model, child) {
          _chatList.addAll( model.chatList(
              widget.toId));
          model.resetChatList(widget.toId);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Image.asset('images/ic_phone.png',
//                            width: 25, height: 25, fit: BoxFit.cover),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Text('电话号',
//                            style: const TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: 12,
//                                color: Color.fromRGBO(115, 116, 117, 1)))
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Image.asset('images/ic_wechat.png',
//                            width: 25, height: 25, fit: BoxFit.cover),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Text('微信号',
//                            style: const TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: 12,
//                                color: Color.fromRGBO(115, 116, 117, 1)))
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Image.asset('images/ic_resume_send.png',
//                            width: 25, height: 25, fit: BoxFit.cover),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Text('求简历',
//                            style: const TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: 12,
//                                color: Color.fromRGBO(115, 116, 117, 1)))
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Image.asset('images/ic_red_cancel.png',
//                            width: 25, height: 25, fit: BoxFit.cover),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Text('不合适',
//                            style: const TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: 12,
//                                color: Color.fromRGBO(115, 116, 117, 1)))
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(241, 242, 244, 1),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(28)),
                    controller: _scrollController,
                    itemBuilder: (context, index) {
//                    if(index==0){
//                      return BossChatRoomIntro();
//                    }
                      if (index < (_chatList.length)) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: ChatRowItem(
                            chat: _chatList[index],
                            index: index,
                            isBoss: true,
                            fromAvatar: _fromAvatar,
                            toAvatar: widget.toAvatar,
                          ),
                          onTap: () {},
                        );
                      }
                      return null;
                    },
                    itemCount: _chatList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(48),
                    vertical: ScreenUtil().setWidth(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
//                    GestureDetector(
//                      behavior: HitTestBehavior.opaque,
//                      onTap: () {},
//                      child: Container(
//                        padding:
//                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                        child: Text(
//                          "常用语",
//                          style: TextStyle(
//                            fontSize: 14,
//                            color: Colors.white,
//                          ),
//                        ),
//                        decoration: new BoxDecoration(
//                          color: Color.fromRGBO(0, 188, 173, 1),
//                          borderRadius: new BorderRadius.circular(5.0),
//                        ),
//                      ),
//                    ),
                      Expanded(
                        child: TextField(
                          controller: editController,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.send,
                          cursorColor: Color.fromRGBO(159, 199, 235, 1),
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              color: Color.fromRGBO(176, 181, 180, 1)),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(159, 199, 235, 1),
                                  width: ScreenUtil().setWidth(2),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(159, 199, 235, 1),
                                  width: ScreenUtil().setWidth(2),
                                ),
                              ),
                              hintStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(176, 181, 180, 1)),
                              hintText: '新信息'),
                          onSubmitted: (text) {
                            if (text.isEmpty) {
                              return;
                            }
                            editController.text='';
                            model.sendMsg(widget.toId, text,fromRoleFlag: '2',toRoleFlag: '1');
                          },
                        ),
                      ),
//                    GestureDetector(
//                      behavior: HitTestBehavior.opaque,
//                      child: Padding(
//                        padding: const EdgeInsets.all(5.0),
//                        child: Image.asset(
//                          'images/icon_replay_face.png',
//                          width: 24,
//                          height: 24,
//                        ),
//                      ),
//                    ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'images/icon_increase.png',
                            width: ScreenUtil().setWidth(48),
                            height: ScreenUtil().setWidth(48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
