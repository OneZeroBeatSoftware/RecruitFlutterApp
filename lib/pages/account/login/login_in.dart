import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/account/login/email_login_in.dart';
import 'package:recruit_app/pages/account/login/msg_login_in.dart';
import 'package:recruit_app/pages/account/pwd/reset_pwd.dart';
import 'package:recruit_app/pages/account/register/register.dart';
import 'package:recruit_app/pages/boss/boss_base_info.dart';
import 'package:recruit_app/pages/home/recruit_home_app.dart';
import 'package:recruit_app/pages/mine/user_base_info.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class LoginIn extends StatefulWidget {
  final bool isReLogin;

  const LoginIn({Key key, this.isReLogin=false}) : super(key: key);
  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  TextEditingController _phoneController;
  TextEditingController _pwdController;

  UserModel userModel;
  @override
  void initState() {
    if(Application.sp.get('loginName')!=null){
      _phoneController = TextEditingController(text: '${Application.sp.get('loginName')}');
    }else {
      _phoneController = TextEditingController();
    }
    if(Application.sp.get('loginPwd')!=null){
      _pwdController = TextEditingController(text: '${Application.sp.get('loginPwd')}');
    }else {
      _pwdController = TextEditingController();
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      userModel=Provider.of<UserModel>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leftText: '返回',
        leading: 'images/img_arrow_left_blue.png',
        leftListener: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SafeArea(
        top:false,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
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
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            cursorColor: Color.fromRGBO(159, 199, 235, 1),
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(14)),
                              border: InputBorder.none,
                              hintText: '手机号码',
                              hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(176, 181, 180, 1),
                              ),
                            ),
                            controller: _phoneController,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            '验证码登录',
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
                                  builder: (context) => MsgLoginIn(),
                                ));
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
                            autofocus: false,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            obscureText: true,
                            cursorColor: Color.fromRGBO(159, 199, 235, 1),
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(14)),
                              border: InputBorder.none,
                              hintText: '密码',
                              hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(176, 181, 180, 1),
                              ),
                            ),
                            controller: _pwdController,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            '忘记密码',
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
                                builder: (context) => ResetPwd(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(
                  //     top: ScreenUtil().setWidth(26),
                  //     bottom: ScreenUtil().setWidth(40),
                  //   ),
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     behavior: HitTestBehavior.opaque,
                  //     child: Text(
                  //       '切换邮箱登录',
                  //       style: TextStyle(
                  //         fontSize: ScreenUtil().setSp(24),
                  //         color: Color.fromRGBO(159, 199, 235, 1),
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       FocusScope.of(context).requestFocus(FocusNode());
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => EmailLoginIn(),
                  //           ));
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: ScreenUtil().setWidth(66),
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      String phone = _phoneController.text;
                      String pwd = _pwdController.text;
                      if (phone.isEmpty) {
                        Utils.showToast('请填写手机号码');
                        return;
                      }
                      if (pwd.isEmpty) {
                        Utils.showToast('请填写登录密码');
                        return;
                      }
                      userModel.login(context, phone, pwd).then((value){
                        if(value!=null){
                          Application.sp.setString('loginName', phone);
                          Application.sp.setString('loginPwd', pwd);
                          IdentityModel identityModel=Provider.of<IdentityModel>(context);
                          if (identityModel.identity==Identity.boss&&Application.sp.get('recruiterId')==null){
                            Navigator.push<BossBaseInfoResult>(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BossBaseInfo(enterType: BossEnterType.init,),),).then((value) {
                              if (value != null) {
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecruitHomeApp()),
                                );
                              }
                            });
                          }else {
                            Navigator.pop(context,'success');
                            if(!widget.isReLogin){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecruitHomeApp()),
                              );
                            }
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
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                       GestureDetector(
                         behavior: HitTestBehavior.opaque,
                         child: Text(
                           '先逛逛',
                           style: TextStyle(
                             fontSize: ScreenUtil().setSp(24),
                             color: Color.fromRGBO(176, 181, 180, 1),
                           ),
                         ),
                         onTap: () {
                           FocusScope.of(context).requestFocus(FocusNode());

                           Application.sp.setString('token', '');
                           Application.sp.setString('jobSeekerId', null);
                           Application.sp.setString('recruiterId', null);
                           Application.sp.setString('userId',null);
                           Application.sp.setString('phone', '');
                           Application.sp.setString('email', '');

                           Navigator.pop(context);
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => RecruitHomeApp(),
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
//            Positioned(
//              child: Row(
//                children: <Widget>[
//                  GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    child: Image.asset(
//                      'images/img_login_wechat.png',
//                      width: ScreenUtil().setWidth(50),
//                      height: ScreenUtil().setWidth(50),
//                      fit: BoxFit.contain,
//                    ),
//                    onTap: () {
//                      FocusScope.of(context).requestFocus(FocusNode());
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ThirdRegister(),
//                        ),
//                      );
//                    },
//                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(30),
//                  ),
//                  GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    child: Image.asset(
//                      'images/img_login_facebook.png',
//                      width: ScreenUtil().setWidth(50),
//                      height: ScreenUtil().setWidth(50),
//                      fit: BoxFit.contain,
//                    ),
//                    onTap: () {
//                      FocusScope.of(context).requestFocus(FocusNode());
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ThirdRegister(),
//                        ),
//                      );
//                    },
//                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(30),
//                  ),
//                  GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    child: Image.asset(
//                      'images/img_login_google.png',
//                      width: ScreenUtil().setWidth(50),
//                      height: ScreenUtil().setWidth(50),
//                      fit: BoxFit.contain,
//                    ),
//                    onTap: () {
//                      FocusScope.of(context).requestFocus(FocusNode());
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ThirdRegister(),
//                        ),
//                      );
//                    },
//                  ),
//                ],
//              ),
//              bottom: ScreenUtil().setWidth(136),
//            ),
          ],
        ),
      ),
    );
  }
}
