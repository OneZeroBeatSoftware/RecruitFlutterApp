import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/apply_list_entity.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/black_list_entity.dart';
import 'package:recruit_app/entity/company_item_entity.dart';
import 'package:recruit_app/entity/intent_list_entity.dart';
import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/entity/mine_info_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/entity/resume_list_entity.dart';
import 'package:recruit_app/entity/star_company_entity.dart';
import 'package:recruit_app/entity/star_job_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class MineModel{
  static MineModel _instance;
  factory MineModel()=>_getInstance();
  static MineModel get instance => _getInstance();

  MineModel._internal(){
    //TODO
  }

  static MineModel _getInstance(){
    if(_instance==null){
      _instance=new MineModel._internal();
    }
    return _instance;
  }

  /// 获取求职者主页信息
  Future<MineInfoData> getSeekerInfo(BuildContext context,String id) async{
    MineInfoEntity mineInfoEntity= await NetUtils.getSeekerInfo(context, id);
    if(mineInfoEntity!=null&&mineInfoEntity.statusCode==200&&mineInfoEntity.data!=null){
      return mineInfoEntity.data;
    }
    Utils.showToast(mineInfoEntity.msg ?? '还未获取到个人信息');
    return null;
  }

  List<BlackListDataRecord> _shieldList=[];
  List<BlackListDataRecord> get shieldList => _shieldList;
  /// 获取黑名单列表
  Future<MineModel> getShieldList (BuildContext context,String seekerId,
      int pageIndex, {int pageSize = 15}) async {
    BlackListEntity shieldEntity = await NetUtils.getShieldList(context,seekerId,pageIndex, pageSize);
    if (shieldEntity!=null&&shieldEntity.statusCode ==200) {
      if(pageIndex==1){
        _shieldList.clear();
      }
      _shieldList.addAll(shieldEntity.data.records);
      if(shieldEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到屏蔽的公司哦！');
        return null;
      }else if(shieldEntity.data.records.length<=0){
        Utils.showToast('没有屏蔽更多公司啦！');
        return null;
      }
      return this;
    }
    if(pageIndex==1){
      _shieldList.clear();
    }
    Utils.showToast(shieldEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 黑名单操作
  Future<BaseRespEntity> shieldCompanyJob(BuildContext context, String shieldObjectId,{String jobSeekerId,String recruiterId,String shieldId}) async {
    BaseRespEntity baseRespEntity = await NetUtils.shieldCompanyJob(context,shieldObjectId,jobSeekerId:jobSeekerId,recruiterId: recruiterId,shieldId: shieldId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  List<JobListDataRecord> _jobList=[];
  List<JobListDataRecord> get jobList => _jobList;
  List<CompanyListDataRecord> _companyList=[];
  List<CompanyListDataRecord> get companyList => _companyList;
  /// 获取收藏列表
  Future<MineModel> getStarList(BuildContext context, String seekerId,
      int pageIndex, int type, {int pageSize = 15}) async {
    if (type == 1) {
      StarJobEntity jobEntity = await NetUtils.getStarList(
          context, seekerId, type, pageIndex, pageSize);
      if (jobEntity!=null&&jobEntity.statusCode == 200) {
        if (pageIndex == 1) {
          _jobList.clear();
        }
        _jobList.addAll(jobEntity.data.records);
        if (jobEntity.data.records.length <= 0 && pageIndex == 1) {
          Utils.showToast('没有收藏的岗位哦！');
          return null;
        } else if (jobEntity.data.records.length <= 0) {
          Utils.showToast('没有收藏更多岗位啦！');
          return null;
        }
        return this;
      }
      if (pageIndex == 1) {
        _jobList.clear();
      }
      Utils.showToast(jobEntity.msg ?? '获取失败，请重新尝试');
    } else if (type == 2) {
      StarCompanyEntity companyEntity = await NetUtils.getStarList(context, seekerId, type, pageIndex, pageSize);
      if (companyEntity!=null&&companyEntity.statusCode == 200) {
        if (pageIndex == 1) {
          _companyList.clear();
        }
        _companyList.addAll(companyEntity.data.records);
        if (companyEntity.data.records.length <= 0 && pageIndex == 1) {
          Utils.showToast('没有收藏的公司哦！');
          return null;
        } else if (companyEntity.data.records.length <= 0) {
          Utils.showToast('没有收藏更多公司啦！');
          return null;
        }
        return this;
      }
      if (pageIndex == 1) {
        _companyList.clear();
      }
      Utils.showToast(companyEntity.msg ?? '获取失败，请重新尝试');
    }
    return null;
  }

  /// 收藏夹操作
  Future<BaseRespEntity> starCompanyJob(BuildContext context, bool isJob,
      String starObjectId, String jobSeekerId, {String starId}) async {
    BaseRespEntity baseRespEntity = await NetUtils.starCompanyJob(context, isJob,starObjectId,jobSeekerId,starId: starId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  List<ApplyListDataRecord> _applyList=[];
  List<ApplyListDataRecord> get applyList => _applyList;
  /// 申请列表
  Future<MineModel> getApplyList(BuildContext context,
      String seekerId, int state, int pageIndex) async {
    ApplyListEntity applyListEntity = await NetUtils.getSeekerApplyList(
        context, seekerId, state, pageIndex);
    if (applyListEntity != null && applyListEntity.statusCode == 200) {
      if (pageIndex == 1) {
        _applyList.clear();
      }
      _applyList.addAll(applyListEntity.data.records);
      if (applyListEntity.data.records.length <= 0 && pageIndex == 1) {
        Utils.showToast(state==1?'没有投递的岗位哦！':(state==7?'没有沟通过的岗位哦！':''));
        return null;
      } else if (applyListEntity.data.records.length <= 0) {
        Utils.showToast('没有更多啦！');
        return null;
      }
      return this;
    }
    if (pageIndex == 1) {
      _applyList.clear();
    }
    Utils.showToast(applyListEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  List<IntentListData> _intentList=[];
  List<IntentListData> get intentList => _intentList;
  /// 获取全部求职期望
  Future<MineModel> getIntentList (BuildContext context,String seekerId) async {
    IntentListEntity intentEntity = await NetUtils.getIntentList(context,seekerId);
    if (intentEntity!=null&&intentEntity.statusCode ==200) {
      _intentList.clear();
      _intentList.addAll(intentEntity.data);
      return this;
    }
    _intentList.clear();
    Utils.showToast(intentEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 删除期望
  Future<BaseRespEntity> deleteIntent(BuildContext context, String intentId) async {
    BaseRespEntity baseRespEntity = await NetUtils.deleteIntent(context, intentId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  /// 添加求职期望
  Future<BaseRespEntity> saveIntent(BuildContext context, String jobSeekerId,String position,String industry,String city,String minSalary,String maxSalary,{String intentId}) async {
    BaseRespEntity baseRespEntity = await NetUtils.saveIntent(context, jobSeekerId,position,industry,city,minSalary,maxSalary,intentId: intentId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '${intentId!=null&&intentId.isNotEmpty?"修改":"添加"}失败，请重新尝试');
    return null;
  }

  List<ResumeListData> _resumeList=[];
  List<ResumeListData> get resumeList => _resumeList;
  /// 获取全部简历
  Future<MineModel> getResumeList (BuildContext context,String seekerId) async {
    ResumeListEntity resumeEntity = await NetUtils.getResumeList(context,seekerId);
    if (resumeEntity!=null&&resumeEntity.statusCode ==200) {
      _resumeList.clear();
      _resumeList.addAll(resumeEntity.data);
      return this;
    }
    _resumeList.clear();
    Utils.showToast(resumeEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 删除简历
  Future<BaseRespEntity> deleteResume(BuildContext context, String resumeId) async {
    BaseRespEntity baseRespEntity = await NetUtils.deleteResume(context, resumeId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  /// 获取简历详情
  Future<ResumeDetailData> getResumeDetail(BuildContext context, String resumeId) async {
    ResumeDetailEntity resumeEntity = await NetUtils.getResumeDetail(context, resumeId);
    if (resumeEntity.statusCode ==200) {
      return resumeEntity.data;
    }
    Utils.showToast(resumeEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 获取简历详情
  Future<BaseRespEntity> saveResume(BuildContext context,String resumeId,ResumeDetailData detailData) async {
    BaseRespEntity baseRespEntity = await NetUtils.saveResume(context,resumeId,detailData);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }
}