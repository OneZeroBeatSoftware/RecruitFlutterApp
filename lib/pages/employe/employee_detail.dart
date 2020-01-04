import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/pages/employe/boss_chat_room.dart';
import 'package:recruit_app/pages/employe/resume_edu_item.dart';
import 'package:recruit_app/pages/employe/resume_intent_item.dart';
import 'package:recruit_app/pages/employe/resume_project_item.dart';
import 'package:recruit_app/pages/employe/resume_work_item.dart';

class EmployeeDetail extends StatefulWidget {
  @override
  _EmployeeDetailState createState() {
    // TODO: implement createState
    return _EmployeeDetailState();
  }
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset(
                'images/ic_back_arrow.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  'images/ic_action_favor_off_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'images/ic_action_share_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'images/ic_action_report_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 18, bottom: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Bingo',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 38, 39, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '一零跳动•全栈工程师',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Color.fromRGBO(108, 111, 111, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              'images/avatar_14.png',
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '在职-暂不考虑',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Color.fromRGBO(40, 40, 40, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1个月前活跃',
                            style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Color.fromRGBO(159, 159, 159, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('6年',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(109, 110, 111, 1))),
                          SizedBox(width: 8),
                          Text('本科',
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(109, 110, 111, 1))),
                          SizedBox(width: 8),
                          Text('28岁',
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(109, 110, 111, 1))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PC、H5、Nodejs、小程序、移动端，掌握大前端所有技术栈；能够实现类Element-ui组件库，设计Vue组件；掌握Vue/React源码，MVVM库原理；了解Koa2源码，定制MVC开发框架；前端监控、性能优化、安全；自动化测试、发布、运维。',
                        style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          fontSize: 14,
                          color: Color.fromRGBO(99, 100, 102, 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '•',
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 193, 178, 1))),
                            TextSpan(
                                text: '  求职期望',
                                style: TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(56, 58, 58, 1))),
                          ],
                        ),
                      ),
                      ResumeIntentItem(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '•',
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 193, 178, 1))),
                            TextSpan(
                                text: '  工作经历',
                                style: TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(56, 58, 58, 1))),
                          ],
                        ),
                      ),
                      ResumeWorkItem(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '•',
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 193, 178, 1))),
                            TextSpan(
                                text: '  项目经历',
                                style: TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(56, 58, 58, 1))),
                          ],
                        ),
                      ),
                      ResumeProjectItem(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '•',
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 193, 178, 1))),
                            TextSpan(
                                text: '  教育经历',
                                style: TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(56, 58, 58, 1))),
                          ],
                        ),
                      ),
                      ResumeEduItem(),
                      Container(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: MaterialButton(
                    color: Color.fromRGBO(70, 192, 182, 1),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BossChatRoom()));
                    },
                    textColor: Colors.white,
                    child: Text("立即沟通"),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  )),
            ),
          ],
        ));
  }
}
