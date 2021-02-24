import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/mine_info_entity.dart';
import 'package:recruit_app/entity/socket_msg_entity.dart';
import 'package:recruit_app/model/chat_history_model.dart';
import 'package:recruit_app/model/event_bus_notify.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/jobs/chat_row_item.dart';
import 'package:recruit_app/utils/web_socket_manager.dart';
import 'package:recruit_app/widgets/craft_list_dialog.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

import '../../application.dart';
import '../../main.dart';

class ChatRoom extends StatefulWidget {
  final String toId;
  final String toName;
  final String toAvatar;
  const ChatRoom(
      {Key key, this.toId='',this.toName='',this.toAvatar=''})
      : super(key: key);

  @override
  _ChatRoomState createState() {
    // TODO: implement createState
    return _ChatRoomState();
  }
}

class _ChatRoomState extends State<ChatRoom> {
  List<SocketMsgEntity> _chatList=[];
//  IOWebSocketChannel _channel;
  final ScrollController _scrollController = ScrollController();

  String _fromAvatar='';
  List<String> _resumeList = [];
  List<String> _reportList = [];
  StreamSubscription _newMsg;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _resumeList.add('平面设计');
    }
    for (int i = 0; i < 15; i++) {
      _reportList.add('已找到工作');
    }
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
    MineInfoData mineInfoData = await MineModel.instance
        .getSeekerInfo(context, Application.sp.get('jobSeekerId'));
    if (mineInfoData != null) {
      Application.sp
          .setString('jobSeekerName', mineInfoData.jobSeeker.realName);
      Application.sp
          .setString('jobSeekerAvatar', mineInfoData.jobSeeker.avatar);
      setState(() {
        _fromAvatar = mineInfoData.jobSeeker.avatar;
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
//              Text('在线',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
//              Text('艾乐科技',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      fontSize: 18,
//                      fontWeight: FontWeight.bold,
//                      color: Color.fromRGBO(20, 20, 20, 1))),
//              Text('在线',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
            ],
          ),
          leading: IconButton(
              icon: Image.asset(
                'images/img_arrow_left_black.png',
                width: ScreenUtil().setWidth(20),
                height: ScreenUtil().setWidth(36),
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//          actions: <Widget>[
//            IconButton(
//                icon: Image.asset(
//                  'images/img_menu_black.png',
//                  width: ScreenUtil().setWidth(36),
//                  height: ScreenUtil().setWidth(6),
//                  fit: BoxFit.contain,
//                ),
//                onPressed: () {
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatSetting()));
//                }),
//          ],
        ),
        body: Consumer<WebSocketManager>(builder: (context,model,child){
          _chatList.addAll(model.chatList(widget.toId));
          model.resetChatList(widget.toId);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.symmetric(
//                  horizontal: ScreenUtil().setWidth(48),
//                  vertical: ScreenUtil().setWidth(26),
//                ),
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Expanded(
//                      flex: 1,
//                      child: GestureDetector(
//                        onTap: () {},
//                        behavior: HitTestBehavior.opaque,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Image.asset('images/img_tel_gray.png',
//                                width: ScreenUtil().setWidth(22),
//                                height: ScreenUtil().setWidth(34),
//                                fit: BoxFit.contain),
//                            SizedBox(
//                              height: ScreenUtil().setWidth(10),
//                            ),
//                            Text('电话号',
//                                style: TextStyle(
//                                    fontSize: ScreenUtil().setSp(24),
//                                    color: Color.fromRGBO(95, 94, 94, 1)))
//                          ],
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      flex: 1,
//                      child: GestureDetector(
//                        onTap: () {},
//                        behavior: HitTestBehavior.opaque,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Image.asset('images/img_wechat_gray.png',
//                                width: ScreenUtil().setWidth(48),
//                                height: ScreenUtil().setWidth(34),
//                                fit: BoxFit.contain),
//                            SizedBox(
//                              height: ScreenUtil().setWidth(10),
//                            ),
//                            Text('微信号',
//                                style: TextStyle(
//                                    fontSize: ScreenUtil().setSp(24),
//                                    color: Color.fromRGBO(95, 94, 94, 1)))
//                          ],
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      flex: 1,
//                      child: GestureDetector(
//                        onTap: _showResumeList,
//                        behavior: HitTestBehavior.opaque,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Image.asset('images/img_send_resunme.png',
//                                width: ScreenUtil().setWidth(38),
//                                height: ScreenUtil().setWidth(34),
//                                fit: BoxFit.contain),
//                            SizedBox(
//                              height: ScreenUtil().setWidth(10),
//                            ),
//                            Text('发简历',
//                                style: TextStyle(
//                                    fontSize: ScreenUtil().setSp(24),
//                                    color: Color.fromRGBO(95, 94, 94, 1)))
//                          ],
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      flex: 1,
//                      child: GestureDetector(
//                        onTap: _disinterested,
//                        behavior: HitTestBehavior.opaque,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Image.asset('images/img_not_interested.png',
//                                width: ScreenUtil().setWidth(38),
//                                height: ScreenUtil().setWidth(34),
//                                fit: BoxFit.contain),
//                            SizedBox(
//                              height: ScreenUtil().setWidth(10),
//                            ),
//                            Text('不感兴趣',
//                                style: TextStyle(
//                                    fontSize: ScreenUtil().setSp(24),
//                                    color: Color.fromRGBO(95, 94, 94, 1)))
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(241, 242, 244, 1),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(28)),
                    controller: _scrollController,
                    itemBuilder: (context, index) {
//                      if (index == 0) {
//                        return ChatRoomIntro();
//                      }
                      if (index < (_chatList.length)) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: ChatRowItem(
                            chat:_chatList[index],
//                            index == 0 ? chatList[0] : chatList[index - 1],
                            index: index,
                            isBoss: false,
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
                            if(text.isEmpty){
                              return;
                            }
                            editController.text='';
                            model.sendMsg(widget.toId,text,fromRoleFlag: '1',toRoleFlag: '2');
                          },
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(38),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'images/img_service_add.png',
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
        }),);
  }

  /// 发送简历显示简历列表
  void _showResumeList() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ListDialog(
          menus: _resumeList,
          itemSelected: (index) {
            Navigator.pop(context);
          },
          cancel: () {
            Navigator.pop(context);
          },
          title: '简历',
        );
      },
    );
  }

  /// 不感兴趣
  void _disinterested() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) { return null;},
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, widget) {
        final curvedValue =
            Curves.easeInOut.transform(animation1.value) - 1.0;
        return Transform(
          transform:
          Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: ListMenuDialog(
              title: '不感兴趣',
              cancel: () {
                Navigator.pop(context);
              },
              confirm: () {
                Navigator.pop(context);
              },
              itemSelected: (index){
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return RemindDialog(
                      title: '确定反馈原因给该公司吗？',
                      titleColor: Color.fromRGBO(
                          51, 51, 51, 1),
                      cancelText: '取消',
                      cancelColor: Color.fromRGBO(
                          142, 190, 245, 1),
                      confirmText: '确定',
                      confirmColor: Color.fromRGBO(
                          142, 190, 245, 1),
                      cancel: () {
                        Navigator.pop(context);
                      },
                      confirm: () {
                        Navigator.pop(context);
                      },
                    );
                  },);
              },
              lists: _reportList,
            ),
          ),
        );
      },
    );
  }
}
