import 'package:flutter/material.dart';
import 'package:recruit_app/entity/boss_job_manage_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/vertical_divider.dart';

class JobManageItem extends StatelessWidget {
  final BossJobManageDataRecord jobManageData;
  final int index;

  const JobManageItem({Key key, this.jobManageData, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle row2TextStyle = TextStyle(
      color: Color.fromRGBO(95,94,94,1),
      fontSize: ScreenUtil().setWidth(26),
      fontWeight: FontWeight.w300
    );

    String status='';
    if(jobManageData.state==1){
      status='已隐藏';
    }else if(jobManageData.state==2){
      status='暂停招聘';
    }else{
      status='招聘中';
    }
    
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
             left: ScreenUtil().setHeight(48),
            top: ScreenUtil().setHeight(38),
            right: ScreenUtil().setHeight(38),
            bottom: ScreenUtil().setHeight(32),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(jobManageData.jobName, style: TextStyle(
                      color: Color.fromRGBO(1,51,51,1),
                      fontSize: ScreenUtil().setSp(36),
                      fontWeight: FontWeight.w400
                    ),),
                    SizedBox(width: ScreenUtil().setWidth(28)),
                    Text('候选人${jobManageData.candidatesCurrent}/${jobManageData.candidatesTotal}',
                      style: TextStyle(
                      color: Color.fromRGBO(176,181,180,1),
                      fontWeight: FontWeight.w300,
                      fontSize: ScreenUtil().setSp(24),
                       letterSpacing: 1
                    ),),
                  ],
                ),
                Text('${jobManageData.minSalary}/${jobManageData.maxSalary}K', style: TextStyle(
                  color: Color.fromRGBO(68,77,151,1),
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.w500

                ))
              ],),
              SizedBox(height: ScreenUtil().setHeight(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(jobManageData.workAddress, style: row2TextStyle),
                      ProfileVerticalDivider(),
                      Text(jobManageData.workDateName, style: row2TextStyle),
                      ProfileVerticalDivider(),
                      Text(jobManageData.educationName, style: row2TextStyle),
                    ],
                  ),
                  Row(children: <Widget>[
                    Text('$status', style: TextStyle(
                      color: Color.fromRGBO(59,199,235,1),
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.w300
                    ),),
                    SizedBox(width: ScreenUtil().setWidth(18)),
                    Image.asset('images/img_arrow_right_blue.png',
                       width:ScreenUtil().setWidth(12),
                       height: ScreenUtil().setHeight(20)
                    )
                  ],),
                ],),
            ],
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(3),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
      ],
    );
  }
}
