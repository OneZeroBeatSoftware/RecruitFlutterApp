import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/job_filter_data.dart';
import 'package:recruit_app/pages/jobs/job_filter_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class JobFilter extends StatefulWidget {
  @override
  _JobFilterState createState() => _JobFilterState();
}

class _JobFilterState extends State<JobFilter> {
  List<JobFilterData> _jobFilterData = JobFilterList.loadJobFilterData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '筛选',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        rightAction: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(46)),
            child: Text(
              '确定',
              style: TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1),
                fontSize: ScreenUtil().setSp(32),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, idx) {
          if (idx < _jobFilterData.length) {
            return JobFilterItem(
              jobFilterData: _jobFilterData[idx],
              index: idx,
              lastItem: idx == _jobFilterData.length - 1,
              onTap: (item){
                setState(() {
                  item.isChecked=!item.isChecked;
                });
              },
            );
          }
          return null;
        },
        itemCount: _jobFilterData.length,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
