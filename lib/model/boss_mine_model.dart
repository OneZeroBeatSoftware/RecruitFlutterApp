import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/boss_apply_list_entity.dart';
import 'package:recruit_app/entity/boss_info_entity.dart';
import 'package:recruit_app/entity/main_resume_list_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class BossMineModel{
  static BossMineModel _instance;
  factory BossMineModel()=>_getInstance();
  static BossMineModel get instance => _getInstance();

  BossMineModel._internal(){
    //TODO
  }

  static BossMineModel _getInstance(){
    if(_instance==null){
      _instance=new BossMineModel._internal();
    }
    return _instance;
  }

  /// 获取招聘者主页信息
  Future<BossInfoData> getRecruiterInfo(BuildContext context,String id) async{
    BossInfoEntity mineInfoEntity= await NetUtils.getRecruiterInfo(context, id);
    if(mineInfoEntity!=null&&mineInfoEntity.statusCode==200&&mineInfoEntity.data!=null){
      return mineInfoEntity.data;
    }
    Utils.showToast(mineInfoEntity.msg ?? '还未获取到个人信息');
    return null;
  }

  List<BossApplyListDataRecord> _applyList=[];
  List<BossApplyListDataRecord> get applyList => _applyList;
  /// 申请列表
  Future<BossMineModel> getApplyList(BuildContext context,
      String recruiterId, int state, int pageIndex) async {
    BossApplyListEntity applyListEntity = await NetUtils.getRecruiterApplyList(
        context, recruiterId, state, pageIndex);
    if (applyListEntity != null || applyListEntity.statusCode == 200) {
      if (pageIndex == 1) {
        _applyList.clear();
      }
      _applyList.addAll(applyListEntity.data.records);
      if (applyListEntity.data.records.length <= 0 && pageIndex == 1) {
        Utils.showToast(state==1?'没有收到人才的简历哦！':(state==7?'没有沟通过的人才哦！':''));
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

  List<MainResumeListDataRecord> _shieldList=[];
  List<MainResumeListDataRecord> get shieldList => _shieldList;
  /// 获取黑名单列表
  Future<BossMineModel> getShieldList (BuildContext context,String recruiterId,
      int pageIndex, {int pageSize = 15}) async {
    MainResumeListEntity shieldEntity = await NetUtils.getBossShieldList(context,recruiterId,pageIndex, pageSize);
    if (shieldEntity!=null||shieldEntity.statusCode ==200) {
      if(pageIndex==1){
        _shieldList.clear();
      }
      if(shieldEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到屏蔽的求职者哦！');
        return null;
      }else if(shieldEntity.data.records.length<=0){
        Utils.showToast('没有屏蔽更多求职者啦！');
        return null;
      }
      _shieldList.addAll(shieldEntity.data.records);
      return this;
    }
    if(pageIndex==1){
      _shieldList.clear();
    }
    Utils.showToast(shieldEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 黑名单操作
  Future<BaseRespEntity> shieldSeeker(BuildContext context, String shieldObjectId,String recruiterId,{String shieldId}) async {
    BaseRespEntity baseRespEntity = await NetUtils.shieldSeeker(context,shieldObjectId,recruiterId,shieldId: shieldId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  List<MainResumeListDataRecord> _starList=[];
  List<MainResumeListDataRecord> get starList => _starList;
  /// 获取收藏列表
  Future<BossMineModel> getStarList(BuildContext context, String recruiterId,
      int pageIndex, {int pageSize = 15}) async {
    MainResumeListEntity starEntity = await NetUtils.getBossStarList(
        context, recruiterId, pageIndex, pageSize);
    if (starEntity != null || starEntity.statusCode == 200) {
      if (pageIndex == 1) {
        _starList.clear();
      }
      if (starEntity.data.records.length <= 0 && pageIndex == 1) {
        Utils.showToast('没有收藏的求职者哦！');
        return null;
      } else if (starEntity.data.records.length <= 0) {
        Utils.showToast('没有收藏更多求职者啦！');
        return null;
      }
      _starList.addAll(starEntity.data.records);
      return this;
    }
    if (pageIndex == 1) {
      _starList.clear();
    }
    Utils.showToast(starEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 收藏夹操作
  Future<BaseRespEntity> starSeeker(BuildContext context,String starObjectId, String recruiterId, {String starId}) async {
    BaseRespEntity baseRespEntity = await NetUtils.starSeeker(context,starObjectId,recruiterId,starId: starId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }
}