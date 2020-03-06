import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/setting/ignore_setting.dart';
import 'package:recruit_app/pages/setting/right_setting.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_switch_widget.dart';

class PrivateSetting extends StatefulWidget {
  @override
  _PrivateSettingState createState() => _PrivateSettingState();
}

class _PrivateSettingState extends State<PrivateSetting> {
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
          '隐私设置',
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
                      '屏蔽公司',
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
                        builder: (context) => IgnoreSetting()));
            },
          ),
          CommonSwitch(
            value: true,
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
            content: '隐藏简历',
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
            content: '对HR隐藏简历',
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
                      '权限管理',
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
                        builder: (context) => RightSetting()));
            },
          ),
        ],
      ),
    );
  }
}
