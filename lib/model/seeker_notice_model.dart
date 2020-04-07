
import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/seeker_notice_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';

class NoticeModel {
  factory NoticeModel() =>_getInstance();
  static NoticeModel _instance;
  static NoticeModel get instance => _getInstance();
  NoticeModel._internal() {
    //TODO
  }

  static NoticeModel _getInstance() {
    if (_instance == null) {
      _instance = new NoticeModel._internal();
    }
    return _instance;
  }

  List<SeekerNoticeDataRecord> _noticeList=[];
  List<SeekerNoticeDataRecord> get noticeList => _noticeList;
  /// 获取通知列表
  Future<SeekerNoticeEntity> getNoticeList(BuildContext context, int pageIndex,int pageSize) async {
    SeekerNoticeEntity noticeEntity = await NetUtils.getNoticeList(context,pageIndex,pageSize);
    if (noticeEntity.statusCode ==200) {
      if(pageIndex==1){
        _noticeList.clear();
      }
      _noticeList.addAll(noticeEntity.data.records);
      if(noticeEntity.data.records.length<=0&&pageIndex==1){
//        Utils.showToast('还没有面试邀请哦！');
      }else if(noticeEntity.data.records.length<=0){
        Utils.showToast('没有更多通知啦！');
      }
      return noticeEntity;
    }
    if(pageIndex==1){
      _noticeList.clear();
    }
    Utils.showToast(noticeEntity.msg ?? '获取失败，请重新尝试');
    return null;
  }
}
