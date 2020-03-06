import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

enum OperateEmailType { bind, unbind, change }

class ReplaceEmail2Setting extends StatefulWidget {
  final OperateEmailType operateEmailType;

  const ReplaceEmail2Setting(
      {Key key, this.operateEmailType = OperateEmailType.bind})
      : super(key: key);

  @override
  _ReplaceEmail2SettingState createState() => _ReplaceEmail2SettingState();
}

class _ReplaceEmail2SettingState extends State<ReplaceEmail2Setting> {
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
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
          widget.operateEmailType == OperateEmailType.unbind ? '解绑邮箱' : '绑定邮箱',
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
              widget.operateEmailType == OperateEmailType.bind
                  ? '输入您的邮箱号'
                  : (widget.operateEmailType == OperateEmailType.unbind
                      ? '当前邮箱号'
                      : '输入新的邮箱号'),
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
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      textAlign: TextAlign.start,
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
                        hintText:
                            widget.operateEmailType == OperateEmailType.bind
                                ? '请输入您的邮箱号'
                                : (widget.operateEmailType ==
                                        OperateEmailType.unbind
                                    ? '请输入当前邮箱号'
                                    : '请输入新的邮箱号'),
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
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(14),
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
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      cursorColor: Color.fromRGBO(159, 199, 235, 1),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(95, 94, 94, 1)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(15),
                          top: ScreenUtil().setWidth(15),
                          bottom: ScreenUtil().setWidth(15),
                        ),
                        border: InputBorder.none,
                        hintText: '输入验证码',
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      _countDownTime > 0 ? "${_countDownTime}s后重新获取" : "获取验证码",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_countDownTime > 0) return;
                      _startCountDown();
                    },
                  ),
                ],
              ),
            ),
            MaterialButton(
              elevation: 0,
              color: Colors.white,
              onPressed: () {
                if(widget.operateEmailType == OperateEmailType.unbind){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return RemindDialog(
                          title: '确定解除邮箱绑定吗？',
                          titleColor: Color.fromRGBO(57, 57, 57, 1),
                          content: '您将在无法使用邮箱登陆',
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
                          },
                        );
                      });
                }
              },
              textColor: Color.fromRGBO(159, 199, 235, 1),
              child: Text(
                widget.operateEmailType == OperateEmailType.unbind ? '解 绑' : '绑 定',
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
