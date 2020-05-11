import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';

class CandidateRoomIntro extends StatelessWidget {
  final JobDetailData jobData;
  final ResumeDetailData resumeData;

  const CandidateRoomIntro({Key key, this.jobData, this.resumeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resumeWidget;
    if(resumeData==null){
      resumeWidget=Container();
    }else {
      resumeWidget=Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setWidth(26),
          ),
          GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeDetail(
                    resumeId: resumeData.resume.id,
                    resumeDetailType: ResumeDetailType
                        .readOnly,),
                ));
          },child: Container(
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
                  horizontal: ScreenUtil().setWidth(36)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setWidth(36),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text('简历：${resumeData.resume.resumeName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(20, 20, 20, 1))),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(16)),
                      Text(
                          '${resumeData.resume.minSalary}-${resumeData.resume.maxSalary}K',
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(32),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(68, 77, 151, 1))),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(26),
                  ),
                  Wrap(
                    spacing: ScreenUtil().setWidth(12),
                    runSpacing: ScreenUtil().setWidth(12),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${resumeData.resume.workDateName}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${resumeData.resume.age}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${resumeData.resume.educationName}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(36),
                  ),
                ],
              ),
            ),
          ),),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(48),
          right: ScreenUtil().setWidth(48),
          top: ScreenUtil().setWidth(36),
          bottom: ScreenUtil().setWidth(36)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetail(jobId:jobData.job.id,jobDetailType: JobDetailType.readOnly,),
                ));
          },behavior: HitTestBehavior.opaque,child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(65, 123, 176, 0.1),
                    offset: Offset(0, ScreenUtil().setWidth(6)),
                    blurRadius: 8,
                    spreadRadius: ScreenUtil().setWidth(12))
              ],
            ),
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setWidth(36),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text('岗位：${jobData.job.jobName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(20, 20, 20, 1))),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(16)),
                      Text('${jobData.job.minSalary}-${jobData.job.maxSalary}K',
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(32),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(68, 77, 151, 1))),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(26),
                  ),
                  Wrap(
                    spacing: ScreenUtil().setWidth(12),
                    runSpacing: ScreenUtil().setWidth(12),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${jobData.job.cityName}${jobData.job.workAddress}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${jobData.job.workDateName}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24),
                            vertical: ScreenUtil().setWidth(4)),
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
                          '${jobData.job.educationName}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(24)),
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(20)),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                    ),
                    child: Text(
                      '${jobData.job.jobContent}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1)),
                    ),
                  ),
//                Container(
//                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(24)),
//                  padding:
//                      EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
//                  decoration: BoxDecoration(
//                    border: Border(
//                      top: BorderSide(
//                        color: Color.fromRGBO(159, 199, 235, 1),
//                        width: ScreenUtil().setWidth(1),
//                      ),
//                    ),
//                  ),
//                  child: Text(
//                    '1月12日09:51由他发起的沟通',
//                    maxLines: 1,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(
//                        fontSize: ScreenUtil().setSp(24), color: Color.fromRGBO(176, 181, 180, 1)),
//                  ),
//                ),
                ],
              ),
            ),
          ),),
          resumeWidget
        ],
      ),
    );
  }
}
