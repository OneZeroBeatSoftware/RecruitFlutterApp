import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/model/job_model.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/jobs/chat_room.dart';
import 'package:recruit_app/pages/jobs/list_menu_dialog.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class JobDetail extends StatefulWidget {
  final String jobId;

  const JobDetail({Key key, this.jobId = '1'}) : super(key: key);

  @override
  _JobDetailState createState() {
    // TODO: implement createState
    return _JobDetailState();
  }
}

class _JobDetailState extends State<JobDetail> {
  bool _isCollected=false;
  List<String> _reports=[];
  JobModel _jobModel;

  JobDetailData _jobDetailData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i1 = 0; i1 < 20; i1++) {
      _reports.add('广告骚扰');
    }
    WidgetsBinding.instance.addPostFrameCallback((i) {
      _jobModel = Provider.of<JobModel>(context);
      getJobDetail(widget.jobId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: CommonAppBar(
          leading: 'images/img_arrow_left_black.png',
          leftListener: () {
            Navigator.pop(context);
          },
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_jobDetailData==null?'':_jobDetailData.job.realName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(20, 20, 20, 1))),
              SizedBox(
                height: 8,
              ),
              Text('在线',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
            ],
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          rightAction: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _isCollected=!_isCollected;
                  });
                },
                child: Image.asset(
                  _isCollected?'images/img_heart_focus.png':'images/img_heart_unfocus.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation1, animation2) { return null;},
                    barrierColor: Colors.black.withOpacity(0.4),
                    barrierDismissible: true,
                    barrierLabel: "Dismiss",
                    transitionDuration: Duration(milliseconds: 300),
                    transitionBuilder: (context, animation1, animation2, widget) {
                      final curvedValue =
                          Curves.easeInOut.transform(animation1.value) - 1.0;
                      return Transform(
                        transform:
                        Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
                        child: Opacity(
                          opacity: animation1.value,
                          child: ListMenuDialog(
                            title: '举报',
                            cancel: () {
                              Navigator.pop(context);
                            },
                            confirm: () {
                              Navigator.pop(context);
                            },
                            itemSelected: (){
                              Navigator.pop(context);

                            },
                            lists: _reports,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset(
                  'images/img_report.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Image.asset(
                  'images/img_share.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(48),
              ),
            ],
          ),
        ),
        body: _jobDetailData == null
            ? Container(
                height: ScreenUtil().setWidth(400),
                alignment: Alignment.center,
                child: CupertinoActivityIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(1),
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(48),
                            right: ScreenUtil().setWidth(48),
                            top: ScreenUtil().setWidth(46),
                            bottom: ScreenUtil().setWidth(40)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(_jobDetailData.job.jobName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          wordSpacing: 1,
                                          letterSpacing: 1,
                                          fontSize: ScreenUtil().setSp(40),
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(20, 20, 20, 1))),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(14)),
                                Text('${_jobDetailData.job.minSalary}-${_jobDetailData.job.maxSalary}K',
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: ScreenUtil().setSp(36),
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(68, 77, 151, 1))),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(14),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'images/img_job_detail_location.png',
                                  width: ScreenUtil().setWidth(24),
                                  height: ScreenUtil().setWidth(30),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(12),
                                ),
                                Text('${_jobDetailData.job.workAddress}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24),
                                        color: Color.fromRGBO(95, 94, 94, 1))),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Wrap(children: _jobDetailData.treatments.asMap().keys.map((index)=> Text(
                                  '${_jobDetailData.treatments[index].treatmentName}${index==(_jobDetailData.treatments.length-1)?"":" ｜ "}',
                                    textAlign: TextAlign.right,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24),
                                        color:
                                        Color.fromRGBO(95, 94, 94, 1))
                                ),).toList(),),),
                              ],
                            ),
                            Container(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              height: ScreenUtil().setWidth(1),
                              margin: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(48)),
                            ),
                            Row(
                              children: <Widget>[
                                Text('岗位详情',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(36),
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(57, 57, 57, 1))),
                                SizedBox(
                                  height: ScreenUtil().setWidth(12),
                                ),
                                Expanded(
                                  child: Text('候选人${_jobDetailData.job.candidatesCurrent}/${_jobDetailData.job.candidatesTotal}',
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(24),
                                          color: Color.fromRGBO(
                                              176, 181, 180, 1))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(20),
                            ),
                            Text('工作内容：',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color.fromRGBO(95, 94, 94, 1))),
                            SizedBox(
                              height: ScreenUtil().setWidth(12),
                            ),
                            Text(
                              '${_jobDetailData.job.jobContent}',
                                style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 1,
                                    height: 1.5,
                                    fontWeight: FontWeight.w300,
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(95, 94, 94, 1))),
                            SizedBox(
                              height: ScreenUtil().setWidth(16),
                            ),
                            Text('岗位要求：',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color.fromRGBO(95, 94, 94, 1))),
                            SizedBox(
                              height: ScreenUtil().setWidth(12),
                            ),
                            Text(
                                '1、本科及以上学历，美术、平面设计等相关专业；\n2、有良好的手绘功底，会设计活动海报，有插画师经验者优先，有广告公司或企业线下活动者优先；',
                                style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 1,
                                    height: 1.5,
                                    fontWeight: FontWeight.w300,
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(95, 94, 94, 1))),
                            SizedBox(
                              height: ScreenUtil().setWidth(20),
                            ),
                            Wrap(
                              spacing: ScreenUtil().setWidth(12),
                              runSpacing: ScreenUtil().setWidth(12),
                              children: _jobDetailData.jobTags.map((item)=>  Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(24),
                                    vertical: ScreenUtil().setWidth(6)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(1000),
                                  ),
                                  border: Border.all(
                                    color: Color.fromRGBO(159, 199, 235, 1),
                                    width: ScreenUtil().setWidth(1),
                                  ),
                                ),
                                child: Text(
                                  item.tagName,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(22),
                                    color: Color.fromRGBO(159, 199, 235, 1),
                                  ),
                                ),
                              ),).toList(),
                            ),
                            Container(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              height: ScreenUtil().setWidth(1),
                              margin: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(38)),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            ScreenUtil().setWidth(8))),
                                    child: Image.asset(
                                        'images/ic_ask_resume_action.png',
                                        width: ScreenUtil().setWidth(80),
                                        height: ScreenUtil().setWidth(80),
                                        fit: BoxFit.cover),
                                  ),
                                  SizedBox(width: ScreenUtil().setWidth(20)),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${_jobDetailData.job.companyName}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(32),
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  57, 57, 57, 1))),
                                      SizedBox(
                                        height: ScreenUtil().setWidth(10),
                                      ),
                                      Text('已上市 · 800人 · O2O',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(24),
                                              color: Color.fromRGBO(
                                                  95, 94, 94, 1))),
                                    ],
                                  )),
                                  SizedBox(width: ScreenUtil().setWidth(30)),
                                  Image.asset(
                                    'images/img_arrow_right_blue.png',
                                    width: ScreenUtil().setWidth(10),
                                    height: ScreenUtil().setWidth(20),
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CompanyDetail()));
                              },
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(38),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(30))),
                              child: Image.asset(
                                  'images/img_location_example.png',
                                  height: ScreenUtil().setWidth(400),
                                  fit: BoxFit.cover),
                            ),
                            Container(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              height: ScreenUtil().setWidth(1),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setWidth(38),
                                  bottom: ScreenUtil().setWidth(48)),
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/img_job_detail_remind.png',
                                  width: ScreenUtil().setWidth(28),
                                  height: ScreenUtil().setWidth(24),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                Text('温馨提示',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(255, 34, 34, 1))),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(20),
                            ),
                            Text('该软件承诺名下所有职位不向您收取费用，如有不实，请立即举报。',
                                style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 1,
                                    height: 1.5,
                                    fontWeight: FontWeight.w300,
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(95, 94, 94, 1))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setWidth(1),
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  SafeArea(
                    top: false,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(48),
                            vertical: ScreenUtil().setWidth(16)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatRoom()));
                          },
                          textColor: Color.fromRGBO(159, 199, 235, 1),
                          child: Text("立即沟通"),
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(30),
                              vertical: ScreenUtil().setWidth(14)),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color.fromRGBO(159, 199, 235, 1),
                                width: ScreenUtil().setWidth(2),
                              ),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(1000))),
                        )),
                  ),
                ],
              ));
  }

  void getJobDetail(String jobId) async {
    JobDetailEntity jobDetailEntity =
        await _jobModel.getJobDetail(context, jobId);
    if (jobDetailEntity.data != null) {
      setState(() {
        _jobDetailData=jobDetailEntity.data;
      });
    }
  }
}
