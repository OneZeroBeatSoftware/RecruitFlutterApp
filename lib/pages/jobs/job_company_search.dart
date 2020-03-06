import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/companys/company_row_item.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_filter.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';

enum SearchType { job, company }

class JobCompanySearch extends StatefulWidget {
  final SearchType searchType;

  const JobCompanySearch({Key key, this.searchType}) : super(key: key);

  @override
  _JobCompanySearchState createState() => _JobCompanySearchState();
}

class _JobCompanySearchState extends State<JobCompanySearch> {
  List<Company> _companyList = CompanyData.loadCompany();
  List<Job> _jobList = JobData.loadJobs();

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
                                  hintText: widget.searchType == SearchType.job
                                      ? '输入岗位名称'
                                      : '输入企业名称',
                                  hintStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(176, 181, 180, 1),
                                  ),
                                ),
                                onSubmitted: (text) {},
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
                      onTap: () {},
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
                  children: [
                    Container(
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
                        '平面设计',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          fontSize: ScreenUtil().setSp(22),
                        ),
                      ),
                    ),
                    Container(
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
                        '平面设计',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          fontSize: ScreenUtil().setSp(22),
                        ),
                      ),
                    ),
                    Container(
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
                        '平面设计',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          fontSize: ScreenUtil().setSp(22),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityFilter()));
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
                              '洛杉矶',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobFilter()));
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index <
                        (widget.searchType == SearchType.job
                            ? _jobList.length
                            : _companyList.length)) {
                      return widget.searchType == SearchType.job
                          ? GestureDetector(
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
                              })
                          : GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: CompanyRowItem(
                                  company: _companyList[index],
                                  index: index,
                                  lastItem: index == _companyList.length - 1),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CompanyDetail(),
                                    ));
                              },
                            );
                    }
                    return null;
                  },
                  itemCount: widget.searchType == SearchType.job
                      ? _jobList.length
                      : _companyList.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ));
  }
}
