import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/account/register/register.dart';
import 'package:recruit_app/pages/boss/boss_base_info.dart';
import 'package:recruit_app/pages/home/recruit_home_app.dart';
import 'package:recruit_app/pages/mine/user_base_info.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class MsgLoginIn extends StatefulWidget {
  @override
  _MsgLoginInState createState() => _MsgLoginInState();
}

class _MsgLoginInState extends State<MsgLoginIn> {
  UserModel _userModel;
  TextEditingController _phoneController;
  TextEditingController _codeController;
  Timer _timer;
  var _countDownTime = 0;

  void _startCountDown() {
    _countDownTime = 60;
    final call = (time) {
      setState(() {
        if (_countDownTime < 1) {
          _timer.cancel();
        } else {
          _countDownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }

  @override
  void initState() {
    // TODO: implement initState
    _phoneController=TextEditingController();
    _codeController=TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _userModel=Provider.of<UserModel>(context);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    if (_timer != null) {
      _timer.cancel();
    }
    if(_phoneController!=null){
      _phoneController.dispose();
    }
    if(_codeController!=null){
      _codeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leftText: '返回',
        leading: 'images/img_arrow_left_blue.png',
        leftListener: (){
          Navigator.pop(context);
        },
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SafeArea(
        top:false,
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(124),
            right: ScreenUtil().setWidth(124),
            top: ScreenUtil().setWidth(168),
            bottom: ScreenUtil().setWidth(20),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(229, 229, 229, 1),
                      width: ScreenUtil().setWidth(2),
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(14)),
                          border: InputBorder.none,
                          hintText: '手机号码',
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(176, 181, 180, 1),
                          ),
                        ),
                        onChanged: (text) {},
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        _countDownTime > 0
                            ? "${_countDownTime}s后重新获取"
                            : "获取验证码",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_countDownTime > 0) return;
                        if (_phoneController.text.isEmpty) {
                          Utils.showToast('请填写手机号');
                          return;
                        }
                        _getPhoneCode(_phoneController.text);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(14),
                  bottom: ScreenUtil().setWidth(70),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(229, 229, 229, 1),
                      width: ScreenUtil().setWidth(2),
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        maxLines: 1,
                        controller: _codeController,
                        textAlign: TextAlign.start,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '验证码',
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
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
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_phoneController.text.isEmpty) {
                    Utils.showToast('请填写手机号');
                    return;
                  }
                  if (_codeController.text.isEmpty) {
                    Utils.showToast('请填写验证码');
                    return;
                  }
                  _userModel.phoneCodeLogin(context, _phoneController.text, _codeController.text).then((value){
                    if(value!=null){
                      IdentityModel identityModel=Provider.of<IdentityModel>(context);
                      if (identityModel.identity==Identity.boss&&Application.sp.get('recruiterId')==null){
                        Navigator.push<BossBaseInfoResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BossBaseInfo(enterType: BossEnterType.init,),),).then((value) {
                          if (value != null) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecruitHomeApp()),
                            );
                          }
                        });
                      } else if(identityModel.identity==Identity.employee&&Application.sp.get('jobSeekerId')==null){
                        Navigator.push<UserBaseInfoResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserBaseInfo(enterType: EnterType.init,),),).then((value) {
                          if (value != null) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecruitHomeApp()),
                            );
                          }
                        });
                      }else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecruitHomeApp()),
                        );
                      }
                    }
                  });
                },
                textColor: Color.fromRGBO(159, 199, 235, 1),
                child: Text(
                  "登 录",
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
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        '新用户注册',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 获取手机验证码
  _getPhoneCode(String phone) {
    _userModel.getPhoneCode(context, phone).then((entity) {
      if (entity != null) {
        _startCountDown();
      }
    });
  }
}
