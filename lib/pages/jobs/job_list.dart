
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/banner_entity.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/model/job_model.dart';
import 'package:recruit_app/model/recruit_resume_model.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/pages/jobs/job_company_search.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_filter.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';
import 'package:recruit_app/widgets/web_view.dart';

import '../../application.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() {
    // TODO: implement createState
    return _JobListState();
  }
}

class _JobListState extends State<JobList> {
  String _selCity='请选择城市';
  String _cityId='';

  int _selectFilterType = 0;
  JobModel _jobModel;
  int _pageIndex = 1;

  EasyRefreshController _refreshController;

  String _eduLevel='';
  String _salary='';
  String _scale='';
  String _age='';
  String _industry='';
  String _jobType='';

  List<BannerData> _bannerList = [];

  @override
  void initState() {
    // TODO: implement initState
    _selCity=Application.sp.get('location_city')??'请选择城市';
    _cityId=Application.sp.get('location_city_id')??'';
    _refreshController = EasyRefreshController();
    _bannerList=MainResumeModel.instance.bannerList;
    if(_bannerList==null){
      _bannerList = [];
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _jobModel = Provider.of<JobModel>(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(24),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/img_job_location.png',
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setWidth(36),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      Flexible(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push<FilterData>(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CityFilter(initId: _cityId,))).then((value){
                              if (value != null){
                                Application.sp.setString(
                                    'location_city_id', value.filterId);
                                Application.sp.setString(
                                    'location_city', value.filterName);
                                setState(() {
                                  _cityId=value.filterId;
                                  _selCity = value.filterName;
                                });
                                _refreshController.callRefresh();
                              }
                            });
                          },
                          child: Text(
                            '$_selCity',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(40),
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(8),
                      ),
                      Text(
                        '（当前城市）',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobCompanySearch(
                                    searchType: SearchType.job,
                                  )));
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(204),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'images/img_search_blue.png',
                            width: ScreenUtil().setWidth(26),
                            height: ScreenUtil().setWidth(26),
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "｜搜索",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Color.fromRGBO(159, 199, 235, 1),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10),
                        vertical: ScreenUtil().setWidth(10),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(2),
                          ),
                          borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(1000))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: EasyRefresh.custom(
                controller: _refreshController,
                firstRefresh: true,
                header: MaterialHeader(),
                footer: ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
                onRefresh: () async {
                  _pageIndex = 1;
                   getJobList();
                  _refreshController.resetLoadState();
                },
                onLoad: () async {
                   getJobList();
                  _refreshController.resetLoadState();
                },
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(48),
                          right: ScreenUtil().setWidth(48),
                          top: ScreenUtil().setWidth(24),
                          bottom: ScreenUtil().setWidth(48)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setWidth(10))),
                        child: Container(
                          width: ScreenUtil().setWidth(654),
                          height: ScreenUtil().setWidth(300),
                          child: new Swiper.children(
                            onTap: (index) {
                              if(_bannerList[index].url==null||_bannerList[index].url.isEmpty){
                                return;
                              }
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => WebViewWidget(title: '${_bannerList[index].desc}',url: '${_bannerList[index].url}',),),);
                            },
                            children: _bannerList.map((item){
                              if (item.image == null) {
                                return null;
                              }
                              return Image.network(
                                item.image,
                                fit: BoxFit.cover,
                              );
                            }).toList(),
                            duration: 500,
                            autoplay: true,
                            physics: BouncingScrollPhysics(),
                            pagination: new SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  activeColor: Color.fromRGBO(0, 0, 0, 0.2),
                                  color: Colors.white,
                                  size: 5,
                                  activeSize: 5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil().setWidth(4),
                        color: Color.fromRGBO(245, 245, 245, 1),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(48),
                        ),
                        height: ScreenUtil().setWidth(92),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Text(
                                        "推荐",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(32),
                                          fontWeight: _selectFilterType == 0
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: _selectFilterType == 0
                                              ? Color.fromRGBO(68, 77, 151, 1)
                                              : Color.fromRGBO(57, 57, 57, 1),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectFilterType = 0;
                                        });
                                        _refreshController.callRefresh();
                                      },
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(32),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Text(
                                        "附近",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(32),
                                          fontWeight: _selectFilterType == 1
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: _selectFilterType == 1
                                              ? Color.fromRGBO(68, 77, 151, 1)
                                              : Color.fromRGBO(57, 57, 57, 1),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectFilterType = 1;
                                        });
                                        _refreshController.callRefresh();
                                      },
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(32),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Text(
                                        "最新",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(32),
                                          fontWeight: _selectFilterType == 2
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: _selectFilterType == 2
                                              ? Color.fromRGBO(68, 77, 151, 1)
                                              : Color.fromRGBO(57, 57, 57, 1),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectFilterType = 2;
                                        });
                                        _refreshController.callRefresh();
                                      },
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(32),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Text(
                                        "区域推送",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(32),
                                          fontWeight: _selectFilterType == 3
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: _selectFilterType == 3
                                              ? Color.fromRGBO(68, 77, 151, 1)
                                              : Color.fromRGBO(57, 57, 57, 1),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectFilterType = 3;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_job_filter.png',
                                    width: ScreenUtil().setWidth(32),
                                    height: ScreenUtil().setWidth(32),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(6),
                                  ),
                                  Text(
                                    "筛选",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(32),
                                      color: Color.fromRGBO(57, 57, 57, 1),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobFilter(filterType: FilterType.job,age: _age,eduLevel: _eduLevel,salary: _salary,scale: _scale,),
                                  ),
                                ).then((result){
                                  if (result != null &&
                                      (result is FilterResult)) {
                                    _scale = result.scale;
                                    _industry = result.industry;
                                    _jobType = result.jobType;
                                    _age = result.age;
                                    _salary = result.salary;
                                    _eduLevel = result.eduLevel;
                                    _refreshController.callRefresh();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(48),
                          right: ScreenUtil().setWidth(48),
                        ),
                        height: ScreenUtil().setWidth(1),
                        color: Color.fromRGBO(159, 199, 235, 1),
                      ),
                      Visibility(
                        visible: _selectFilterType == 3,
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(48),
                                ),
                                height: ScreenUtil().setWidth(92),
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'images/img_area_filter.png',
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setWidth(32),
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(12),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "区域规划",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(28),
                                          color:
                                              Color.fromRGBO(159, 199, 235, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(12),
                                    ),
                                    Image.asset(
                                      'images/img_arrow_right_blue.png',
                                      width: ScreenUtil().setWidth(11),
                                      height: ScreenUtil().setWidth(21),
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(48),
                                right: ScreenUtil().setWidth(48),
                              ),
                              height: ScreenUtil().setWidth(1),
                              color: Color.fromRGBO(159, 199, 235, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  _jobModel == null
                      ? SliverToBoxAdapter(
                          child: Container(
                            height: ScreenUtil().setWidth(400),
                            alignment: Alignment.center,
                            child: CupertinoActivityIndicator(),
                          ),
                        )
                      : SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                          if (index < _jobModel.jobList.length) {
                            return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: JobRowItem(
                                    job: _jobModel.jobList[index],
                                    index: index,
                                    lastItem:
                                        index == _jobModel.jobList.length - 1),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobDetail(jobId:_jobModel.jobList[index].id),
                                      ));
                                });
                          }
                          return null;
                        }, childCount: _jobModel.jobList.length)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   getJobList() async {
     JobListEntity _jobEntity = await _jobModel.getJobList(
         context,
         _selectFilterType == 1,
         _selectFilterType == 2,
         _selectFilterType == 0,
         _pageIndex,
         15,
         city: _cityId,
         age: _age,
         salary: _salary,
         scale: _scale,
         education: _eduLevel,
     jobSeekerId: Application.sp.get('jobSeekerId'));
    if (_jobEntity != null && _jobEntity.data.records.length > 0) {
      _pageIndex++;
    }
    setState(() {
    });
  }
}
