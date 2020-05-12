import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/boss_job_manage_entity.dart';
import 'package:recruit_app/entity/candidate_update_entity.dart';
import 'package:recruit_app/entity/interview_update_entity.dart';
import 'package:recruit_app/entity/main_resume_detail_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/seeker_interview_model.dart';
import 'package:recruit_app/pages/employe/candidate_boss_room_intro.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateBossRoom extends StatefulWidget {
  final CandidateUpdateData candidateData;
  final BossJobManageDataRecord jobData;
  final MainResumeDetailData resumeData;

  const CandidateBossRoom(
      {Key key, this.candidateData, this.jobData, this.resumeData})
      : super(key: key);

  @override
  _CandidateBossRoomState createState() {
    // TODO: implement createState
    return _CandidateBossRoomState();
  }
}

class _CandidateBossRoomState extends State<CandidateBossRoom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> operateWidget = [];
    operateWidget.add(Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () async {
          String url = 'tel:${widget.resumeData.resume.phone}';
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
    ));
    if (widget.candidateData.interview == null) {
      operateWidget.add(Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            _adJustInterviewTime(false);
          },
          behavior: HitTestBehavior.opaque,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/img_send_resunme.png',
                  width: ScreenUtil().setWidth(38),
                  height: ScreenUtil().setWidth(34),
                  fit: BoxFit.contain),
              SizedBox(
                height: ScreenUtil().setWidth(10),
              ),
              Text('邀请面试',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1)))
            ],
          ),
        ),
      ));
    }
    operateWidget.add(Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
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
    ));

    List<Widget> interViewOperate=[];
    interViewOperate.add(Expanded(
      child: GestureDetector(
        onTap: () {
          _inviteInterView(
              widget.candidateData.interview.id,
              widget.candidateData.interview.interviewDate,
              '4');
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
                color: Color.fromRGBO(
                    159, 199, 235, 1),
                fontSize:
                ScreenUtil().setSp(28)),
          ),
        ),
        behavior: HitTestBehavior.opaque,
      ),
    ));
    interViewOperate.add(Expanded(
      child: GestureDetector(
        onTap: () {
          _adJustInterviewTime(true);
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
                color: Color.fromRGBO(
                    159, 199, 235, 1),
                fontSize:
                ScreenUtil().setSp(28)),
          ),
        ),
      ),
    ));
    if(widget.candidateData.interview!=null){
    if(widget.candidateData.interview.state=='2'){
      interViewOperate.add(Expanded(
        child: GestureDetector(
          onTap: () {
            _inviteInterView(
                widget.candidateData
                    .interview.id,
                widget.candidateData
                    .interview.interviewDate,
                '6');
          },
          child: Container(
            height:
            ScreenUtil().setWidth(90),
            alignment: Alignment.center,
            child: Text(
              '不录取',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color.fromRGBO(
                      159, 199, 235, 1),
                  fontSize: ScreenUtil()
                      .setSp(28)),
            ),
          ),
          behavior: HitTestBehavior.opaque,
        ),
      ));
      interViewOperate.add(Expanded(
        child: GestureDetector(
          onTap: () {
            _inviteInterView(
                widget.candidateData.interview.id,
                widget.candidateData.interview.interviewDate,
                '5');
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height:
            ScreenUtil().setWidth(90),
            alignment: Alignment.center,
            child: Text(
              '录取',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color.fromRGBO(
                      159, 199, 235, 1),
                  fontSize: ScreenUtil()
                      .setSp(28)),
            ),
          ),
        ),
      ));
    }}
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
            Text('${widget.resumeData.resume.realName}',
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
              width: ScreenUtil().setWidth(15),
              height: ScreenUtil().setWidth(30),
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
              children: operateWidget,
            ),
          ),
          CandidateBossRoomIntro(
            jobData: widget.jobData,
            resumeData: widget.resumeData,
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
                                  children: interViewOperate,
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
  void _adJustInterviewTime(bool isModify) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftDateTimePicker(
          title: isModify ? '调整面试时间' : '面试时间',
          initialTime: widget.candidateData.interview != null
              ? DateUtil.getDateTimeByMs(
                  widget.candidateData.interview.interviewDate)
              : DateTime.now(),
          confirm: (datetime) {
            Navigator.pop(context);
            if (isModify) {
              _inviteInterView(
                  widget.candidateData.interview.id,
                  datetime.millisecondsSinceEpoch,
                  widget.candidateData.interview.state
                  );
            } else {
              _inviteInterView(null,datetime.millisecondsSinceEpoch,'1');
            }
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
      address: '${widget.jobData.cityName}${widget.jobData.workAddress}',
      companyId: widget.jobData.companyId,
      jobId: widget.jobData.id,
      jobSeekerId: widget.resumeData.resume.jobSeekerId,
      recruiterId: widget.jobData.recruiterId,
    );
    if (_baseEntity != null) {
      CandidateUpdateDataApply interview = CandidateUpdateDataApply()
        ..id = _baseEntity.data.id
        ..interviewDate = interviewDate
        ..state = state
        ..recruiterId = widget.jobData.recruiterId
        ..jobSeekerId = widget.resumeData.resume.jobSeekerId
        ..companyId = widget.jobData.companyId
        ..jobId = widget.jobData.id
        ..address = '${widget.jobData.cityName}${widget.jobData.workAddress}';
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
}
