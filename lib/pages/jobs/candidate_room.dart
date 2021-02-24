import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/candidate_update_entity.dart';
import 'package:recruit_app/entity/interview_update_entity.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/entity/resume_list_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/event_bus_interview.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/model/seeker_interview_model.dart';
import 'package:recruit_app/pages/jobs/candidate_room_intro.dart';
import 'package:recruit_app/pages/jobs/chat_room.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class CandidateRoom extends StatefulWidget {
  final CandidateUpdateData candidateData;
  final JobDetailData jobData;
  final ResumeListDataResume resumeData;

  const CandidateRoom(
      {Key key, this.candidateData, this.jobData, this.resumeData})
      : super(key: key);

  @override
  _CandidateRoomState createState() {
    // TODO: implement createState
    return _CandidateRoomState();
  }
}

class _CandidateRoomState extends State<CandidateRoom> {
  ResumeDetailData _resumeDetailData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getResumeDetail('${widget.resumeData.id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> operateWidget = [];
    if(widget.candidateData.interview!=null){
      if (widget.candidateData.interview.state == '1') {
        operateWidget.add(Expanded(
          child: GestureDetector(
            onTap: () {
              _inviteInterView(widget.candidateData.interview.id,
                  widget.candidateData.interview.interviewDate, '3');
            },
            child: Container(
              height: ScreenUtil().setWidth(90),
              alignment: Alignment.center,
              child: Text(
                '拒绝',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          ),
        ));
        operateWidget.add(Expanded(
          child: GestureDetector(
            onTap: () {
              _adJustInterviewTime();
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: ScreenUtil().setWidth(90),
              alignment: Alignment.center,
              child: Text(
                '调整时间',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          ),
        ));
        operateWidget.add(Expanded(
          child: GestureDetector(
            onTap: () {
              _inviteInterView(widget.candidateData.interview.id,
                  widget.candidateData.interview.interviewDate, '2');
            },
            child: Container(
              height: ScreenUtil().setWidth(90),
              alignment: Alignment.center,
              child: Text(
                '接受',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          ),
        ));
      } else if (widget.candidateData.interview.state == '2') {
        operateWidget.add(Expanded(
          child: GestureDetector(
            onTap: () {
              _inviteInterView(widget.candidateData.interview.id,
                  widget.candidateData.interview.interviewDate, '4');
            },
            child: Container(
              height: ScreenUtil().setWidth(90),
              alignment: Alignment.center,
              child: Text(
                '取消',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          ),
        ));
        operateWidget.add(Expanded(
          child: GestureDetector(
            onTap: () {
              _adJustInterviewTime();
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: ScreenUtil().setWidth(90),
              alignment: Alignment.center,
              child: Text(
                '调整时间',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          ),
        ));
      }
    }

    String status = '面试邀请';
    if (widget.candidateData.interview != null) {
      switch (widget.candidateData.interview.state) {
        case "1":
          status = '待接受';
          break;
        case "2":
          status = '待面试';
          break;
        case "3":
          status = '拒绝';
          break;
        case "4":
          status = '取消';
          break;
        case "5":
          status = '通过';
          break;
        case "6":
          status = '未通过';
          break;
        case "7":
          status='取消候选';
          break;
        case "8":
          status='岗位失效';
          break;
      }
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('${widget.jobData.job.realName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(20, 20, 20, 1))),
//              Text('在线',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
          ],
        ),
        leading: IconButton(
            icon: Image.asset(
              'images/img_arrow_left_black.png',
              width: ScreenUtil().setWidth(20),
              height: ScreenUtil().setWidth(36),
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
              vertical: ScreenUtil().setWidth(26),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () async {
                      String url = 'tel:${widget.jobData.job.phone}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('暂不支持电话联系');
                      }
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/img_tel_gray.png',
                            width: ScreenUtil().setWidth(22),
                            height: ScreenUtil().setWidth(34),
                            fit: BoxFit.contain),
                        SizedBox(
                          height: ScreenUtil().setWidth(10),
                        ),
                        Text('电话',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatRoom(
                                    toId: widget.jobData.job.userId,
                                    toName: widget.jobData.job.realName,
                                    toAvatar: widget.jobData.job.avatar,
                                  )));
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/img_wechat_gray.png',
                            width: ScreenUtil().setWidth(48),
                            height: ScreenUtil().setWidth(34),
                            fit: BoxFit.contain),
                        SizedBox(
                          height: ScreenUtil().setWidth(10),
                        ),
                        Text('聊天',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (widget.candidateData.candidate == null ||
                          widget.candidateData.candidate.id == null ||
                          widget.candidateData.candidate.id.isEmpty) {
                        Navigator.pop(context);
                        return;
                      }
                      _deleteCandidate(widget.candidateData.candidate.id);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/img_not_interested.png',
                            width: ScreenUtil().setWidth(38),
                            height: ScreenUtil().setWidth(34),
                            fit: BoxFit.contain),
                        SizedBox(
                          height: ScreenUtil().setWidth(10),
                        ),
                        Text('不感兴趣',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(95, 94, 94, 1)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CandidateRoomIntro(
            jobData: widget.jobData,
            resumeData: _resumeDetailData,
          ),
          widget.candidateData.interview == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(48),
                    right: ScreenUtil().setWidth(48),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(20))),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(65, 123, 176, 0.1),
                          offset: Offset(0, ScreenUtil().setWidth(6)),
                          blurRadius: 8,
                          spreadRadius: ScreenUtil().setWidth(12))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(36),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil().setWidth(26),
                        ),
                        Text('面试状态：$status',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(20, 20, 20, 1))),
                        SizedBox(height: ScreenUtil().setWidth(20)),
                        Text(
                          '时间：${DateUtil.formatDateMs(widget.candidateData.interview.interviewDate, format: "yyyy-MM-dd HH:mm")}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          '地址：${widget.candidateData.interview.address}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(26),
                        ),
                        (widget.candidateData.interview.state == '1' ||
                                widget.candidateData.interview.state == '2')
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Color.fromRGBO(159, 199, 235, 1),
                                      width: ScreenUtil().setWidth(1),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: operateWidget,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  /// 调整时间
  void _adJustInterviewTime() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftDateTimePicker(
          title: '调整面试时间',
          initialTime: widget.candidateData.interview != null
              ? DateUtil.getDateTimeByMs(
                  widget.candidateData.interview.interviewDate)
              : DateTime.now(),
          confirm: (datetime) {
            Navigator.pop(context);
            _inviteInterView(
                widget.candidateData.interview.id,
                datetime.millisecondsSinceEpoch,
                widget.candidateData.interview.state);
          },
        );
      },
    );
  }

  /// 面试操作 state 1待接受 2待面试 3拒绝 4取消 5 通过 6 未通过
  void _inviteInterView(String id, int interviewDate, String state) async {
    InterviewUpdateEntity _baseEntity =
        await InterviewModel.instance.saveInterview(
      context,
      id: id,
      state: state,
      interviewDate: interviewDate,
      address:
          '${widget.jobData.job.cityName}${widget.jobData.job.workAddress}',
      companyId: widget.jobData.job.companyId,
      jobId: widget.jobData.job.id,
      jobSeekerId: '${widget.resumeData.jobSeekerId}',
      recruiterId: widget.jobData.job.recruiterId,
    );
    if (_baseEntity != null) {
      eventBus.fire(RefreshInterview('refresh'));
      CandidateUpdateDataApply interview = CandidateUpdateDataApply()
        ..id = _baseEntity.data.id
        ..interviewDate = interviewDate
        ..state = state
        ..recruiterId = widget.jobData.job.recruiterId
        ..jobSeekerId = '${widget.resumeData.jobSeekerId}'
        ..companyId = widget.jobData.job.companyId
        ..jobId = widget.jobData.job.id
        ..address =
            '${widget.jobData.job.cityName}${widget.jobData.job.workAddress}';
      setState(() {
        widget.candidateData.interview = interview;
      });
    }
  }

  /// 删除候选人
  _deleteCandidate(String id) async {
    BaseRespEntity _baseEntity =
        await BossMineModel.instance.deleteCandidate(context, id);
    if (_baseEntity != null) {
      Navigator.pop(context);
    }
  }

  /// 获取简历详情
  _getResumeDetail(String id) {
    MineModel.instance.getResumeDetail(context, id).then((detail) {
      if (detail != null) {
        setState(() {
          _resumeDetailData = detail;
        });
      }
    });
  }
}
