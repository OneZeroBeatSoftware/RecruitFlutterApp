import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
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
      Application.sp.setString('token', user.data.token);
      Application.sp.setString('jobSeekerId', user.data.jobSeekerId);
      Application.sp.setString('recruiterId', user.data.recruiterId);
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

  /// 修改密码
  Future<BaseRespEntity> modifyPwd(BuildContext context,String oldPassword, String newPassword,String newPassword2) async {
    BaseRespEntity baseEntity = await NetUtils.modifyPwd(context,oldPassword,newPassword,newPassword2);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '密码修改成功');
      Application.sp.setString('token', '');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '密码修改失败，请重试');
    return null;
  }

  /// 获取邮箱验证码
  Future<BaseRespEntity> getEmailCode(BuildContext context,String email) async {
    BaseRespEntity baseEntity = await NetUtils.getEmailCode(context,email);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '验证码已发送');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '验证码发送失败，请重试');
    return null;
  }

  /// 改绑邮箱
  Future<BaseRespEntity> updateEmail(BuildContext context,String email,String code) async {
    BaseRespEntity baseEntity = await NetUtils.updateEmail(context,email,code);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '邮箱绑定成功');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '邮箱绑定成功失败，请重试');
    return null;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(UserEntity user) {
    _user = user;
    Application.sp.setString('user', json.encode(user.toJson()));
  }
}
