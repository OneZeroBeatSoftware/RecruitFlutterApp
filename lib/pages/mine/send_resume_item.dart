import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/apply_list_entity.dart';
import 'package:recruit_app/widgets/network_image.dart';

class SendResumeItem extends StatelessWidget {
  final ApplyListDataRecord job;
  final int index;
  final bool lastItem;

  const SendResumeItem({Key key, this.job, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobItem = Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(48),
        right: ScreenUtil().setWidth(48),
        top: ScreenUtil().setWidth(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        job.jobName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(36),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(20, 20, 20, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(14),
                    ),
                    Text(
                      '候选人${job.candidatesCurrent}/${job.candidatesTotal}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4),
              Text('${job.minSalary}-${job.maxSalary}K',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(68, 77, 151, 1))),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          Text(
            '${job.workAddress} ｜ ${job.workDateName} ｜ ${job.educationName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              color: Color.fromRGBO(151, 151, 151, 1),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(28),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(22)),
                child: NetImage(img: '${job.avatar}',placeholder: 'images/avatar_${index % 16 + 1}.png',error: 'images/avatar_${index % 16 + 1}.png',size: ScreenUtil().setWidth(44),),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(12),
              ),
              Flexible(
                child: Text(
                  job.companyName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(12),
              ),
              Text(
                '在线',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Color.fromRGBO(176, 181, 180, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setWidth(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: job.treatments != null ? Wrap(
                  children: job.treatments
                      .asMap()
                      .keys
                      .map(
                        (index) =>
                        Text(
                          '${job.treatments[index].treatmentName}${index == (job
                              .treatments.length - 1) ? "" : " ｜ "}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            color: Color.fromRGBO(151, 151, 151, 1),
                          ),
                        ),
                  )
                      .toList(),
                ) : Container(),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(8),
              ),

              Container(
                alignment: Alignment.center,
                child: Text(
                  "待查看",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(26),
                    color: Color.fromRGBO(159, 199, 235, 1),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(26),
                  vertical: ScreenUtil().setWidth(10),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(159, 199, 235, 1),
                      width: ScreenUtil().setWidth(2),
                    ),
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setWidth(34),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(15)),
            child: Text(
              DateUtil.formatDateMs(job.applyDate,format:"yyyy年MM月dd日HH:mm"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(176, 181, 180, 1),
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        jobItem,
        Container(
          height: ScreenUtil().setWidth(6),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
      ],
    );
  }
}
