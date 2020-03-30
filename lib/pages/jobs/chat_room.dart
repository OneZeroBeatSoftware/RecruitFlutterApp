import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/chat_list.dart';
import 'package:recruit_app/pages/jobs/chat_room_intro.dart';
import 'package:recruit_app/pages/jobs/chat_row_item.dart';
import 'package:recruit_app/pages/jobs/chat_setting.dart';
import 'package:recruit_app/widgets/craft_list_dialog.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() {
    // TODO: implement createState
    return _ChatRoomState();
  }
}

class _ChatRoomState extends State<ChatRoom> {
  List<Chat> _chatList = ChatData.loadChats();
  final ScrollController _scrollController = ScrollController();

  List<String> _resumeList = [];
  List<String> _reportList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _resumeList.add('平面设计');
    }
    for (int i = 0; i < 15; i++) {
      _reportList.add('已找到工作');
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
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
              Text('艾乐科技',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(20, 20, 20, 1))),
              Text('在线',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
            ],
          ),
          leading: IconButton(
              icon: Image.asset(
                'images/img_arrow_left_black.png',
                width: ScreenUtil().setWidth(15),
                height: ScreenUtil().setWidth(30),
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  'images/img_menu_black.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(6),
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatSetting()));
                }),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(26),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/img_tel_gray.png',
                              width: ScreenUtil().setWidth(22),
                              height: ScreenUtil().setWidth(34),
                              fit: BoxFit.contain),
                          SizedBox(
                            height: ScreenUtil().setWidth(10),
                          ),
                          Text('电话号',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(95, 94, 94, 1)))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/img_wechat_gray.png',
                              width: ScreenUtil().setWidth(48),
                              height: ScreenUtil().setWidth(34),
                              fit: BoxFit.contain),
                          SizedBox(
                            height: ScreenUtil().setWidth(10),
                          ),
                          Text('微信号',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(95, 94, 94, 1)))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: _showResumeList,
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/img_send_resunme.png',
                              width: ScreenUtil().setWidth(38),
                              height: ScreenUtil().setWidth(34),
                              fit: BoxFit.contain),
                          SizedBox(
                            height: ScreenUtil().setWidth(10),
                          ),
                          Text('发简历',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(95, 94, 94, 1)))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: _disinterested,
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/img_not_interested.png',
                              width: ScreenUtil().setWidth(38),
                              height: ScreenUtil().setWidth(34),
                              fit: BoxFit.contain),
                          SizedBox(
                            height: ScreenUtil().setWidth(10),
                          ),
                          Text('不感兴趣',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(95, 94, 94, 1)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(241, 242, 244, 1),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(28)),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ChatRoomIntro();
                    }
                    if (index < (_chatList.length + 1)) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: ChatRowItem(
                          chat:
                              index == 0 ? _chatList[0] : _chatList[index - 1],
                          index: index - 1,
                          isBoss: false,
                        ),
                        onTap: () {},
                      );
                    }
                    return null;
                  },
                  itemCount: _chatList.length + 1,
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
                          print(text);
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
        ));
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
