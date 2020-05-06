
import 'package:flutter/material.dart';
import 'package:recruit_app/entity/banner_entity.dart';
import 'package:recruit_app/entity/main_resume_detail_entity.dart';
import 'package:recruit_app/entity/main_resume_list_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';


class MainResumeModel {
  factory MainResumeModel() =>_getInstance();
  static MainResumeModel _instance;
  static MainResumeModel get instance => _getInstance();
  MainResumeModel._internal() {
    //TODO
  }

  static MainResumeModel _getInstance() {
    if (_instance == null) {
      _instance = new MainResumeModel._internal();
    }
    return _instance;
  }

  List<MainResumeListDataRecord> _resumeList=[];
  List<MainResumeListDataRecord> get resumeList => _resumeList;
  /// 获取招聘者首页简历列表
  Future<MainResumeListEntity> getResumeList(BuildContext context, bool isNearby,
      bool isNews, bool isRecommend, String jobName, int pageIndex,int pageSize,{String city,String education,String salary,String sex,String workDate}) async {
    MainResumeListEntity resumeEntity = await NetUtils.getMainResumeList(context, isNearby, isNews,isRecommend,pageIndex,pageSize,city: city,education: education,salary: salary,sex: sex,workDate: workDate);
    if (resumeEntity.statusCode ==200) {
      if(pageIndex==1){
        _resumeList.clear();
      }
      if(resumeEntity.data.records.length<=0&&pageIndex==1){
        Utils.showToast('没有搜到人才哦！');
        return null;
      }else if(resumeEntity.data.records.length<=0){
        Utils.showToast('没有更多人才啦！');
        return null;
      }
      _resumeList.addAll(resumeEntity.data.records);
      return resumeEntity;
    }
    if(pageIndex==1) {
      _resumeList.clear();
    }
    Utils.showToast(resumeEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }

  /// 获取人才详情
  Future<MainResumeDetailEntity> getResumeDetail(BuildContext context, String id) async {
    MainResumeDetailEntity resumeEntity = await NetUtils.getMainResumeDetail(context, id);
    if (resumeEntity.statusCode ==200) {
      return resumeEntity;
    }
    Utils.showToast(resumeEntity.msg ?? '获取失败，请重新尝试');
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
