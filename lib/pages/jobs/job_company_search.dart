import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/model/search_model.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/companys/company_row_item.dart';
import 'package:recruit_app/pages/employe/employe_row_item.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_filter.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';

import '../../application.dart';

enum SearchType { job, company,resume }

class JobCompanySearch extends StatefulWidget {
  final SearchType searchType;

  const JobCompanySearch({Key key, this.searchType=SearchType.job}) : super(key: key);

  @override
  _JobCompanySearchState createState() => _JobCompanySearchState();
}

class _JobCompanySearchState extends State<JobCompanySearch> {
  List<Employee> _employeeList = EmployeeData.loadEmployees();
  List<String> _searchList = [];
  TextEditingController _searchController;

  String _selCity='请选择城市';
  FilterType _filterType;

  String _keyword;
  String _eduLevel;
  String _salary;
  String _workDate;
  String _scale;
  String _age;
  String _industry;
  String _jobType;
  String _sex;

  int _pageIndex=1;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    _refreshController = EasyRefreshController();
    _searchController=TextEditingController();
    _searchList=Application.sp.getStringList('search_history')??[];
    _selCity=Application.sp.get('location_city')??'请选择城市';
    if(widget.searchType==SearchType.job){
      _filterType=FilterType.job;
    }else if(widget.searchType==SearchType.company){
      _filterType=FilterType.company;
    }else if(widget.searchType==SearchType.resume){
      _filterType=FilterType.resume;
    }else {
      _filterType=FilterType.all;
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Application.sp.setStringList('search_history', _searchList);
    if(_searchController!=null){
      _searchController.dispose();
    }
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(48),
                  vertical: ScreenUtil().setWidth(15),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        width: ScreenUtil().setWidth(1)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'images/img_arrow_left_black.png',
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(36),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(66),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'images/img_search_gray.png',
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setWidth(26),
                              fit: BoxFit.contain,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(40),
                              ),
                              height: ScreenUtil().setWidth(24),
                              width: ScreenUtil().setWidth(2),
                              color: Color.fromRGBO(194, 203, 202, 1),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                autofocus: false,
                                scrollPadding: EdgeInsets.all(0),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                cursorColor: Color.fromRGBO(176, 181, 180, 1),
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(95, 94, 94, 1)),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                  hintText: widget.searchType == SearchType.company
                                      ? '输入企业名称'
                                      : (widget.searchType == SearchType.resume?"请输入人才姓名":'输入岗位名称'),
                                  hintStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(176, 181, 180, 1),
                                  ),
                                ),
                                textInputAction: TextInputAction.search,
                                onSubmitted: (text) {
                                  if(_searchController.text.isNotEmpty){
                                    _keyword=_searchController.text;
                                    setState(() {
                                      _searchList.add(_searchController.text);
                                    });
                                  }
                                  _refreshController.callRefresh();
                                },
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(40),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 248, 248, 1),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(1000))),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(48),
                        vertical: ScreenUtil().setWidth(26)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '搜索历史',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(32),
                              color: Color.fromRGBO(57, 57, 57, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Application.sp.setStringList('search_history', []);
                            setState(() {
                              _searchList.clear();
                            });
                          },
                          child: Image.asset(
                            'images/img_del_gray.png',
                            width: ScreenUtil().setWidth(20),
                            height: ScreenUtil().setWidth(24),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48)),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: ScreenUtil().setWidth(16),
                      runSpacing: ScreenUtil().setWidth(16),
                      children: _searchList.map((item){
                        return GestureDetector(child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(
                              ScreenUtil().setWidth(28),
                            ),
                            vertical: ScreenUtil().setWidth(
                              ScreenUtil().setWidth(15),
                            ),
                          ),
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
                            item,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              fontSize: ScreenUtil().setSp(22),
                            ),
                          ),
                        ),behavior: HitTestBehavior.opaque,onTap: (){
                          _keyword=item;
                          _refreshController.callRefresh();
                        },);
                      }).toList(),
                    ),
                  ),
                ],
              ),visible: _searchList!=null&&_searchList.length>0,),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(48),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setWidth(30),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1)),
                  ),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: ScreenUtil().setWidth(16),
                  runSpacing: ScreenUtil().setWidth(16),
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityFilter())).then((value){
                          if (value != null){
                            setState(() {
                              _selCity = value;
                            });
                            _refreshController.callRefresh();
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(
                            ScreenUtil().setWidth(28),
                          ),
                          vertical: ScreenUtil().setWidth(
                            ScreenUtil().setWidth(15),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(1000),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '$_selCity',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color.fromRGBO(159, 199, 235, 1),
                                fontSize: ScreenUtil().setSp(22),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(12),
                            ),
                            Image.asset(
                              'images/img_arrow_down_blue.png',
                              width: ScreenUtil().setWidth(10),
                              height: ScreenUtil().setWidth(10),
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push(
                            context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JobFilter(
                                  filterType: _filterType,
                                  eduLevel: _eduLevel,
                                  salary: _salary,
                                  workDate: _workDate,
                                  scale: _scale,
                                  age: _age,
                                  industry: _industry,
                                  jobType: _jobType,
                                  sex: _sex,
                                ),),).then((
                            result) {
                          if (result != null && (result is FilterResult)) {
                            if(result.filterType==FilterType.job){
                              _scale = result.scale;
                              _industry = result.industry;
                              _jobType = result.jobType;
                              _age = result.age;
                              _salary = result.salary;
                              _eduLevel = result.eduLevel;
                              _refreshController.callRefresh();
                            }else if(result.filterType==FilterType.company){
                              _scale = result.scale;
                              _industry = result.industry;
                              _refreshController.callRefresh();
                            }else if(result.filterType==FilterType.resume){
                              _sex = result.sex;
                              _workDate = result.workDate;
                              _eduLevel = result.eduLevel;
                              _salary = result.salary;
                              _refreshController.callRefresh();
                            }else if(result.filterType==FilterType.all){
                              _eduLevel = result.eduLevel;
                              _salary = result.salary;
                              _workDate = result.workDate;
                              _scale = result.scale;
                              _age = result.age;
                              _industry = result.industry;
                              _jobType = result.jobType;
                              _sex = result.sex;
                              _refreshController.callRefresh();
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(
                            ScreenUtil().setWidth(28),
                          ),
                          vertical: ScreenUtil().setWidth(
                            ScreenUtil().setWidth(15),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(1000),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '筛选',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color.fromRGBO(159, 199, 235, 1),
                                fontSize: ScreenUtil().setSp(22),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(12),
                            ),
                            Image.asset(
                              'images/img_arrow_down_blue.png',
                              width: ScreenUtil().setWidth(10),
                              height: ScreenUtil().setWidth(10),
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: EasyRefresh.custom(
                    controller: _refreshController,
                    firstRefresh: false,
                    header: MaterialHeader(),
                    footer: ClassicalFooter(
                        infoColor: Color.fromRGBO(159, 199, 235, 1)),
                    onRefresh: () async {
                      _pageIndex = 1;
                      _search();
                      _refreshController.resetLoadState();
                    },
                    onLoad: () async {
                      _search();
                      _refreshController.resetLoadState();
                    },
                    slivers: <Widget>[
                      SliverList(
                          delegate:
                          SliverChildBuilderDelegate((context, index) {
                            if (widget.searchType == SearchType.job &&
                                index < SearchModel.instance.jobList.length) {
                              return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: JobRowItem(
                                      job: SearchModel.instance.jobList[index],
                                      index: index,
                                      lastItem: index ==
                                          SearchModel.instance.jobList.length - 1),
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(
                                        FocusNode());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              JobDetail(jobId: SearchModel.instance
                                                  .jobList[index].id),
                                        ));
                                  });
                            }

                            if (widget.searchType == SearchType.company &&
                                index < SearchModel.instance.companyList.length) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: CompanyRowItem(
                                    company: SearchModel.instance.companyList[index],
                                    index: index,
                                    lastItem: index ==
                                        SearchModel.instance.companyList.length - 1),
                                onTap: () {
                                  FocusScope.of(context).requestFocus(
                                      FocusNode());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CompanyDetail(
                                              companyId: SearchModel.instance.companyList[index].id,),
                                      ));
                                },
                              );
                            }

                            if (widget.searchType == SearchType.resume &&
                                index < _employeeList.length) {
                              return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: EmployeeRowItem(
                                      employee: _employeeList[index],
                                      index: index,
                                      lastItem: index ==
                                          _employeeList.length - 1),
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(
                                        FocusNode());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeDetail(),
                                        ));
                                  });
                            }
                            return null;
                          }, childCount: widget.searchType == SearchType.resume
                              ? _employeeList.length
                              : (widget.searchType == SearchType.company
                              ? SearchModel.instance.companyList.length
                              : SearchModel.instance.jobList.length)))
                    ]),
              ),
            ],
          ),
        ));
  }

  /// 搜索
  _search(){
    if(widget.searchType==SearchType.job){
      _searchJob();
    } else if(widget.searchType==SearchType.company){
      _searchCompany();
    } else if(widget.searchType==SearchType.resume){
      _searchResume();
    }
  }

  /// 搜索工作
  _searchJob() {
    SearchModel.instance.searchJob(context, _pageIndex,
      city: Application.sp.get('location_city_id'),
      keyword: _keyword,
      scale: _scale,
      age: _age,
      salary: _salary,
      education: _eduLevel,
    ).then((searchModel) {
      if (searchModel != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 搜索公司
  _searchCompany() {
    SearchModel.instance.searchCompany(context, _pageIndex,
      city: Application.sp.get('location_city_id'),
      keyword: _keyword,
      industryId: _industry,
      scale: _scale,
    ).then((searchModel) {
      if (searchModel != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 搜索简历
  _searchResume() {
    SearchModel.instance.searchResume(
        context, _pageIndex,
        city: Application.sp.get('location_city_id'),
        keyword: _keyword,
        sex: _sex,
        salary: _salary,
        education: _eduLevel,
        workDate: _workDate)
        .then((searchModel) {
      if (searchModel != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }
}
