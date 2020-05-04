import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/account/login/login_in.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application.dart';

class LoginType extends StatefulWidget {
  @override
  _LoginTypeState createState() {
    // TODO: implement createState
    return _LoginTypeState();
  }
}

class _LoginTypeState extends State<LoginType> {
  String vInfo = '';
  String progress = '';

  void initSetting(BuildContext context) async {
    await Application.initSp();
    UserModel userModel = Provider.of<UserModel>(context);
    userModel.initUser();
  }

  void _initData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      vInfo = Platform.isIOS ? 'iOS_$version' : 'android_$version';
    });
  }

  void _updateVersion() async {
    if (Platform.isIOS) {
      String url =
          'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8'; // 这是微信的地址，到时候换成自己的应用的地址
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isAndroid) {
      String url = 'http://x2.c1578dn.cn/v13/hll/iReader.apk';
      try {
        OtaUpdate().execute(url).listen(
          (OtaEvent event) {
            print('status:${event.status},value:${event.value}');
            switch (event.status) {
              case OtaStatus.DOWNLOADING: // 下载中
                setState(() {
                  progress = '下载进度:${event.value}%';
                });
                break;
              case OtaStatus.INSTALLING: //安装中
                break;
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
                print('更新失败，请稍后再试');
                break;
              default: // 其他问题
                break;
            }
          },
        );
      } catch (e) {
        print('更新失败，请稍后再试');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    NetUtils.init();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      initSetting(context);
    });
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.init(context, width: 750, height: 1334);
    IdentityModel identityModel = Provider.of<IdentityModel>(context);
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
            child: Row(
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
