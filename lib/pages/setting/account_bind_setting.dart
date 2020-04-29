import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/pages/setting/pwd_setting.dart';
import 'package:recruit_app/pages/setting/replace_email1_setting.dart';
import 'package:recruit_app/pages/setting/replace_phone1_setting.dart';
import 'package:recruit_app/pages/setting/third_part_bind_setting.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class AccountBindSetting extends StatefulWidget {
  @override
  _AccountBindSettingState createState() => _AccountBindSettingState();
}

class _AccountBindSettingState extends State<AccountBindSetting> {
  @override
  Widget build(BuildContext context) {
    String phone= Application.sp.getString('phone');
    String email= Application.sp.getString('email');
    if(phone!=null&&phone.isNotEmpty){
      phone='已绑定';
    }else {
      phone='未绑定';
    }
    if(email!=null&&email.isNotEmpty){
      email='已绑定';
    }else {
      email='未绑定';
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '账号与绑定',
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
                      '修改手机号',
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
                  Text(
                    '$phone',
                    style: TextStyle(
                        color: Color.fromRGBO(176, 181, 180, 1),
                        fontSize: ScreenUtil().setSp(24)),
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
                      builder: (context) => ReplacePhone1Setting()));
            },
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
                      '设置密码',
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
                  Text(
                    '去设置',
                    style: TextStyle(
                        color: Color.fromRGBO(176, 181, 180, 1),
                        fontSize: ScreenUtil().setSp(24)),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PwdSetting()));
            },
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
                      '邮箱绑定',
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
                  Text(
                    '$email',
                    style: TextStyle(
                        color: Color.fromRGBO(176, 181, 180, 1),
                        fontSize: ScreenUtil().setSp(24)),
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
                      builder: (context) => ReplaceEmail1Setting()));
            },
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
                      '绑定第三方应用',
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
                  Text(
                    '',
                    style: TextStyle(
                        color: Color.fromRGBO(176, 181, 180, 1),
                        fontSize: ScreenUtil().setSp(24)),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdBindSetting()));
            },
          ),
        ],
      ),
    );
  }
}
