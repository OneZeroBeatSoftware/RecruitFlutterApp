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
      Application.sp.setString('phone', user.data.phone);
      Application.sp.setString('email', user.data.email);
      _saveUserInfo(user);
      return user;
    }
    Utils.showToast(user.msg ?? '登录失败，请检查账号密码');
    return null;
  }

  /// 手机验证码登录
  Future<UserEntity> phoneCodeLogin(BuildContext context, String phone, String code) async {
    UserEntity user = await NetUtils.phoneCodeLogin(context, phone, code);
    if (user.statusCode ==200) {
      Utils.showToast(user.msg ?? '登录成功');
      Application.sp.setString('token', user.data.token);
      Application.sp.setString('jobSeekerId', user.data.jobSeekerId);
      Application.sp.setString('recruiterId', user.data.recruiterId);
      Application.sp.setString('phone', user.data.phone);
      Application.sp.setString('email', user.data.email);
      _saveUserInfo(user);
      return user;
    }
    Utils.showToast(user.msg ?? '登录失败，请检查账号密码');
    return null;
  }

  /// 邮箱验证码登录
  Future<UserEntity> emailCodeLogin(BuildContext context, String email, String code) async {
    UserEntity user = await NetUtils.emailCodeLogin(context, email, code);
    if (user.statusCode ==200) {
      Utils.showToast(user.msg ?? '登录成功');
      Application.sp.setString('token', user.data.token);
      Application.sp.setString('jobSeekerId', user.data.jobSeekerId);
      Application.sp.setString('recruiterId', user.data.recruiterId);
      Application.sp.setString('phone', user.data.phone);
      Application.sp.setString('email', user.data.email);
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
  Future<UserEntity> register(BuildContext context,String userName, String pwd,String pwd2,String phone,String email,String code) async {
    UserEntity user = await NetUtils.register(context, userName, pwd,pwd2,phone,email,code);
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

  /// 手机号重置密码
  Future<BaseRespEntity> resetPwd(BuildContext context,String tel, String code,String pwd,String pwd2) async {
    BaseRespEntity baseEntity = await NetUtils.resetPwd(context,tel,code,pwd,pwd2);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '密码重置成功');
      Application.sp.setString('token', '');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '密码重置失败，请重试');
    return null;
  }

  /// 绑定、修改手机号码
  Future<BaseRespEntity> updatePhone(BuildContext context,String tel, String code) async {
    BaseRespEntity baseEntity = await NetUtils.updatePhone(context,tel,code);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '绑定成功');
      Application.sp.setString('token', '');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '绑定失败，请重试');
    return null;
  }

  /// 获取手机验证码
  Future<BaseRespEntity> getPhoneCode(BuildContext context,String tel) async {
    BaseRespEntity baseEntity = await NetUtils.getPhoneCode(context,tel);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '验证码已发送');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '验证码发送失败，请重试');
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

  /// 解绑邮箱
  Future<BaseRespEntity> unbindEmail(BuildContext context,String email,String code) async {
    BaseRespEntity baseEntity = await NetUtils.unbindEmail(context,email,code);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '邮箱已解绑');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '邮箱解绑失败，请重试');
    return null;
  }

  /// 改绑邮箱
  Future<BaseRespEntity> updateEmail(BuildContext context,String email,String code) async {
    BaseRespEntity baseEntity = await NetUtils.updateEmail(context,email,code);
    if (baseEntity.statusCode ==200) {
      Utils.showToast(baseEntity.msg ?? '邮箱绑定成功');
      return baseEntity;
    }
    Utils.showToast(baseEntity.msg ?? '邮箱绑定失败，请重试');
    return null;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(UserEntity user) {
    _user = user;
    Application.sp.setString('user', json.encode(user.toJson()));
  }
}
