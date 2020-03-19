import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/account/login/login_in.dart';
import 'package:recruit_app/utils/net_utils.dart';

import '../../../application.dart';

class LoginType extends StatelessWidget {
  void initSetting(BuildContext context) async {
    await Application.initSp();
    UserModel userModel = Provider.of<UserModel>(context);
    userModel.initUser();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    NetUtils.init();
    initSetting(context);
    IdentityModel identityModel=Provider.of<IdentityModel>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 255, 254, 1),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: ScreenUtil().setWidth(360),
            child: Image.asset(
              'images/img_splash_earth.png',
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setWidth(360),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setWidth(358),
            child: Text(
              'SLOGAN',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(44),
                color: Color.fromRGBO(84, 128, 194, 1),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setWidth(126),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  elevation: 1,
                  color: Colors.white,
                  onPressed: () {
                    identityModel.changeIdentity(Identity.boss);
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
                    vertical: ScreenUtil().setWidth(14),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(64),
                ),
                MaterialButton(
                  elevation: 1,
                  color: Colors.white,
                  onPressed: () {
                    identityModel.changeIdentity(Identity.employee);
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
                    vertical: ScreenUtil().setWidth(14),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
