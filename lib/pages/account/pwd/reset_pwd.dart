import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class ResetPwd extends StatefulWidget {
  @override
  _ResetPwdState createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  UserModel userModel;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _pwd2Controller = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  Timer _timer;
  var _countDownTime=0;

  void _startCountDown(){
    _countDownTime=60;
    final call=(time){
      setState(() {
        if(_countDownTime<1){
          _timer.cancel();
        }else {
          _countDownTime-=1;
        }
      });
    };
    _timer=Timer.periodic(Duration(seconds: 1), call);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      userModel=Provider.of<UserModel>(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_pwdController!=null){
      _pwdController.dispose();
    }
    if(_pwd2Controller!=null){
      _pwd2Controller.dispose();
    }
    if(_phoneController!=null){
      _phoneController.dispose();
    }
    if(_codeController!=null){
      _codeController.dispose();
    }
    super.dispose();
    if(_timer!=null){
      _timer.cancel();
    }
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
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        controller: _phoneController,
                        textAlign: TextAlign.start,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(14)),
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
                        maxLines: 1,
                        controller: _codeController,
                        textAlign: TextAlign.start,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(14)),
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
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        _countDownTime>0?"${_countDownTime}s后重新获取":"获取验证码",
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
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(14)),
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
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        controller: _pwdController,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '输入6~12位密码',
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
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        controller: _pwd2Controller,
                        cursorColor: Color.fromRGBO(159, 199, 235, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '确认密码',
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
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  String phone = _phoneController.text;
                  String pwd = _pwdController.text;
                  String pwd2 = _pwd2Controller.text;
                  String code=_codeController.text;
                  if (phone.isEmpty) {
                    Utils.showToast('请填写手机号');
                    return;
                  }
                  if (code.isEmpty) {
                    Utils.showToast('请填写验证码');
                    return;
                  }
                  if (pwd.isEmpty) {
                    Utils.showToast('请填写密码');
                    return;
                  }
                  if (pwd.length < 6) {
                    Utils.showToast('密码长度不得少于6位');
                    return;
                  }
                  if (pwd2.isEmpty) {
                    Utils.showToast('请确认密码');
                    return;
                  }
                  if (pwd != pwd2) {
                    Utils.showToast('两次密码输入不一致');
                    return;
                  }
                  BaseRespEntity baseEntity =await userModel.resetPwd(context,phone,code,pwd,pwd2);
                  if(baseEntity!=null){
                    Navigator.pop(context);
                  }
                },
                textColor: Color.fromRGBO(159, 199, 235, 1),
                child: Text(
                  "重 置",
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
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 获取手机验证码
  _getPhoneCode(String phone) {
    userModel.getPhoneCode(context, phone).then((entity) {
      if (entity != null) {
        _startCountDown();
      }
    });
  }
}
