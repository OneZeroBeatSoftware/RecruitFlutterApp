import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/pages/setting/replace_email2_setting.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class ReplaceEmail1Setting extends StatefulWidget {
  @override
  _ReplaceEmail1SettingState createState() => _ReplaceEmail1SettingState();
}

class _ReplaceEmail1SettingState extends State<ReplaceEmail1Setting> {
  String email;

  @override
  void initState() {
    // TODO: implement initState
    email= Application.sp.getString('email');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      if(email==null||email.isEmpty){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReplaceEmail2Setting(
              operateEmailType: OperateEmailType.change,
            ),
          ),
        );
        email='***@jobpin.com';
      }
    });
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
          '绑定邮箱',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReplaceEmail2Setting(
                  operateEmailType: OperateEmailType.unbind,
                ),
              ),
            );
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(46)),
            child: Text(
              '解除',
              style: TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1),
                fontSize: ScreenUtil().setSp(32),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
              top: ScreenUtil().setWidth(60),
              bottom: ScreenUtil().setWidth(20),
            ),
            alignment: Alignment.center,
            child: Text(
              '您已绑定邮箱号',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color.fromRGBO(95, 94, 94, 1),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
            ),
            alignment: Alignment.center,
            child: Text(
              '$email',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color.fromRGBO(95, 94, 94, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(50),
              vertical: ScreenUtil().setWidth(60),
            ),
            child: MaterialButton(
              elevation: 0,
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReplaceEmail2Setting(
                      operateEmailType: OperateEmailType.change,
                    ),
                  ),
                );
              },
              textColor: Color.fromRGBO(159, 199, 235, 1),
              child: Text(
                "更 换",
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
