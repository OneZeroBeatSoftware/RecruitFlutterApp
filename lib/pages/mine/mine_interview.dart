import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/model/msg_type.dart';
import 'package:recruit_app/model/seeker_interview_model.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/msg/msg_interview_item.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';
class MineInterView extends StatefulWidget {
  final MsgType msgType;
  MineInterView({this.msgType=MsgType.seeker});

  @override
  _MineInterViewState createState() => _MineInterViewState();
}

class _MineInterViewState extends State<MineInterView> {
  int _pageIndex = 1;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '面试列表',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Expanded(
            child: EasyRefresh.custom(
              controller: _refreshController,
              firstRefresh: true,
              header: MaterialHeader(),
              footer:
                  ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
              onRefresh: () async {
                _pageIndex = 1;
                getInterviewList();
                _refreshController.resetLoadState();
              },
              onLoad: () async {
                getInterviewList();
                _refreshController.resetLoadState();
              },
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, idx) {
                  var key = GlobalKey<SlideButtonState>();
                  if (idx < InterviewModel.instance.interviewList.length) {
                    return GestureDetector(
                      onTap: () {
                        if(InterviewModel.instance.interviewList[idx].state=='7'){
                          Utils.showToast('求职者已不是候选人，面试取消');
                          return;
                        }
                        if(InterviewModel.instance.interviewList[idx].state=='8'){
                          Utils.showToast('岗位信息已删除，面试取消');
                          return;
                        }
                        if(widget.msgType==MsgType.recruiter) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeDetail(resumeId: InterviewModel
                                    .instance.interviewList[idx].id,resumeDetailType: ResumeDetailType.interview,),
                              ));
                        }else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetail(
                                      jobId: InterviewModel
                                          .instance.interviewList[idx].jobId,
                                      jobDetailType: JobDetailType.interview,
                                    )));
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: MsgInterviewItem(
                        msgType: widget.msgType,
                        btnKey: key,
                        index: idx,
                        interview: InterviewModel.instance.interviewList[idx],
                        deleteItem: (index) {
                          deleteInterview(InterviewModel.instance.interviewList[idx].id, index);
                        },
                      ),
                    );
                  }
                  return null;
                }, childCount: InterviewModel.instance.interviewList.length)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 获取面试邀请列表
  getInterviewList() async {
    SeekerInterviewEntity _interviewEntity;
    if(widget.msgType==MsgType.recruiter){
      _interviewEntity= await InterviewModel.instance.getInterviewList(context, _pageIndex, 15,recruiterId: Application.sp.get('recruiterId'));
    }else {
      _interviewEntity= await InterviewModel.instance.getInterviewList(context, _pageIndex, 15,jobSeekerId: Application.sp.get('jobSeekerId'),state: '2');
    }
    if (_interviewEntity != null && _interviewEntity.data.records.length > 0) {
      _pageIndex++;
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
