import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/job_list.dart';

class CompanyJobItem extends StatelessWidget {
  final Job job;
  final int index;
  final bool lastItem;

  const CompanyJobItem({Key key, this.job, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobItem = Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(40),
      ),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  job.jobName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '${job.leastSalary}-${job.highestSalary}K',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(68, 77, 151, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setWidth(12),
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(12),
            runSpacing: ScreenUtil().setWidth(12),
            children: job.label.map((item) {
              return new Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16),
                  vertical: ScreenUtil().setWidth(6),
                ),
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius:
                      new BorderRadius.circular(ScreenUtil().setWidth(8)),
                ),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    color: Color.fromRGBO(95, 94, 94, 1),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
    return jobItem;
  }
}
