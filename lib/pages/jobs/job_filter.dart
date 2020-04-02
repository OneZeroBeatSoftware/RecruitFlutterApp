import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/salary_list_entity.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/model/job_filter_data.dart';
import 'package:recruit_app/pages/jobs/job_filter_item.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class JobFilter extends StatefulWidget {
  @override
  _JobFilterState createState() => _JobFilterState();
}

class _JobFilterState extends State<JobFilter> {
  List<JobFilterData> _jobFilterData = JobFilterList.loadJobFilterData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((i) {
      getEduLevel();
      getSalaryList();
      getWorkDate();
      getScaleList();
    });
  }

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
              onTap: (item) {
                setState(() {
                  item.isChecked = !item.isChecked;
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

  void getEduLevel() async {
    EduLevelEntity eduLevelEntity = await NetUtils.getEduLevel(context);
    if(eduLevelEntity.statusCode==200&&eduLevelEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '学历要求',
          filterSubData: eduLevelEntity.data
              .map((item) => JobFilterSubData(
              filterName: item.educationName, isChecked: false))
              .toList()));
      setState(() {
        // ignore: unnecessary_statements
        _jobFilterData;
      });
    }
  }

  void getWorkDate() async {
    WorkDateEntity workDateEntity = await NetUtils.getWorkDate(context);
    if(workDateEntity.statusCode==200&&workDateEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '经验要求',
          filterSubData: workDateEntity.data
              .map((item) => JobFilterSubData(
              filterName: item.workDateName, isChecked: false))
              .toList()));
      setState(() {
        // ignore: unnecessary_statements
        _jobFilterData;
      });
    }
  }

  void getSalaryList() async {
    SalaryListEntity salaryListEntity = await NetUtils.getSalaryList(context);
    if(salaryListEntity.statusCode==200&&salaryListEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '薪资待遇',
          filterSubData: salaryListEntity.data
              .map((item) => JobFilterSubData(
              filterName: '${item.minSalary}-${item.maxSalary}K', isChecked: false))
              .toList()));
      setState(() {
        // ignore: unnecessary_statements
        _jobFilterData;
      });
    }
  }

  void getScaleList() async {
    CompanyScaleEntity scaleEntity = await NetUtils.getScaleList(context);
    if(scaleEntity.statusCode==200&&scaleEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '公司规模',
          filterSubData: scaleEntity.data
              .map((item) => JobFilterSubData(
              filterName: item.scaleName, isChecked: false))
              .toList()));
      setState(() {
        // ignore: unnecessary_statements
        _jobFilterData;
      });
    }
  }
}
