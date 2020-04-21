
import 'package:flutter/material.dart';
import 'package:recruit_app/entity/banner_entity.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';


class JobModel with ChangeNotifier {
  List<JobListDataRecord> _jobList=[];

  List<JobListDataRecord> get jobList => _jobList;

  /// 获取岗位列表
  Future<JobListEntity> getJobList(BuildContext context, bool isNearby,
      bool isNews, bool isRecommend, String jobName, int pageIndex,int pageSize) async {
    JobListEntity jobEntity = await NetUtils.getJobList(context, isNearby, isNews,isRecommend,jobName,pageIndex,pageSize);
    if (jobEntity.statusCode ==200) {
      if(pageIndex==1){
        _jobList.clear();
      }
      _jobList.addAll(jobEntity.data.records);
      if(jobEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('还没有岗位发布哦！');
      }else if(jobEntity.data.records.length<=0){
        Utils.showToast('没有更多岗位啦！');
      }
      notifyListeners();
      return jobEntity;
    }
    if(pageIndex==1){
      _jobList.clear();
    }
    notifyListeners();
    Utils.showToast(jobEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 求职者获取岗位详情
  Future<JobDetailEntity> getJobDetail(BuildContext context,String jobId) async {
    JobDetailEntity jobEntity = await NetUtils.getJobDetail(context, jobId);
    if (jobEntity.statusCode ==200) {
      return jobEntity;
    }
    Utils.showToast(jobEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 获取广告图
  Future<List<BannerData>> getBanner(BuildContext context) async {
    BannerEntity bannerEntity = await NetUtils.getBanner(context);
    if (bannerEntity.statusCode ==200) {
      return bannerEntity.data;
    }
    return null;
  }
}
