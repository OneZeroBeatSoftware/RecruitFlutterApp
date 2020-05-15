import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/entity/seeker_notice_entity.dart';
import 'package:recruit_app/main.dart';
import 'package:recruit_app/model/event_bus_interview.dart';
import 'package:recruit_app/model/msg_type.dart';
import 'package:recruit_app/model/seeker_interview_model.dart';
import 'package:recruit_app/model/seeker_notice_model.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/pages/jobs/chat_room.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/msg/msg_chat_item.dart';
import 'package:recruit_app/pages/msg/msg_interview_item.dart';
import 'package:recruit_app/pages/msg/msg_notify.dart';
import 'package:recruit_app/pages/msg/msg_notify_item.dart';
import 'package:recruit_app/pages/msg/service_chat_room.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/badge_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';
class MsgList extends StatefulWidget {
  final MsgType msgType;

  const MsgList({Key key, this.msgType=MsgType.seeker}) : super(key: key);
  @override
  _MsgListState createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> {
//  bool _firstType = true;
  bool _firstType = false;
  bool _secondType = true;

  int _interviewPage = 1;
  int _noticePage = 1;
  EasyRefreshController _refreshController;
  StreamSubscription _refreshInterview;

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = EasyRefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _interviewPage = 1;
      getInterviewList(widget.msgType, pageSize: InterviewModel
          .instance.interviewList.length < 15 ? 15 : InterviewModel
          .instance.interviewList.length);
//        _noticePage = 1;
//        getNoticeList();
    });
    _refreshInterview=eventBus.on<RefreshInterview>().listen((event) {
      _interviewPage = 1;
      getInterviewList(widget.msgType, pageSize: InterviewModel
          .instance.interviewList.length < 15 ? 15 : InterviewModel
          .instance.interviewList.length);
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    if(_refreshInterview!=null){
      _refreshInterview.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int childCount;
    if(!_firstType && _secondType){
      childCount=InterviewModel.instance.interviewList.length;
    }else if(!_firstType && !_secondType){
      childCount=NoticeModel.instance.noticeList.length+1;
    }else {
      childCount=2;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(48),
//                vertical: ScreenUtil().setWidth(28),
//              ),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  BadgeView(
//                    badgeSize: ScreenUtil().setWidth(10),
//                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
//                    isShowBadge: false,
//                    content: '互动',
//                    fontWeight:
//                        _firstType ? FontWeight.bold : FontWeight.normal,
//                    fontSize: ScreenUtil().setSp(36),
//                    textColor: _firstType
//                        ? Color.fromRGBO(20, 20, 20, 1)
//                        : Color.fromRGBO(95, 94, 94, 1),
//                    onTap: () {
//                      setState(() {
//                        _firstType = true;
//                        _secondType = true;
//                      });
//                    },
//                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(60),
//                  ),
//                  BadgeView(
//                    badgeSize: ScreenUtil().setWidth(10),
//                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
//                    isShowBadge: true,
//                    content: '通知',
//                    fontWeight:
//                        _firstType ? FontWeight.normal : FontWeight.bold,
//                    fontSize: ScreenUtil().setSp(36),
//                    textColor: _firstType
//                        ? Color.fromRGBO(95, 94, 94, 1)
//                        : Color.fromRGBO(20, 20, 20, 1),
//                    onTap: () {
//                      setState(() {
//                        _firstType = false;
//                        _secondType = true;
//                      });
//                    },
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              height: ScreenUtil().setWidth(1),
//              color: Color.fromRGBO(245, 245, 245, 1),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(48),
//                vertical: ScreenUtil().setWidth(25),
//              ),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  BadgeView(
//                    badgeSize: ScreenUtil().setWidth(10),
//                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
//                    isShowBadge: false,
//                    content: _firstType ? '招呼' : '面试邀请',
//                    fontWeight:
//                        _secondType ? FontWeight.bold : FontWeight.normal,
//                    fontSize: ScreenUtil().setSp(32),
//                    textColor: _secondType
//                        ? Color.fromRGBO(68, 77, 151, 1)
//                        : Color.fromRGBO(95, 94, 94, 1),
//                    onTap: () {
//                      setState(() {
//                        _secondType = true;
//                      });
//                    },
//                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(30),
//                  ),
//                  BadgeView(
//                    badgeSize: ScreenUtil().setWidth(10),
//                    badgeColor: Color.fromRGBO(255, 0, 0, 1),
//                    isShowBadge: true,
//                    content: _firstType ? '沟通中' : '系统',
//                    fontWeight:
//                        _secondType ? FontWeight.normal : FontWeight.bold,
//                    fontSize: ScreenUtil().setSp(32),
//                    textColor: _secondType
//                        ? Color.fromRGBO(95, 94, 94, 1)
//                        : Color.fromRGBO(68, 77, 151, 1),
//                    onTap: () {
//                      setState(() {
//                        _secondType = false;
//                      });
//                    },
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.only(
//                left: ScreenUtil().setWidth(48),
//                right: ScreenUtil().setWidth(48),
//              ),
//              height: ScreenUtil().setWidth(1),
//              color: Color.fromRGBO(159, 199, 235, 1),
//            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(28),
              ),
              child: BadgeView(
                badgeSize: ScreenUtil().setWidth(10),
                badgeColor: Color.fromRGBO(255, 0, 0, 1),
                isShowBadge: false,
                content: '面试',
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(36),
                textColor:Color.fromRGBO(68, 77, 151, 1),
                onTap: () {
                },
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(159, 199, 235, 1),
            ),
            Expanded(
              child: EasyRefresh.custom(
                controller: _refreshController,
//                firstRefresh: true,
                header: MaterialHeader(),
                footer:
                ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
                onRefresh: () async {
                  if(!_firstType && _secondType){
                    _interviewPage = 1;
                    getInterviewList(widget.msgType);
                    _refreshController.resetLoadState();
                  }else if(!_firstType && !_secondType){
                    _noticePage = 1;
                    getNoticeList();
                    _refreshController.resetLoadState();
                  }
                },
                onLoad: () async {
                  if(!_firstType && _secondType){
                    getInterviewList(widget.msgType);
                    _refreshController.resetLoadState();
                  }else if(!_firstType && !_secondType){
                    getNoticeList();
                    _refreshController.resetLoadState();
                  }
                },
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((cxt, idx) {
                      var key = GlobalKey<SlideButtonState>();
                      if (_firstType && _secondType) {
                        return GestureDetector(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ChatRoom()));
                        }, behavior: HitTestBehavior.opaque, child: MsgChatItem(
                            btnKey: key),);
                      } else if (_firstType && !_secondType) {
                        return GestureDetector(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ChatRoom()));
                        },
                          behavior: HitTestBehavior.opaque,
                          child: MsgChatItem(btnKey: key),);
                      } else if (!_firstType && _secondType) {
                        return GestureDetector(onTap: () {
                          if(InterviewModel.instance.interviewList[idx].state=='7'){
                            Utils.showToast('求职者已不是候选人，面试取消');
                            return;
                          }
                          if(InterviewModel.instance.interviewList[idx].state=='8'){
                            Utils.showToast('岗位信息已删除，面试取消');
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              widget.msgType == MsgType.recruiter ?
                              EmployeeDetail(resumeId: InterviewModel
                                  .instance.interviewList[idx].resumeId,
                                resumeDetailType: ResumeDetailType.interview,)
                                  : JobDetail(
                                jobId: InterviewModel
                                    .instance.interviewList[idx].jobId,
                                jobDetailType: JobDetailType.interview,
                              ),),);
                        },
                          behavior: HitTestBehavior.opaque,
                          child: MsgInterviewItem(
                            msgType: widget.msgType,
                            btnKey: key,
                            index: idx,
                            interview: InterviewModel.instance
                                .interviewList[idx],
                            deleteItem: (index) {
                              deleteInterview(
                                  InterviewModel.instance.interviewList[idx].id,
                                  index);
                            },
                          ),);
                      } else if (!_firstType && !_secondType) {
                        if (idx == NoticeModel.instance.noticeList.length) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: MsgNotifyItem(
                              btnKey: key,
                              title: '我的客服',
                              content: '您好，请问有什么可以为您服务的吗？',
                              imgPath: 'images/img_service_blue.png',
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ServiceChatRoom()));
                            },
                          );
                        }
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: MsgNotifyItem(
                            btnKey: key,
                            time: DateUtil.formatDateMs(
                                NoticeModel.instance.noticeList[idx].createDate,
                                format: "HH:mm"),
                            title: NoticeModel.instance.noticeList[idx]
                                .noticeName,
                            content: NoticeModel.instance.noticeList[idx]
                                .content,
                            imgPath: 'images/img_notify_blue.png',
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MsgNotify()));
                          },
                        );
                      }
                      return null;
                    }, childCount: childCount),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(48),
                              right: ScreenUtil().setWidth(48),
                              top: ScreenUtil().setWidth(24),
                            ),
                            child: Text(
                              _firstType
                                  ? '以上是30天内的联系人'
                                  : _secondType
                                  ? ''
                                  : '客服电话 888-888-8888\n工作时间 09:30-18:30',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(22),
                                height: 1.4,
                                color: Color.fromRGBO(176, 181, 180, 1),
                              ),
                            ),
                          ),
                          visible: _firstType || !_secondType,
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(44),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取通知列表
  getNoticeList() async {
    SeekerNoticeEntity _notifyEntity = await NoticeModel.instance
        .getNoticeList(
        context,_noticePage, 15);
    if (_notifyEntity != null && _notifyEntity.data.records.length > 0) {
      _noticePage++;
    }
    setState(() {});
  }

  /// 获取面试邀请列表
  getInterviewList(MsgType msgType,{int pageSize=15}) async {
    SeekerInterviewEntity _interviewEntity;
    if(msgType==MsgType.recruiter){
      _interviewEntity= await InterviewModel.instance.getInterviewList(context, _interviewPage, pageSize,recruiterId: Application.sp.get('recruiterId'),);
    }else {
      _interviewEntity= await InterviewModel.instance.getInterviewList(context, _interviewPage, pageSize,jobSeekerId: Application.sp.get('jobSeekerId'),);
    }

    if (_interviewEntity != null && _interviewEntity.data.records.length > 0) {
      _interviewPage++;
    }
    setState(() {});
  }

  /// 删除面试邀请
  deleteInterview(String id,int index) async {
    BaseRespEntity _baseEntity = await InterviewModel.instance
        .deleteInterview(context,id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??'删除成功');
      InterviewModel.instance.interviewList.removeAt(index);
      setState(() {});
    }
  }
}
