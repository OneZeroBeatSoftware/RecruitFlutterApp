import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/account/login/login_in.dart';

class LoginType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 255, 254, 1),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: ScreenUtil().setHeight(360),
            child: Image.asset(
              'images/img_splash_earth.png',
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(360),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(358),
            child: Text(
              'SLOGAN',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(44),
                color: Color.fromRGBO(84, 128, 194, 1),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(126),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  elevation: 1,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginIn()),
                    );
                  },
                  textColor: Color.fromRGBO(159, 199, 235, 1),
                  child: Text(
                    "招 聘",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(44),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(70),
                    vertical: ScreenUtil().setHeight(14),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(64),
                ),
                MaterialButton(
                  elevation: 1,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginIn()),
                    );
                  },
                  textColor: Color.fromRGBO(159, 199, 235, 1),
                  child: Text(
                    "应 聘",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(44),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(70),
                    vertical: ScreenUtil().setHeight(14),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
