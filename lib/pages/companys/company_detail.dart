import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/model/company_pic_list.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/companys/company_job_item.dart';
import 'package:recruit_app/pages/companys/company_pic_item.dart';
import 'package:recruit_app/pages/companys/company_welfare_item.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CompanyDetail extends StatefulWidget {
  final String companyId;

  const CompanyDetail({Key key, this.companyId="1"}) : super(key: key);
  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  List<CompanyPicData> _picList = CompanyPicList.loadCompanyPicList();

  List<Job> _jobList = JobData.loadJobs();

  CompanyDetailData _detailData;
  bool _isFocus=false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((i){
      getCompanyDetail(widget.companyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 77, 151, 1),
      appBar: CommonAppBar(
        leading: 'images/ic_action_back_white.png',
        leftListener: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromRGBO(68, 77, 151, 1),
        rightAction: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Image.asset(
                'images/img_menu_white.png',
                width: ScreenUtil().setWidth(36),
                height: ScreenUtil().setWidth(36),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(48),
            ),
          ],
        ),
      ),
      body:_detailData == null
          ? Container(
        height: ScreenUtil().setWidth(400),
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(),
      ) : SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(48),
                  right: ScreenUtil().setWidth(48),
                  top: ScreenUtil().setWidth(46),
                  bottom: ScreenUtil().setWidth(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setWidth(8))),
                        child: Image.asset('images/ic_ask_resume_action.png',
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setWidth(80),
                            fit: BoxFit.cover),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(20)),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${_detailData.company.companyName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(36),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(
                            height: ScreenUtil().setWidth(12),
                          ),
                          Text('${_detailData.company.operateState} · ${_detailData.scale} · ${_detailData.company.scope}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Colors.white)),
                        ],
                      )),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(14),
                              vertical: ScreenUtil().setWidth(10)),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: ScreenUtil().setWidth(2)),
                            borderRadius: BorderRadius.all(
                                Radius.circular(ScreenUtil().setWidth(10))),
                          ),
                          child: Text(
                            _isFocus?'+  关注':'已关注',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(16)),
                          ),
                        ),
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            _isFocus=!_isFocus;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(80),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/img_work_time.png',width: ScreenUtil().setWidth(24),height: ScreenUtil().setWidth(24),fit: BoxFit.contain,),

                      SizedBox(
                        width: ScreenUtil().setWidth(8),
                      ),
                      Expanded(
                        child: Text(
//                          'AM 09:00 - PM 06:00',
                          '${_detailData.company.startDate} - ${_detailData.company.endDate}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Colors.white),),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(30),
                      ),
                      Text('更多福利',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                              fontSize: ScreenUtil().setSp(24),
                              color: Color.fromRGBO(159, 199, 235, 1))),
                      SizedBox(
                        width: ScreenUtil().setWidth(20),
                      ),
                      Image.asset(
                        'images/f3_right_arrow_white.png',
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(20),
                        colorBlendMode: BlendMode.srcATop,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(28),
                  ),
                  Container(
                    height: ScreenUtil().setWidth(90),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _detailData.welfare.length,
                        itemBuilder: (context, index) {
                          if (index < _detailData.welfare.length) {
                            return CompanyWelfareItem(
                              welfareData: _detailData.welfare[index],
                              index: index,
                              isLastItem: index == _detailData.welfare.length - 1,
                            );
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(52),
                  ),
                  Text('公司简介',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text(
                      '${_detailData.company.companySummary}',
                      style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                          fontSize: ScreenUtil().setWidth(24),
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text('公司照片',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Container(
                    height: ScreenUtil().setWidth(200),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _picList.length,
                        itemBuilder: (context, index) {
                          if (index < _picList.length) {
                            return CompanyPicItem(
                              picData: _picList[index],
                              index: index,
                              isLastItem: index == _picList.length - 1,
                            );
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text('公司地址',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(30))),
                    child: Image.asset('images/img_location_example.png',
                        height: ScreenUtil().setWidth(400),
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text('公司还有9个其他办公地址',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('查看全部',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(26),
                              color: Color.fromRGBO(181, 182, 183, 1))),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text('公司官网',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text('http://www.tencent.com',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(30),
                      ),
                      Image.asset(
                        'images/f3_right_arrow_white.png',
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(20),
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text('工商信息',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('公司全称',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(26),
                              color: Colors.white)),
                      SizedBox(
                        height: ScreenUtil().setWidth(30),
                      ),
                      Expanded(
                        child: Text('${_detailData.company.companyName}',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('企业法人',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(26),
                              color: Colors.white)),
                      SizedBox(
                        width: ScreenUtil().setWidth(30),
                      ),
                      Expanded(
                        child: Text('${_detailData.company.legalPerson}',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('注册时间',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(26),
                              color: Colors.white)),
                      SizedBox(
                        width: ScreenUtil().setWidth(30),
                      ),
                      Expanded(
                        child: Text('${DateUtil.formatDateMs(_detailData.company.registerDate,format: "yyyy-MM-dd")}',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('注册资本',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(26),
                              color: Colors.white)),
                      SizedBox(
                        width: ScreenUtil().setWidth(30),
                      ),
                      Expanded(
                        child: Text('${_detailData.company.registerCapital}',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text('查看全部',
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(26),
                          color: Color.fromRGBO(159, 199, 235, 1))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildJobDrawer() {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        margin: EdgeInsets.only(top: kToolbarHeight),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 56,
              alignment: Alignment.centerLeft,
              child: Text('职位',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index < _jobList.length) {
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: CompanyJobItem(
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
                },
                itemCount: _jobList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getCompanyDetail(String companyId) async {
    CompanyDetailEntity companyDetailEntity=await NetUtils.getCompanyDetail(context, companyId);
    if (companyDetailEntity.statusCode==200&&companyDetailEntity.data != null) {
      setState(() {
        _detailData=companyDetailEntity.data;
      });
    }
  }
}
