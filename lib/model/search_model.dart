
import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/company_item_entity.dart';
import 'package:recruit_app/entity/company_list_entity.dart';
import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class SearchModel {
  factory SearchModel() =>_getInstance();
  static SearchModel _instance;
  static SearchModel get instance => _getInstance();
  SearchModel._internal() {
    //TODO
  }

  static SearchModel _getInstance() {
    if (_instance == null) {
      _instance = new SearchModel._internal();
    }
    return _instance;
  }

  List<CompanyListDataRecord> _companyList=[];
  List<CompanyListDataRecord> get companyList => _companyList;
  /// 搜索公司
  Future<SearchModel> searchCompany(BuildContext context,int pageIndex,{int pageSize=15,String city,String industryId,String keyword,String scale}) async {
    CompanyListEntity companyEntity = await NetUtils.searchCompany(context,pageIndex,pageSize: pageSize,city: city,industryId: industryId,keyword: keyword,scale: scale);
    if (companyEntity.statusCode ==200) {
      if(pageIndex==1){
        _companyList.clear();
      }
      _companyList.addAll(companyEntity.data.records);
      if(companyEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到相关公司哦！');
      }else if(companyEntity.data.records.length<=0){
        Utils.showToast('没有更多相关公司啦！');
      }
      return this;
    }
    if(pageIndex==1){
      _companyList.clear();
    }
    Utils.showToast(companyEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  List<JobListDataRecord> _jobList=[];
  List<JobListDataRecord> get jobList => _jobList;
  /// 搜索工作
  Future<SearchModel> searchJob (BuildContext context,
      int pageIndex, {int pageSize = 15, String city, String keyword, String scale, String age,String salary,String education}) async {
    JobListEntity jobEntity = await NetUtils.searchJob(context,pageIndex,pageSize: pageSize,city: city,keyword: keyword,scale: scale,education: education,salary: salary,age: age);
    if (jobEntity.statusCode ==200) {
      if(pageIndex==1){
        _jobList.clear();
      }
      _jobList.addAll(jobEntity.data.records);
      if(jobEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到相关公司哦！');
      }else if(jobEntity.data.records.length<=0){
        Utils.showToast('没有更多相关公司啦！');
      }
      return this;
    }
    if(pageIndex==1){
      _jobList.clear();
    }
    Utils.showToast(jobEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  List<SeekerInterviewDataRecord> _resumeList=[];
  List<SeekerInterviewDataRecord> get resumeList => _resumeList;
  /// 搜索简历
  Future<SearchModel> searchResume (BuildContext context,
      int pageIndex, {int pageSize = 15, String city,String keyword,String sex,String salary,String education,String workDate}) async {
    SeekerInterviewEntity resumeEntity = await NetUtils.searchResume(context,pageIndex,pageSize: pageSize,city: city,sex: sex,keyword: keyword,workDate: workDate,education: education,salary: salary,);
    if (resumeEntity.statusCode ==200) {
      if(pageIndex==1){
        _resumeList.clear();
      }
      _resumeList.addAll(resumeEntity.data.records);
      if(resumeEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到相关公司哦！');
      }else if(resumeEntity.data.records.length<=0){
        Utils.showToast('没有更多相关公司啦！');
      }
      return this;
    }
    if(pageIndex==1){
      _resumeList.clear();
    }
    Utils.showToast(resumeEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }
}
