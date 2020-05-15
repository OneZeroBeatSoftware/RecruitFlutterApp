import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/age_entity.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/industry_type_entity.dart';
import 'package:recruit_app/entity/job_type_entity.dart';
import 'package:recruit_app/entity/salary_list_entity.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/model/job_filter_data.dart';
import 'package:recruit_app/pages/jobs/job_filter_item.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

enum FilterType {
  all,
  job,
  company,
  resume
}

class FilterResult {
  FilterType filterType;
  String eduLevel;
  String salary;
  String workDate;
  String scale;
  String age;
  String industry;
  String jobType;
  String sex;

  FilterResult(this.filterType, {this.eduLevel, this.salary, this.workDate, this.scale, this.age, this.industry, this.jobType, this.sex});
}

class JobFilter extends StatefulWidget {
  final FilterType filterType;
  final String eduLevel;
  final String salary;
  final String workDate;
  final String scale;
  final String age;
  final String industry;
  final String jobType;
  final String sex;

  const JobFilter({Key key, this.filterType=FilterType.all, this.eduLevel, this.salary, this.workDate, this.scale, this.age, this.industry, this.jobType, this.sex}) : super(key: key);

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
      if (widget.filterType == FilterType.job) {
        getAgeList();
        getEduLevel();
        getSalaryList();
        getScaleList();
      } else if (widget.filterType == FilterType.company) {
        getAllIndustry();
        getScaleList();
      } else if (widget.filterType == FilterType.resume) {
        getEduLevel();
        getSalaryList();
        getSex();
        getWorkDate();
      } else {
        getEduLevel();
        getSalaryList();
        getWorkDate();
        getScaleList();
        getAgeList();
        getAllIndustry();
        getAllJobType();
        getSex();
      }
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
          onTap: () {
            FilterResult filterResult=FilterResult(widget.filterType);
            _jobFilterData.forEach((item){
              item.filterSubData.forEach((subItem){
                if(subItem.isChecked){
                  switch(item.filterName){
                    case '性别':
                      filterResult.sex=subItem.filterName;
                      break;
                    case '年龄':
                      filterResult.age=subItem.id;
                      break;
                    case '学历要求':
                      filterResult.eduLevel=subItem.id;
                      break;
                    case '经验要求':
                      filterResult.workDate=subItem.id;
                      break;
                    case '薪资待遇':
                      filterResult.salary=subItem.id;
                      break;
                    case '公司规模':
                      filterResult.scale=subItem.id;
                      break;
                    case '行业类型':
                      filterResult.industry=subItem.id;
                      break;
                    case '岗位类型':
                      filterResult.jobType=subItem.id;
                      break;
                  }
                }
              });
            });
            Navigator.pop(context,filterResult);
          },
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
                _jobFilterData[idx].filterSubData.forEach((item1){
                  if(item1.isChecked&&item1!=item){
                    item1.isChecked = !item1.isChecked;
                  }
                });
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

  /// 性别
  void getSex() {
    List<JobFilterSubData> sexList = [
      JobFilterSubData(
          filterName: '男', isChecked: widget.sex=='男'),
      JobFilterSubData(
          filterName: '女', isChecked: widget.sex=='女'),
    ];
    _jobFilterData.add(JobFilterData(
        filterName: '性别',
        filterSubData: sexList));
    setState(() {});
  }

  /// 年龄
  void getAgeList() async {
    AgeEntity ageEntity = await NetUtils.getAgeList(context);
    if(ageEntity.statusCode==200&&ageEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '年龄',
          filterSubData: ageEntity.data
              .map((item) => JobFilterSubData(
              id: item.id,
              filterName: '${item.minAge}-${item.maxAge}', isChecked: widget.age==item.id))
              .toList()));
      setState(() {
      });
    }
  }

  /// 学历要求
  void getEduLevel() async {
    EduLevelEntity eduLevelEntity = await NetUtils.getEduLevel(context);
    if(eduLevelEntity.statusCode==200&&eduLevelEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '学历要求',
          filterSubData: eduLevelEntity.data
              .map((item) => JobFilterSubData(
            id: item.id,
              filterName: item.educationName, isChecked: widget.eduLevel==item.id))
              .toList()));
      setState(() {
      });
    }
  }

  /// 经验要求
  void getWorkDate() async {
    WorkDateEntity workDateEntity = await NetUtils.getWorkDate(context);
    if(workDateEntity.statusCode==200&&workDateEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '经验要求',
          filterSubData: workDateEntity.data
              .map((item) => JobFilterSubData(
              id: item.id,
              filterName: item.workDateName, isChecked: widget.workDate==item.id))
              .toList()));
      setState(() {
      });
    }
  }

  /// 薪资待遇
  void getSalaryList() async {
    SalaryListEntity salaryListEntity = await NetUtils.getSalaryList(context);
    if(salaryListEntity.statusCode==200&&salaryListEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '薪资待遇',
          filterSubData: salaryListEntity.data
              .map((item) {
                String salary='${item.minSalary}-${item.maxSalary}K';
                if(double.parse(item.minSalary)<0&&double.parse(item.maxSalary)<0){
                  salary='不限';
                }else if(double.parse(item.minSalary)<0&&double.parse(item.maxSalary)>0){
                  salary='${item.maxSalary}K以下';
                }else if(double.parse(item.minSalary)>0&&double.parse(item.maxSalary)<0){
                  salary='${item.minSalary}K以上';
                }
            return JobFilterSubData(
                id: item.id,
                filterName: salary,
                isChecked: widget.salary == item.id);
          }).toList()));
      setState(() {
      });
    }
  }

  /// 公司规模
  void getScaleList() async {
    CompanyScaleEntity scaleEntity = await NetUtils.getScaleList(context);
    if(scaleEntity.statusCode==200&&scaleEntity.data!=null){
      _jobFilterData.add(JobFilterData(
          filterName: '公司规模',
          filterSubData: scaleEntity.data
              .map((item) => JobFilterSubData(
              id: item.id,
              filterName: item.scaleName, isChecked: widget.scale==item.id))
              .toList()));
      setState(() {
      });
    }
  }

  /// 行业选择
  getAllIndustry() async {
    IndustryTypeEntity industryEntity = await NetUtils.getIndustryList(context);
    if (industryEntity != null && industryEntity.statusCode == 200) {
      _jobFilterData.add(JobFilterData(
          filterName: '行业类型',
          filterSubData: industryEntity.data
              .map((item) => JobFilterSubData(
              id: item.id,
              filterName: item.type, isChecked: widget.industry==item.id))
              .toList()));
      setState(() {
      });
    }
  }

  /// 获取全部工作类型
  getAllJobType() async {
    JobTypeEntity jobTypeEntity = await NetUtils.getAllJobType(context);
    if (jobTypeEntity != null && jobTypeEntity.statusCode == 200) {
      _jobFilterData.add(JobFilterData(
          filterName: '岗位类型',
          filterSubData: jobTypeEntity.data
              .map((item) => JobFilterSubData(
              id: item.id,
              filterName: item.type, isChecked: widget.jobType==item.id))
              .toList()));
      setState(() {
      });
    }
  }
}
