
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class PwdSetting extends StatefulWidget {
  @override
  _PwdSettingState createState() => _PwdSettingState();
}

class _PwdSettingState extends State<PwdSetting> {
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
          '密码设置',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(48),
          right: ScreenUtil().setWidth(48),
          top: ScreenUtil().setWidth(48),
          bottom: ScreenUtil().setWidth(48),
        ),
        child: ListView(
          children: [
            Text(
              '旧密码',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(20, 20, 20, 1),
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(15),
                bottom: ScreenUtil().setWidth(40),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      obscureText: true,
                      cursorColor: Color.fromRGBO(159, 199, 235, 1),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(95, 94, 94, 1)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(15),
                          bottom: ScreenUtil().setWidth(15),
                        ),
                        border: InputBorder.none,
                        hintText: '请输入旧密码',
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '新密码',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(20, 20, 20, 1),
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(15),
                bottom: ScreenUtil().setWidth(40),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      obscureText: true,
                      cursorColor: Color.fromRGBO(159, 199, 235, 1),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(95, 94, 94, 1)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(15),
                          bottom: ScreenUtil().setWidth(15),
                        ),
                        border: InputBorder.none,
                        hintText: '请输入新密码',
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '确认密码',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(20, 20, 20, 1),
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(15),
                bottom: ScreenUtil().setWidth(70),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      obscureText: true,
                      cursorColor: Color.fromRGBO(159, 199, 235, 1),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(95, 94, 94, 1)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(15),
                          bottom: ScreenUtil().setWidth(15),
                        ),
                        border: InputBorder.none,
                        hintText: '请确认新密码',
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              elevation: 0,
              color: Colors.white,
              onPressed: () {},
              textColor: Color.fromRGBO(159, 199, 235, 1),
              child: Text(
                "修 改",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
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
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}
