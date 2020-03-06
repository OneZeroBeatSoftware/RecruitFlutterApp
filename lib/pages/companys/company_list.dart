import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/jobs/job_company_search.dart';

import 'company_row_item.dart';

class CompanyList extends StatefulWidget {
  @override
  _CompanyListState createState() {
    // TODO: implement createState
    return _CompanyListState();
  }
}

class _CompanyListState extends State<CompanyList> {
  List<Company> _companyList = CompanyData.loadCompany();
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
                  Expanded(
                    child: Text(
                      '公司',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(40),
                        color: Color.fromRGBO(20, 20, 20, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>JobCompanySearch(searchType: SearchType.company,),),);
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
            Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setWidth(1),
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(48),
                  ),
                  height: ScreenUtil().setWidth(92),
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
                      ],
                    ),
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
              ],
            ),
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    if (index < _companyList.length) {
                      return GestureDetector(
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
                  }, childCount: _companyList.length)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
