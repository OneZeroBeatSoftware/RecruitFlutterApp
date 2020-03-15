import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/entity/user_entity.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/utils/token_interceptor.dart';
import 'package:recruit_app/widgets/loading.dart';

import 'custom_log_interceptor.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'https://www.onezerobeat.com/recruit';

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl', followRedirects: false))
      ..interceptors.add(CookieManager(cj))
      ..interceptors
          .add(CustomLogInterceptor(responseBody: true, requestBody: true))
    ..interceptors.add(TokenInterceptor());
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
//          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static Future<Response> _post(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.post(url, data: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
//          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  /// 登录
  static Future<UserEntity> login(
      BuildContext context, String userName, String password) async {
    var response = await _post(context, '/user/login', params: {
      'userName': userName,
      'password': password,
    });
    return UserEntity().fromJson(response.data);
  }

  /// 退出登录
  static Future<UserEntity> logout(
      BuildContext context) async {
    var response = await _get(context, '/user/logout', params: {});
    return UserEntity().fromJson(response.data);
  }

  /// 注册
  static Future<UserEntity> register(BuildContext context, String userName,
      String password, String password2, String phone, String email) async {
    var response = await _post(context, '/user/register', params: {
      'userName': userName,
      'password': password,
      'password2': password2,
      'phone': phone,
      'email': email
    });
    return UserEntity().fromJson(response.data);
  }

  /// 获取岗位列表
  static Future<JobListEntity> getJobList(BuildContext context, bool isNearby,
      bool isNews, bool isRecommend, String jobName, int pageIndex,int pageSize) async {
    var response = await _post(context, '/job/list', params: {
      'isNearby': isNearby,
      'isNews': isNews,
      'isRecommend': isRecommend,
      'jobName': jobName,
      'pageIndex': pageIndex,
      'pageSize': pageSize
    });
    return JobListEntity().fromJson(response.data);
  }

  /// 求职者获取岗位详情
  static Future<JobDetailEntity> getJobDetail(BuildContext context, String id) async {
    var response = await _get(context, '/job/details/${id}', params: {
    });
    return JobDetailEntity().fromJson(response.data);
  }

  /// 求职者获取公司详情
  static Future<JobListEntity> getCompanyDetail(BuildContext context, String id) async {
    var response = await _get(context, '/company/details/${id}', params: {
    });
    return JobListEntity().fromJson(response.data);
  }

  /// 获取城市列表
  static Future<String> getCityList(BuildContext context) async {
    var response = await _get(context, '/city/list', params: {});
    return null;
  }

  /// 获取工作时间相关
  static Future<WorkDateEntity> getWorkDate(BuildContext context) async {
    var response = await _get(context, '/workDate/list', params: {});
    return WorkDateEntity().fromJson(response.data);
  }

  /// 获取学历相关
  static Future<EduLevelEntity> getEduLevel(BuildContext context) async {
    var response = await _get(context, '/education/list', params: {});
    return EduLevelEntity().fromJson(response.data);
  }
}
