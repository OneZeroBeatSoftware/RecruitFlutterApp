import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/chat_room.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/msg/msg_chat_item.dart';
import 'package:recruit_app/pages/msg/msg_interview_item.dart';
import 'package:recruit_app/pages/msg/msg_notify.dart';
import 'package:recruit_app/pages/msg/msg_notify_item.dart';
import 'package:recruit_app/pages/msg/service_chat_room.dart';
import 'package:recruit_app/widgets/badge_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MsgList extends StatefulWidget {
  @override
  _MsgListState createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> {
  bool _firstType = true;
  bool _secondType = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(28),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BadgeView(
                    badgeSize: ScreenUtil().setWidth(10),
                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
                    isShowBadge: false,
                    content: '互动',
                    fontWeight:
                        _firstType ? FontWeight.bold : FontWeight.normal,
                    fontSize: ScreenUtil().setSp(36),
                    textColor: _firstType
                        ? Color.fromRGBO(20, 20, 20, 1)
                        : Color.fromRGBO(95, 94, 94, 1),
                    onTap: () {
                      setState(() {
                        _firstType = true;
                        _secondType = true;
                      });
                    },
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(60),
                  ),
                  BadgeView(
                    badgeSize: ScreenUtil().setWidth(10),
                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
                    isShowBadge: true,
                    content: '通知',
                    fontWeight:
                        _firstType ? FontWeight.normal : FontWeight.bold,
                    fontSize: ScreenUtil().setSp(36),
                    textColor: _firstType
                        ? Color.fromRGBO(95, 94, 94, 1)
                        : Color.fromRGBO(20, 20, 20, 1),
                    onTap: () {
                      setState(() {
                        _firstType = false;
                        _secondType = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BadgeView(
                    badgeSize: ScreenUtil().setWidth(10),
                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
                    isShowBadge: false,
                    content: _firstType ? '招呼' : '面试邀请',
                    fontWeight:
                        _secondType ? FontWeight.bold : FontWeight.normal,
                    fontSize: ScreenUtil().setSp(32),
                    textColor: _secondType
                        ? Color.fromRGBO(68, 77, 151, 1)
                        : Color.fromRGBO(95, 94, 94, 1),
                    onTap: () {
                      setState(() {
                        _secondType = true;
                      });
                    },
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  BadgeView(
                    badgeSize: ScreenUtil().setWidth(10),
                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
                    isShowBadge: true,
                    content: _firstType ? '沟通中' : '系统',
                    fontWeight:
                        _secondType ? FontWeight.normal : FontWeight.bold,
                    fontSize: ScreenUtil().setSp(32),
                    textColor: _secondType
                        ? Color.fromRGBO(95, 94, 94, 1)
                        : Color.fromRGBO(68, 77, 151, 1),
                    onTap: () {
                      setState(() {
                        _secondType = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
              ),
              height: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(159, 199, 235, 1),
            ),
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((cxt, idx) {
                      var key = GlobalKey<SlideButtonState>();
                      if (_firstType && _secondType) {
                        return GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
                        },behavior: HitTestBehavior.opaque,child: MsgChatItem(btnKey: key),);
                      } else if (_firstType && !_secondType) {
                        return GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
                        },behavior: HitTestBehavior.opaque,child: MsgChatItem(btnKey: key),);
                      } else if (!_firstType && _secondType) {
                        return GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetail(jobDetailType: JobDetailType.interview,)));
                        },behavior: HitTestBehavior.opaque,child: MsgInterviewItem(btnKey: key),);
                      } else if (!_firstType && !_secondType) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: MsgNotifyItem(
                            btnKey: key,
                            title: idx % 2 == 0 ? '通知' : '我的客服',
                            content: idx % 2 == 0
                                ? '明天您将参加一场面试，请您注意安排好行程做好 准备，祝您面试顺利。'
                                : '您好，请问有什么可以为您服务的吗？',
                            imgPath: idx % 2 == 0
                                ? 'images/img_notify_blue.png'
                                : 'images/img_service_blue.png',
                          ),
                          onTap: () {
                            if(idx%2==0){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MsgNotify()));
                            }else {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceChatRoom()));
                            }
                          },
                        );
                      }
                      return null;
                    }, childCount: 2),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(48),
                              right: ScreenUtil().setWidth(48),
                              top: ScreenUtil().setWidth(24),
                            ),
                            child: Text(
                              _firstType
                                  ? '以上是30天内的联系人'
                                  : _secondType
                                      ? ''
                                      : '客服电话 888-888-8888\n工作时间 09:30-18:30',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(22),
                                height: 1.4,
                                color: Color.fromRGBO(176, 181, 180, 1),
                              ),
                            ),
                          ),
                          visible: _firstType || !_secondType,
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(44),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
