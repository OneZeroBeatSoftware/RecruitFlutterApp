import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/chat_setting_remark.dart';
import 'package:recruit_app/pages/jobs/report.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_switch_widget.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';

class ChatSetting extends StatefulWidget {
  @override
  _ChatSettingState createState() => _ChatSettingState();
}

class _ChatSettingState extends State<ChatSetting> {
  /// 举报内容
  List<String> _reports=[];

  @override
  void initState() {
    // TODO: implement initState
    for (int i1 = 0; i1 < 20; i1++) {
      _reports.add('广告骚扰');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '聊天设置',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setWidth(40),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '设置备注和标签',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color.fromRGBO(95, 94, 94, 1),
                          fontSize: ScreenUtil().setSp(28)),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Image.asset(
                    'images/img_arrow_right_blue.png',
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setWidth(20),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatRemarkSetting()));
            },
          ),
          CommonSwitch(
            value: false,
            onChanged: (value) {},
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(20),
            ),
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1),
              ),
            ),
            content: '置顶联系人',
            activeColor: Color.fromRGBO(105, 191, 211, 1),
          ),
          CommonSwitch(
            value: false,
            onChanged: (value) {},
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(20),
            ),
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1),
              ),
            ),
            content: '屏蔽对方',
            activeColor: Color.fromRGBO(105, 191, 211, 1),
          ),
          CommonSwitch(
            value: false,
            onChanged: (value) {},
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(20),
            ),
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1),
              ),
            ),
            content: '将对方加入黑名单',
            activeColor: Color.fromRGBO(105, 191, 211, 1),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setWidth(40),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '举报对方',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color.fromRGBO(95, 94, 94, 1),
                          fontSize: ScreenUtil().setSp(28)),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Image.asset(
                    'images/img_arrow_right_blue.png',
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setWidth(20),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            onTap: () {
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
                        title: '举报',
                        cancel: () {
                          Navigator.pop(context);
                        },
                        confirm: () {
                          Navigator.pop(context);
                        },
                        itemSelected: (index){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Report()));
                        },
                        lists: _reports,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(50),
              vertical: ScreenUtil().setWidth(80),
            ),
            child: MaterialButton(
              elevation: 0,
              color: Colors.white,
              onPressed: () {},
              textColor: Color.fromRGBO(159, 199, 235, 1),
              child: Text(
                "终止沟通",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(30),
                vertical: ScreenUtil().setWidth(20),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(2),
                  ),
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(1000))),
            ),
          ),
        ],
      ),
    );
  }
}
