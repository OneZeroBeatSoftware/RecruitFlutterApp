import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/chat_room_intro.dart';
import 'package:recruit_app/pages/jobs/chat_setting.dart';

class CandidateRoom extends StatefulWidget {
  @override
  _CandidateRoomState createState() {
    // TODO: implement createState
    return _CandidateRoomState();
  }
}

class _CandidateRoomState extends State<CandidateRoom> {

  @override
  void initState() {
    super.initState();
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
            ChatRoomIntro(),
          ],
        ));
  }

  /// 发送简历显示简历列表
  void _showResumeList() {
  }

  /// 不感兴趣
  void _disinterested() {

  }
}
