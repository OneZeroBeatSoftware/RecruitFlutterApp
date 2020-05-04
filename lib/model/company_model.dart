
import 'package:flutter/material.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/entity/company_item_entity.dart';
import 'package:recruit_app/entity/company_job_entity.dart';
import 'package:recruit_app/entity/company_list_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';


class CompanyModel with ChangeNotifier {
  List<CompanyListDataRecord> _companyList=[];

  List<CompanyJobDataRecord> _jobList=[];

  List<CompanyListDataRecord> get companyList => _companyList;

  List<CompanyJobDataRecord> get jobList => _jobList;

  /// 获取公司列表
  Future<CompanyListEntity> getCompanyList(BuildContext context, bool isNearby,bool isRecommend, int pageIndex,int pageSize) async {
    CompanyListEntity comEntity = await NetUtils.getCompanyList(context, isNearby, isRecommend,pageIndex,pageSize);
    if (comEntity.statusCode ==200) {
      if(pageIndex==1){
        _companyList.clear();
      }
      _companyList.addAll(comEntity.data.records);
      if(comEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('还没有找到公司哦！');
      }else if(comEntity.data.records.length<=0){
        Utils.showToast('没有更多公司啦！');
      }
      return comEntity;
    }
    if(pageIndex==1){
      _companyList.clear();
    }
    Utils.showToast(comEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 求职者获取公司详情
  Future<CompanyDetailEntity> getCompanyDetail(BuildContext context,String companyId) async {
    CompanyDetailEntity companyDetailEntity = await NetUtils.getCompanyDetail(context, companyId);
    if (companyDetailEntity.statusCode ==200) {
      return companyDetailEntity;
    }
    Utils.showToast(companyDetailEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 获取公司发布的职位列表
  Future<CompanyJobEntity> getJob4Company(BuildContext context, String companyId, int pageIndex,int pageSize,int pos) async {
    CompanyJobEntity comEntity = await NetUtils.getJob4Company(context, companyId,pageIndex,pageSize,pos);
    if (comEntity.statusCode ==200) {
      if(pageIndex==1){
        _jobList.clear();
      }
      _jobList.addAll(comEntity.data.records);
      if(comEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('还没有找到公司哦！');
      }else if(comEntity.data.records.length<=0){
        Utils.showToast('没有更多公司啦！');
      }
      return comEntity;
    }
    if(pageIndex==1){
      _jobList.clear();
    }
    Utils.showToast(comEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }
}
