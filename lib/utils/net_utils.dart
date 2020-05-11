import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recruit_app/entity/age_entity.dart';
import 'package:recruit_app/entity/apply_list_entity.dart';
import 'package:recruit_app/entity/banner_entity.dart';
import 'package:recruit_app/entity/base_data_entity.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/black_list_entity.dart';
import 'package:recruit_app/entity/boss_apply_list_entity.dart';
import 'package:recruit_app/entity/boss_info_entity.dart';
import 'package:recruit_app/entity/boss_job_detail_entity.dart';
import 'package:recruit_app/entity/boss_job_manage_entity.dart';
import 'package:recruit_app/entity/candidate_entity.dart';
import 'package:recruit_app/entity/candidate_update_entity.dart';
import 'package:recruit_app/entity/city_entity.dart';
import 'package:recruit_app/entity/collection_entity.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/entity/company_job_entity.dart';
import 'package:recruit_app/entity/company_list_entity.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/file_upload_entity.dart';
import 'package:recruit_app/entity/industry_type_entity.dart';
import 'package:recruit_app/entity/intent_list_entity.dart';
import 'package:recruit_app/entity/interview_update_entity.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/entity/job_state_entity.dart';
import 'package:recruit_app/entity/job_type_entity.dart';
import 'package:recruit_app/entity/main_resume_detail_entity.dart';
import 'package:recruit_app/entity/main_resume_list_entity.dart';
import 'package:recruit_app/entity/management_entity.dart';
import 'package:recruit_app/entity/mine_info_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/entity/resume_list_entity.dart';
import 'package:recruit_app/entity/salary_list_entity.dart';
import 'package:recruit_app/entity/search_job_entity.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/entity/seeker_notice_entity.dart';
import 'package:recruit_app/entity/star_company_entity.dart';
import 'package:recruit_app/entity/star_job_entity.dart';
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

  static Future<Response> _delete(
      BuildContext context,
      String url, {
        Map<String, dynamic> params,
        bool isShowLoading = true,
        bool isBody=false
      }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      if(isBody){
        return await _dio.delete(url, data: params);
      }else {
        return await _dio.delete(url, queryParameters: params);
      }
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

  static Future<Response> _put(
      BuildContext context,
      String url, {
        Map<String, dynamic> params,
        bool isShowLoading = true,
        bool isBody=false
      }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      if(isBody){
        return await _dio.put(url, data: params);
      }else {
        return await _dio.put(url, queryParameters: params);
      }
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
    bool isBody=true
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      if(isBody){
        return await _dio.post(url, data: params);
      }else {
        return await _dio.post(url, queryParameters: params);
      }
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

  static Future<Response> _upLoadFile(
      BuildContext context,
      String url, {
        FormData formData,
        bool isShowLoading = true,
      }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.post(url,data: formData);
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

  /// 获取广告图
  static Future<BannerEntity> getBanner(BuildContext context) async {
    var response = await _get(context, '/banner/list',isShowLoading: false);
    return BannerEntity().fromJson(response.data);
  }

  /// 登录
  static Future<UserEntity> login(
      BuildContext context, String userName, String password) async {
    var response = await _post(context, '/user/login', params: {
      'account': userName,
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
      String password, String password2, String phone, String email,String code) async {
    var response = await _post(context, '/user/register', params: {
      'userName': userName,
      'code': code,
      'password': password,
      'password2': password2,
      'phone': phone,
      'email': email
    });
    return UserEntity().fromJson(response.data);
  }

  /// 修改密码
  static Future<BaseRespEntity> modifyPwd(
      BuildContext context, String oldPassword, String newPassword,String newPassword2) async {
    var response = await _put(context, '/user/update/password', params: {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'newPassword2': newPassword,
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取手机验证码
  static Future<BaseRespEntity> getPhoneCode(
      BuildContext context, String phoneNumber) async {
    var response = await _get(context, '/user/getPhoneCode', params: {
      'phoneNumber': phoneNumber
    });
    return BaseRespEntity().fromJson(response.data);
  }

  /// 手机号重置密码
  static Future<BaseRespEntity> resetPwd(
      BuildContext context, String tel, String code,String pwd,String pwd2) async {
    var response = await _put(context, '/user/update/passwordByCode', params: {
      'code': code,
      'phone': tel,
      'password':pwd,
      'password2':pwd2
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 手机验证码登录
  static Future<UserEntity> phoneCodeLogin(
      BuildContext context, String tel,String code) async {
    var response = await _post(context, '/user/phoneCodeLogin', params: {
      'code': code,
      'sign': tel
    });
    return UserEntity().fromJson(response.data);
  }

  /// 绑定、修改手机号码
  static Future<BaseRespEntity> updatePhone(
      BuildContext context, String tel,String code) async {
    var response = await _put(context, '/user/update/phone', params: {
      'code': code,
      'sign': tel
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取邮箱验证码
  static Future<BaseRespEntity> getEmailCode(
      BuildContext context, String email) async {
    var response = await _get(context, '/user/getEmailCode', params: {
      'email': email
    });
    return BaseRespEntity().fromJson(response.data);
  }

  /// 邮箱验证码登录
  static Future<UserEntity> emailCodeLogin(
      BuildContext context, String email,String code) async {
    var response = await _post(context, '/user/emailCodeLogin', params: {
      'code': code,
      'sign': email
    });
    return UserEntity().fromJson(response.data);
  }

  /// 解绑邮箱
  static Future<BaseRespEntity> unbindEmail(
      BuildContext context, String email, String code) async {
    var response = await _put(context, '/user/untying/email', params: {
      'code': code,
      'sign': email
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 改绑邮箱
  static Future<BaseRespEntity> updateEmail(
      BuildContext context, String email,String code) async {
    var response = await _put(context, '/user/update/email', params: {
      'sign': email,
      'code': code
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取岗位列表
  static Future<JobListEntity> getJobList(BuildContext context, bool isNearby,
      bool isNews, bool isRecommend, int pageIndex,int pageSize,{String city,String age,String education,String salary,String scale}) async {
    Map<String,dynamic> params={};
    params['isNearby']=isNearby;
    params['isNews']=isNews;
    params['isRecommend']=isRecommend;
    params['pageIndex']=pageIndex;
    params['pageSize']=pageSize;
    if(city!=null&&city.isNotEmpty){
      params['city']=city;
    }
    if(age!=null&&age.isNotEmpty){
      params['age']=age;
    }
    if(education!=null&&education.isNotEmpty){
      params['education']=education;
    }
    if(salary!=null&&salary.isNotEmpty){
      params['salary']=salary;
    }
    if(scale!=null&&scale.isNotEmpty){
      params['scale']=scale;
    }

    var response = await _post(context, '/job/list', params: params,isShowLoading: false);
    return JobListEntity().fromJson(response.data);
  }

  /// 求职者获取岗位详情
  static Future<JobDetailEntity> getJobDetail(BuildContext context, String id) async {
    var response = await _get(context, '/job/info/$id', params: {
    });
    return JobDetailEntity().fromJson(response.data);
  }

  /// 获取城市列表
  static Future<CityEntity> getCityList(BuildContext context) async {
    var response = await _get(context, '/city/list', params: {});
    return CityEntity().fromJson(response.data);
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

  /// 获取公司规模相关
  static Future<CompanyScaleEntity> getScaleList(BuildContext context) async {
    var response = await _get(context, '/scale/list', params: {});
    return CompanyScaleEntity().fromJson(response.data);
  }

  /// 获取薪资相关
  static Future<SalaryListEntity> getSalaryList(BuildContext context) async {
    var response = await _get(context, '/salary/list', params: {});
    return SalaryListEntity().fromJson(response.data);
  }

  /// 获取年龄相关
  static Future<AgeEntity> getAgeList(BuildContext context) async {
    var response = await _get(context, '/age/list', params: {});
    return AgeEntity().fromJson(response.data);
  }

  /// 获取经营状态相关
  static Future<ManagementEntity> getManagementList(BuildContext context) async {
    var response = await _get(context, '/management/list', params: {});
    return ManagementEntity().fromJson(response.data);
  }

  /// 获取公司列表
  static Future<CompanyListEntity> getCompanyList(BuildContext context, bool isNearby,bool isRecommend, int pageIndex,int pageSize) async {
    var response = await _post(context, '/company/list', params: {
      'isNearby': isNearby,
      'isRecommend': isRecommend,
      'pageIndex': pageIndex,
      'pageSize': pageSize
    },isShowLoading: false);
    return CompanyListEntity().fromJson(response.data);
  }

  /// 求职者获取公司详情
  static Future<CompanyDetailEntity> getCompanyDetail(BuildContext context, String id) async {
    var response = await _get(context, '/company/details/$id', params: {
    });
    return CompanyDetailEntity().fromJson(response.data);
  }

  /// 获取公司发布的岗位
  static Future<CompanyJobEntity> getJob4Company(BuildContext context, String companyId, int pageIndex,int pageSize,int pos) async {
    var response = await _post(context, '/company/job/list', params: {
      'companyId': companyId,
      'positionType': pos,
      'pageIndex': pageIndex,
      'pageSize': pageSize
    },isShowLoading: false);
    return CompanyJobEntity().fromJson(response.data);
  }

  /// 上传图片
  static Future<FileUploadEntity> uploadFile(BuildContext context,
      File file) async {
    FormData formData = FormData.fromMap({
      "image": MultipartFile.fromFileSync(
        file.path,
      )});
    var response = await _upLoadFile(
        context, '/image/upload', formData: formData, isShowLoading: true);
    return FileUploadEntity().fromJson(response.data);
  }

  /// 添加、更新反馈
  static Future<BaseRespEntity> subFeedBack(BuildContext context,List<String> imgPath,String content,{String id,String state} ) async {
    Map<String,dynamic> params={};
    params['image']=imgPath;
    params['content']=content;
    if(id!=null&&id.isNotEmpty){
      params['id']=id;
    }
    if(state!=null&&state.isNotEmpty){
      params['state']=state;
    }
    var response = await _post(context, '/feedBack/save', params: params,isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取全部面试邀请
  static Future<SeekerInterviewEntity> getInterviewList(BuildContext context, int pageIndex,int pageSize,{String jobSeekerId,String recruiterId,String state}) async {
    Map<String,dynamic> params={};
    if(jobSeekerId!=null&&jobSeekerId.isNotEmpty){
      params["jobSeekerId"]=jobSeekerId;
    }
    if(recruiterId!=null&&recruiterId.isNotEmpty){
      params["recruiterId"]=recruiterId;
    }
    if(state!=null&&state.isNotEmpty){
      params["state"]=state;
    }
    params["pageIndex"]=pageIndex;
    params["pageSize"]=pageSize;

    var response = await _post(context, '/interview/list', params:params,isShowLoading: false);
    return SeekerInterviewEntity().fromJson(response.data);
  }

  /// 删除面试邀请
  static Future<BaseRespEntity> deleteInterview(BuildContext context, String interviewId) async {
    var response = await _delete(context, '/interview/delete/$interviewId',isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 添加、更新面试邀请
  static Future<InterviewUpdateEntity> saveInterview(BuildContext context, {
    String address,
    String companyId,
    String id,
    int interviewDate,
    String jobId,
    String jobSeekerId,
    String recruiterId,
    String state
  }) async {
    Map<String,dynamic> params={};
    if(address!=null&&address.isNotEmpty){
      params['address']=address;
    }
    if(companyId!=null&&companyId.isNotEmpty){
      params['companyId']=companyId;
    }
    if(id!=null&&id.isNotEmpty){
      params['id']=id;
    }
    if(interviewDate!=null){
      params['interviewDate']=interviewDate;
    }
    if(jobId!=null&&jobId.isNotEmpty){
      params['jobId']=jobId;
    }
    if(jobSeekerId!=null&&jobSeekerId.isNotEmpty){
      params['jobSeekerId']=jobSeekerId;
    }
    if(recruiterId!=null&&recruiterId.isNotEmpty){
      params['recruiterId']=recruiterId;
    }
    if(state!=null&&state.isNotEmpty){
      params['state']=state;
    }
    var response = await _post(context, '/interview/save', params: params);
    return InterviewUpdateEntity().fromJson(response.data);
  }

  /// 获取通知列表
  static Future<SeekerNoticeEntity> getNoticeList(BuildContext context,int pageIndex,int pageSize) async {
    var response = await _post(context, '/notice/list', params: {
      'pageIndex': pageIndex,
      'pageSize': pageSize
    },isShowLoading: false);
    return SeekerNoticeEntity().fromJson(response.data);
  }

  /// 获取全部行业
  static Future<IndustryTypeEntity> getIndustryList(BuildContext context) async {
    var response = await _get(context, '/industry/list',isShowLoading: true);
    return IndustryTypeEntity().fromJson(response.data);
  }

  /// 获取全部岗位类型
  static Future<JobTypeEntity> getAllJobType(BuildContext context) async {
    var response = await _get(context, '/position/list',isShowLoading: true);
    return JobTypeEntity().fromJson(response.data);
  }

  /// 搜索公司
  static Future<CompanyListEntity> searchCompany(BuildContext context,int pageIndex,{int pageSize=15,String city,String industryId,String keyword,String scale}) async {
    Map<String,dynamic> params={};
    if(city!=null&&city.isNotEmpty){
      params["city"]=city;
    }
    if(industryId!=null&&industryId.isNotEmpty){
      params["industryId"]=industryId;
    }
    if(scale!=null&&scale.isNotEmpty){
      params["scale"]=scale;
    }
    if(keyword!=null&&keyword.isNotEmpty){
      params["keyword"]=keyword;
    }
    params["pageIndex"]=pageIndex;
    params["pageSize"]=pageSize;

    var response = await _post(context, '/search/company',
        params: params,
        isShowLoading: false);
    return CompanyListEntity().fromJson(response.data);
  }

  /// 搜索工作
  static Future<SearchJobEntity> searchJob(BuildContext context,
      int pageIndex,
      {int pageSize = 15, String city, String keyword, String scale, String age,String salary,String education}) async {
    Map<String,dynamic> params={};
    if(city!=null&&city.isNotEmpty){
      params["city"]=city;
    }
    if(age!=null&&age.isNotEmpty){
      params["age"]=age;
    }
    if(education!=null&&education.isNotEmpty){
      params["education"]=education;
    }
    if(keyword!=null&&keyword.isNotEmpty){
      params["keyword"]=keyword;
    }
    if(scale!=null&&scale.isNotEmpty){
      params["scale"]=scale;
    }
    if(salary!=null&&salary.isNotEmpty){
      params["salary"]=salary;
    }
    params["pageIndex"]=pageIndex;
    params["pageSize"]=pageSize;

    var response = await _post(context, '/search/job',
        params: params,
        isShowLoading: false);
    return SearchJobEntity().fromJson(response.data);
  }

  /// 搜索简历
  static Future<MainResumeListEntity> searchResume(BuildContext context,
      int pageIndex,
      {int pageSize = 15, String city,String keyword,String sex,String salary,String education,String workDate}) async {

    Map<String,dynamic> params={};
    if(city!=null&&city.isNotEmpty){
      params["city"]=city;
    }
    if(education!=null&&education.isNotEmpty){
      params["educationId"]=education;
    }
    if(keyword!=null&&keyword.isNotEmpty){
      params["keyword"]=keyword;
    }
    if(salary!=null&&salary.isNotEmpty){
      params["salary"]=salary;
    }
    if(sex!=null&&sex.isNotEmpty){
      params["sex"]=sex;
    }
    if(workDate!=null&&workDate.isNotEmpty){
      params["workDate"]=workDate;
    }
    params["pageIndex"]=pageIndex;
    params["pageSize"]=pageSize;

    var response = await _post(context, '/search/resume',
        params: params,
        isShowLoading: false);
    return MainResumeListEntity().fromJson(response.data);
  }

  /// 求职状态修改
  static Future<BaseRespEntity> changeJobState(
      BuildContext context, String jobSeekerId,String jobState) async {
    var response = await _put(context, '/jobSeeker/jobState/change', params: {
      'jobSeekerId': jobSeekerId,
      'jobState': jobState
    },isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取全部求职状态
  static Future<JobStateEntity> getJobStateList(BuildContext context) async {
    var response = await _post(context, '/jobState/list',params: {
      'pageIndex': 1,
      'pageSize': 100,
    },isShowLoading: true);
    return JobStateEntity().fromJson(response.data);
  }

  /// 获取求职者主页信息
  static Future<MineInfoEntity> getSeekerInfo(BuildContext context,String id) async {
    var response = await _get(context, '/jobSeeker/info/$id',isShowLoading: false);
    return MineInfoEntity().fromJson(response.data);
  }

  /// 添加、修改求职者信息
  static Future<BaseRespEntity> saveJobSeeker(BuildContext context,String id,String userId,String avatar,String realName) async {
    Map<String,dynamic> params={};
    params["userId"] = userId;
    params["avatar"] = avatar;
    params["realName"] = realName;
    if (id != null && id.isNotEmpty) {
      params["id"] = id;
    }

    var response = await _post(context, '/jobSeeker/save',params: params,isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取黑名单列表
  static Future<BlackListEntity> getShieldList(BuildContext context,String id,int pageIndex,int pageSize) async {
    var response = await _post(context, '/jobSeeker/shield',params: {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'jobSeekerId':id,
    },isShowLoading: false);
    return BlackListEntity().fromJson(response.data);
  }

  /// 屏蔽公司操作
  static Future<BaseRespEntity> shieldCompanyJob(BuildContext context, String shieldObjectId,{String jobSeekerId,String recruiterId,String shieldId}) async {
    Map<String,dynamic> params={};
    params["shieldObjectId"]=shieldObjectId;
    if(jobSeekerId!=null&&jobSeekerId.isNotEmpty){
      params["jobSeekerId"]=jobSeekerId;
    }
    if(recruiterId!=null&&recruiterId.isNotEmpty){
      params["recruiterId"]=recruiterId;
    }
    if(shieldId!=null&&shieldId.isNotEmpty){
      params["id"]=shieldId;
    }

    var response = await _post(context, '/jobSeeker/shieldCompany',params: params);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取收藏列表
  static Future getStarList(BuildContext context,String id,int type,int pageIndex,int pageSize) async {
    var response = await _post(context, '/jobSeeker/star',params:{
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'jobSeekerId':id,
      "type": type
    },isShowLoading: false);
    if (type==1){
      return StarJobEntity().fromJson(response.data);
    }else if(type==2){
      return StarCompanyEntity().fromJson(response.data);
    }
    return null;
  }

  /// 收藏公司/岗位操作
  static Future<CollectionEntity> starCompanyJob(BuildContext context, bool isJob,
      String starObjectId, String jobSeekerId, {String starId}) async {
    Map<String, dynamic> params = {};
    params["starObjectId"] = starObjectId;
    if (starId != null && starId.isNotEmpty) {
      params["id"] = starId;
    }
    params["jobSeekerId"] = jobSeekerId;
    var response = await _post(
        context, '/jobSeeker/${isJob?"starJob":"starCompany"}', params: params);
    return CollectionEntity().fromJson(response.data);
  }

  /// 求职者获取申请列表
  /// state 1：已收到/已投递 2：邀请/收到的邀请  3：待面试/待面试 7：沟通过
  static Future getSeekerApplyList(BuildContext context,String jobSeekerId,int state,int pageIndex,{int pageSize=15}) async {
    var response = await _post(context, '/apply/jobSeeker/list',params:{
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'jobSeekerId':jobSeekerId,
      "state": state
    },isShowLoading: false);
    return ApplyListEntity().fromJson(response.data);
  }
  /// 招聘者获取申请列表
  static Future getRecruiterApplyList(BuildContext context,String recruiterId,int state,int pageIndex,{int pageSize=15}) async {
    var response = await _post(context, '/apply/recruiter/list',params:{
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'recruiterId':recruiterId,
      "state": state
    },isShowLoading: false);
    return BossApplyListEntity().fromJson(response.data);
  }

  /// 获取求职者的求职状态
  static Future<BaseDataEntity> getJobState(BuildContext context, String id) async {
    var response = await _get(context, '/jobSeeker/jobState/get/$id', params: {
    });
    return BaseDataEntity().fromJson(response.data);
  }

  /// 获取全部求职期望
  static Future<IntentListEntity> getIntentList(BuildContext context, String id) async {
    var response = await _get(context, '/jobSeeker/jobIntention/get/$id', params: {
    });
    return IntentListEntity().fromJson(response.data);
  }

  /// 删除求职期望
  static Future<BaseRespEntity> deleteIntent(BuildContext context, String intentId) async {
    var response = await _delete(context, '/jobSeeker/jobIntention/delete/$intentId',isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 添加、更新求职期望
  static Future<BaseRespEntity> saveIntent(BuildContext context, String jobSeekerId,String position,String industry,String city,String minSalary,String maxSalary,{String intentId}) async {
    Map<String,dynamic> params={};
    if(intentId!=null&&intentId.isNotEmpty){
      params["id"]=intentId;
    }
    params["jobSeekerId"]=jobSeekerId;
    params["city"]=city;
    params["industry"]=industry;
    params["position"]=position;
    params["minSalary"]=minSalary;
    params["maxSalary"]=maxSalary;
    params["state"]="1";

    var response = await _post(context, '/jobSeeker/jobIntention/save',params: params);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取全部简历
  static Future<ResumeListEntity> getResumeList(BuildContext context, String id) async {
    var response = await _get(context, '/jobSeeker/resume/get/$id', params: {
    });
    return ResumeListEntity().fromJson(response.data);
  }

  /// 删除简历
  static Future<BaseRespEntity> deleteResume(BuildContext context, String resumeId) async {
    var response = await _delete(context, '/jobSeeker/resume/delete/$resumeId',isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取简历详情
  static Future<ResumeDetailEntity> getResumeDetail(BuildContext context, String resumeId) async {
    var response = await _get(context, '/jobSeeker/resume/details/$resumeId',isShowLoading: false);
    return ResumeDetailEntity().fromJson(response.data);
  }

  /// 添加更新简历
  static Future<BaseRespEntity> saveResume(BuildContext context,Map<String,dynamic> params) async {
    var response = await _post(context, '/jobSeeker/resume/save',params: params);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 设置默认简历
  static Future<BaseRespEntity> setDefaultResume(
      BuildContext context, String resumeId) async {
    var response = await _put(context, '/jobSeeker/resume/default/$resumeId',isBody: true);
    return BaseRespEntity().fromJson(response.data);
  }

  // 获取招聘者主页信息
  static Future<BossInfoEntity> getRecruiterInfo(BuildContext context,String id) async {
    var response = await _get(context, '/recruiter/info/$id',isShowLoading: false);
    return BossInfoEntity().fromJson(response.data);
  }

  /// 添加、修改招聘者信息
  static Future<BaseRespEntity> saveRecruiter(BuildContext context,String id,String userId,String avatar,String realName) async {
    Map<String,dynamic> params={};
    params["userId"] = userId;
    params["avatar"] = avatar;
    params["realName"] = realName;
    if (id != null && id.isNotEmpty) {
      params["id"] = id;
    }

    var response = await _post(context, '/recruiter/save',params: params,isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取招聘者首页人才列表
  static Future<MainResumeListEntity> getMainResumeList(BuildContext context, bool isNearby,
      bool isNews, bool isRecommend, int pageIndex,int pageSize,{String city,String education,String salary,String sex,String workDate}) async {
    Map<String,dynamic> params={};
    params['isNearby']=isNearby;
    params['isNews']=isNews;
    params['isRecommend']=isRecommend;
    params['pageIndex']=pageIndex;
    params['pageSize']=pageSize;
    if(city!=null&&city.isNotEmpty){
      params['city']=city;
    }
    if(salary!=null&&salary.isNotEmpty){
      params['salary']=salary;
    }
    if(education!=null&&education.isNotEmpty){
      params['education']=education;
    }
    if(sex!=null&&sex.isNotEmpty){
      params['sex']=sex;
    }
    if(workDate!=null&&workDate.isNotEmpty){
      params['workDate']=workDate;
    }
    var response = await _post(context, '/recruiter/resume/list', params: params,isShowLoading: false);
    return MainResumeListEntity().fromJson(response.data);
  }

  /// 人才详情
  static Future<MainResumeDetailEntity> getMainResumeDetail(BuildContext context, String resumeId) async {
    var response = await _get(context, '/recruiter/resume/details/$resumeId',);
    return MainResumeDetailEntity().fromJson(response.data);
  }

  /// 获取招聘者黑名单列表
  static Future<MainResumeListEntity> getBossShieldList(BuildContext context,String id,int pageIndex,int pageSize) async {
    var response = await _post(context, '/recruiter/shield',params: {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'recruiterId':id,
    },isShowLoading: false);
    return MainResumeListEntity().fromJson(response.data);
  }

  /// 招聘者屏蔽求职者操作
  static Future<BaseRespEntity> shieldSeeker(BuildContext context, String shieldObjectId,String recruiterId,{String shieldId}) async {
    Map<String,dynamic> params={};
    params["shieldObjectId"]=shieldObjectId;
    if(recruiterId!=null&&recruiterId.isNotEmpty){
      params["recruiterId"]=recruiterId;
    }
    if(shieldId!=null&&shieldId.isNotEmpty){
      params["id"]=shieldId;
    }

    var response = await _post(context, '/recruiter/shieldSeeker',params: params);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 获取招聘者收藏列表
  static Future getBossStarList(BuildContext context,String id,int pageIndex,int pageSize) async {
    var response = await _post(context, '/recruiter/star',params:{
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'recruiterId':id
    },isShowLoading: false);
    return MainResumeListEntity().fromJson(response.data);
  }

  /// 招聘者收藏求职者操作
  static Future<CollectionEntity> starSeeker(BuildContext context,
      String starObjectId, String recruiterId, {String starId}) async {
    Map<String, dynamic> params = {};
    params["starObjectId"] = starObjectId;
    if (starId != null && starId.isNotEmpty) {
      params["id"] = starId;
    }
    params["recruiterId"] = recruiterId;
    var response = await _post(
        context, '/recruiter/starSeeker', params: params);
    return CollectionEntity().fromJson(response.data);
  }

  /// 获取一个招聘者发布的所有招聘信息
  static Future<BossJobManageEntity> getRecruiterJobs(BuildContext context,String id,int pageIndex,{int pageSize=15}) async {
    var response = await _post(context, '/job/recruiter',params:{
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'recruiterId':id
    },isShowLoading: false);
    return BossJobManageEntity().fromJson(response.data);
  }

  /// 招聘者获取发布的岗位详情
  static Future<BossJobDetailEntity> getRecruiterJobDetail(BuildContext context, String id) async {
    var response = await _get(context, '/job/details/$id',);
    return BossJobDetailEntity().fromJson(response.data);
  }

  /// 举报
  /// type 举报类型（1：公司；2：岗位；3：人才）
  static Future<BaseRespEntity> report2App(BuildContext context,List<String> imgPath,String content,String userId,{@required int type,@required String reportedId,String id,String state} ) async {
    Map<String,dynamic> params={};
    params['image']=imgPath;
    params['content']=content;
    params['reportedId']=reportedId;
    params['userId']=userId;
    params['type']=type;
    if(id!=null&&id.isNotEmpty){
      params['id']=id;
    }
    if(state!=null&&state.isNotEmpty){
      params['state']=state;
    }
    var response = await _post(context, '/report/save', params: params,isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 招聘者获取对应岗位的候选人
  static Future<CandidateEntity> getCandidateList(BuildContext context,String jobId,int pageIndex,{int pageSize=15,int state=1}) async {
    var response = await _post(context, '/candidate/list', params: {
      'jobId': jobId,
      'state': state,
      'pageIndex': pageIndex,
      'pageSize': pageSize
    },isShowLoading: false);
    return CandidateEntity().fromJson(response.data);
  }

  /// 删除候选人
  static Future<BaseRespEntity> deleteCandidate(BuildContext context, String candidateId) async {
    var response = await _delete(context, '/candidate/delete/$candidateId',isShowLoading: true);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 添加、更新候选人信息
  static Future<CandidateUpdateEntity> saveCandidate(BuildContext context,String jobId,String jobSeekerId,String resumeId,int type) async {
    Map<String,dynamic> params={};
    params['jobId']=jobId;
    params['jobSeekerId']=jobSeekerId;
    params['resumeId']=resumeId;
    params['type']=type;
    var response = await _post(context, '/candidate/save', params: params);
    return CandidateUpdateEntity().fromJson(response.data);
  }

  /// 招聘者添加更新岗位
  static Future<BaseRespEntity> postJob(BuildContext context, Map<String,dynamic> params) async {
    var response = await _post(context, '/job/save',params: params);
    return BaseRespEntity().fromJson(response.data);
  }

  /// 添加、更新公司信息
  static Future<BaseRespEntity> editCompany(BuildContext context, Map<String,dynamic> params) async {
    var response = await _post(context, '/company/save',params: params);
    return BaseRespEntity().fromJson(response.data);
  }
}
