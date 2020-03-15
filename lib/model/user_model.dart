import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recruit_app/entity/user_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

import '../application.dart';

class UserModel with ChangeNotifier {
  UserEntity _user;

  UserEntity get user => _user;

  /// 初始化 User
  void initUser() {
    if (Application.sp.containsKey('user')) {
      String s = Application.sp.getString('user');
      _user=UserEntity().fromJson(json.decode(s));
    }
  }

  /// 登录
  Future<UserEntity> login(BuildContext context, String phone, String pwd) async {
    UserEntity user = await NetUtils.login(context, phone, pwd);
    if (user.statusCode ==200) {
      Utils.showToast(user.msg ?? '登录成功');
      Application.sp.setString('token', user.data);
      _saveUserInfo(user);
      return user;
    }
    Utils.showToast(user.msg ?? '登录失败，请检查账号密码');
    return null;
  }

  /// 退出登录
  Future<UserEntity> logout(BuildContext context) async {
    UserEntity user = await NetUtils.logout(context);
    if (user.statusCode ==200) {
      Utils.showToast(user.msg ?? '退出登录成功');
      Application.sp.setString('token', '');
      return user;
    }
    Utils.showToast(user.msg ?? '退出登录失败，请重试');
    return null;
  }

  /// 注册
  Future<UserEntity> register(BuildContext context,String userName, String pwd,String pwd2,String phone,String email) async {

    UserEntity user = await NetUtils.register(context, userName, pwd,pwd2,phone,email);
    if (user.statusCode ==200) {
      Utils.showToast(user.msg ?? '注册成功');
      return user;
    }
    Utils.showToast(user.msg ?? '注册失败，请重新尝试');
    return null;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(UserEntity user) {
    _user = user;
    Application.sp.setString('user', json.encode(user.toJson()));
  }
}
