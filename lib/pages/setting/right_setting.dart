import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_switch_widget.dart';

class RightSetting extends StatefulWidget {
  @override
  _RightSettingState createState() => _RightSettingState();
}

class _RightSettingState extends State<RightSetting> {
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
          '权限设置',
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
            content: '允许软件访问位置信息',
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
            content: '允许软件访问日历信息',
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
            content: '允许软件访问相册信息',
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
            content: '允许软件使用相机功能',
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
            content: '允许软件使用麦克风功能',
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
            content: '允许软件访问通讯录信息',
            activeColor: Color.fromRGBO(105, 191, 211, 1),
          ),
        ],
      ),
    );
  }
}
