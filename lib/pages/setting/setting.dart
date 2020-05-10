import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/user_entity.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/account/login/login_type.dart';
import 'package:recruit_app/pages/setting/account_bind_setting.dart';
import 'package:recruit_app/pages/setting/notify_setting.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  UserModel userModel;
  IdentityModel identityModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      identityModel=Provider.of<IdentityModel>(context);
      userModel=Provider.of<UserModel>(context);
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
          '设置',
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
                      '账号与绑定',
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
                        builder: (context) => AccountBindSetting()));
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
                      '通知与提醒',
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
                        builder: (context) => NotifySetting()));
            },
          ),
//          GestureDetector(
//            behavior: HitTestBehavior.opaque,
//            child: Container(
//              decoration: BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(
//                    color: Color.fromRGBO(159, 199, 235, 1),
//                    width: ScreenUtil().setWidth(1),
//                  ),
//                ),
//              ),
//              padding: EdgeInsets.symmetric(
//                vertical: ScreenUtil().setWidth(40),
//              ),
//              margin: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(48),
//              ),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Expanded(
//                    child: Text(
//                      '隐私设置',
//                      overflow: TextOverflow.ellipsis,
//                      maxLines: 1,
//                      style: TextStyle(
//                          color: Color.fromRGBO(95, 94, 94, 1),
//                          fontSize: ScreenUtil().setSp(28)),
//                    ),
//                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(20),
//                  ),
//                  Image.asset(
//                    'images/img_arrow_right_blue.png',
//                    width: ScreenUtil().setWidth(10),
//                    height: ScreenUtil().setWidth(20),
//                    fit: BoxFit.cover,
//                  )
//                ],
//              ),
//            ),
//            onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => PrivateSetting()));
//            },
//          ),
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
                      '切换身份',
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
              showDialog(
                  context: context,
                  builder: (context) {
                    return RemindDialog(
                      title: '您将切换至${identityModel.identity==Identity.boss?"应聘者":"招聘者"}身份',
                      titleColor: Color.fromRGBO(57, 57, 57, 1),
                      content: '系统将为您切换对应功能',
                      contentColor: Color.fromRGBO(57, 57, 57, 1),
                      cancelText: '取消',
                      cancelColor: Color.fromRGBO(142, 190, 245, 1),
                      confirmText: '确定',
                      confirmColor: Color.fromRGBO(142, 190, 245, 1),
                      cancel: (){
                        Navigator.pop(context);
                      },
                      confirm: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                        identityModel.changeIdentity(
                            identityModel.identity == Identity.employee
                                ? Identity.boss
                                : Identity.employee);
                      },
                    );
                  });
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
              onPressed: () async{
                UserEntity userEntity =await userModel.logout(context);
                if(userEntity!=null){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginType()), (check)=>false);
                }
              },
              textColor: Color.fromRGBO(159, 199, 235, 1),
              child: Text(
                "退出登录",
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
