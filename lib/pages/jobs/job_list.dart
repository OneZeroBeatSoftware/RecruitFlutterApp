import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/pages/jobs/job_company_search.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_filter.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() {
    // TODO: implement createState
    return _JobListState();
  }
}

class _JobListState extends State<JobList> {
  List<Job> _jobList = JobData.loadJobs();

  int _selectFilterType = 0;

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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CityFilter(),),);
                          },
                          child: Text(
                            '洛杉矶',
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
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>JobCompanySearch(searchType: SearchType.job,)));
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
                          borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(1000))),
                    ),),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
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
                        child: Image.asset(
                          'images/img_job_ad.png',
                          fit: BoxFit.cover,
                          height: ScreenUtil().setWidth(300),
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
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => JobFilter(),),);
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
                                    Expanded(child:  Text(
                                      "区域规划",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(159, 199, 235, 1),
                                      ),
                                    ),),
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
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    if (index < _jobList.length) {
                      return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: JobRowItem(
                              job: _jobList[index],
                              index: index,
                              lastItem: index == _jobList.length - 1),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JobDetail(),
                                ));
                          });
                    }
                    return null;
                  }, childCount: _jobList.length)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
