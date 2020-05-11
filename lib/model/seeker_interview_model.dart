
import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/interview_update_entity.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class InterviewModel {
  factory InterviewModel() =>_getInstance();
  static InterviewModel _instance;
  static InterviewModel get instance => _getInstance();
  InterviewModel._internal() {
    //TODO
  }

  static InterviewModel _getInstance() {
    if (_instance == null) {
      _instance = new InterviewModel._internal();
    }
    return _instance;
  }

  List<SeekerInterviewDataRecord> _interviewList=[];
  List<SeekerInterviewDataRecord> get interviewList => _interviewList;
  /// 获取面试列表
  Future<SeekerInterviewEntity> getInterviewList(BuildContext context, int pageIndex,int pageSize,{String jobSeekerId,String recruiterId,String state}) async {
    SeekerInterviewEntity interviewEntity = await NetUtils.getInterviewList(context,pageIndex,pageSize,jobSeekerId: jobSeekerId,recruiterId: recruiterId,state: state);
    if (interviewEntity.statusCode ==200) {
      if(pageIndex==1){
        _interviewList.clear();
      }
      _interviewList.addAll(interviewEntity.data.records);
      if(interviewEntity.data.records.length<=0&&pageIndex==1){
//        Utils.showToast('还没有面试邀请哦！');
      }else if(interviewEntity.data.records.length<=0){
        Utils.showToast('没有更多面试邀请啦！');
      }
      return interviewEntity;
    }
    if(pageIndex==1){
      _interviewList.clear();
    }
    Utils.showToast(interviewEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 删除面试邀请
  Future<BaseRespEntity> deleteInterview(BuildContext context, String interviewId) async {
    BaseRespEntity baseRespEntity = await NetUtils.deleteInterview(context, interviewId);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '删除失败，请重新尝试');
    return null;
  }

  /// 添加更新面试信息
  Future<InterviewUpdateEntity>saveInterview(BuildContext context, {
    String address,
    String companyId,
    String id,
    int interviewDate,
    String jobId,
    String jobSeekerId,
    String recruiterId,
    String state
  }) async  {
    InterviewUpdateEntity baseRespEntity = await NetUtils.saveInterview(
        context, address: address,
        companyId: companyId,
        id: id,
        interviewDate: interviewDate,
        jobId: jobId,
        jobSeekerId: jobSeekerId,
        recruiterId: recruiterId,
        state: state);
    if (baseRespEntity.statusCode ==200) {
      return baseRespEntity;
    }
    Utils.showToast(baseRespEntity.msg ?? '邀请失败，请重新尝试');
    return null;
  }
}
