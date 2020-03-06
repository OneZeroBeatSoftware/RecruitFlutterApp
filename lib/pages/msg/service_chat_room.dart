import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/chat_list.dart';
import 'package:recruit_app/pages/jobs/chat_row_item.dart';

class ServiceChatRoom extends StatefulWidget {
  @override
  _ServiceChatRoomState createState() {
    // TODO: implement createState
    return _ServiceChatRoomState();
  }
}

class _ServiceChatRoomState extends State<ServiceChatRoom> {
  List<Chat> _chatList = ChatData.loadChats();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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
              Text('客服',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(20, 20, 20, 1))),
              SizedBox(
                height: 8,
              ),
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
                onPressed: () {}),
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
                  Expanded(
                    flex: 1,
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
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/img_email_gray.png',
                            width: ScreenUtil().setWidth(38),
                            height: ScreenUtil().setWidth(34),
                            fit: BoxFit.contain),
                        SizedBox(
                          height: ScreenUtil().setWidth(10),
                        ),
                        Text('邮箱号',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(250, 250, 250, 1),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index < (_chatList.length)) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: ChatRowItem(
                          chat: _chatList[index],
                          index: index,
                          isBoss: false,
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
}
