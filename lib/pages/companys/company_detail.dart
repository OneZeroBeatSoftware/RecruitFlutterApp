import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/collection_entity.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/entity/company_job_entity.dart';
import 'package:recruit_app/model/company_model.dart';
import 'package:recruit_app/model/company_pic_list.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/companys/company_appbar_widget.dart';
import 'package:recruit_app/pages/companys/company_info_dialog.dart';
import 'package:recruit_app/pages/companys/company_job_item.dart';
import 'package:recruit_app/pages/companys/company_pic_item.dart';
import 'package:recruit_app/pages/companys/company_welfare_dialog.dart';
import 'package:recruit_app/pages/companys/company_welfare_item.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/report.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/empty_widget.dart';
import 'package:recruit_app/widgets/network_image.dart';
import 'package:recruit_app/widgets/remind_column_dialog.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

import '../../application.dart';

class CompanyDetail extends StatefulWidget {
  final String companyId;

  const CompanyDetail({Key key, this.companyId = "1"}) : super(key: key);

  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with SingleTickerProviderStateMixin {

  CompanyModel _companyModel;
  int _pageIndex = 1;
  EasyRefreshController _refreshController;

  /// 公司照片模拟数据
  List<CompanyPicData> _picList = CompanyPicList.loadCompanyPicList();

  /// 工作列表数据
//  List<Job> _jobList = JobData.loadJobs();

  /// 公司福利模拟数据
//  List<WelfareData> _welfareList = [];

  /// 右上角menu按键
  List<String> _menuItem = [];

  /// 举报内容
  List<String> _reports = [];

  /// 公司数据
  CompanyDetailData _detailData;

  /// 是否关注
  bool _isFocus = false;
  String _starId;

  /// 更多简介手势监听
  TapGestureRecognizer _moreInfoRecognizer;

  /// 详情页面滚动的controller
  ScrollController _infoController;

  /// 职位详情滚动的controller
  ScrollController _jobController;

  /// 职位详情动画的controller
  AnimationController _jobAnimationController;
  ///职位详情动画
  Animation<double> _jobAnimation;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();

    _jobAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

     _jobAnimation = new Tween(begin: 0.0,
      end: (ScreenUtil.screenHeightDp - ScreenUtil.bottomBarHeight -
          ScreenUtil().setWidth(136) - 56 - ScreenUtil.statusBarHeight),)
        .animate(_jobAnimationController)..addListener((){
          setState(() {

          });
     });

    _infoController = ScrollController()
      ..addListener(() async{
//        if(_infoController.offset==_infoController.position.maxScrollExtent){
//          await _jobAnimationController.forward().orCancel;
//        }
      });
    _jobController = ScrollController()
      ..addListener(() async{
//        if(_jobController.offset==0){
//           await _jobAnimationController.reverse().orCancel;
//        }
      });


    _moreInfoRecognizer = TapGestureRecognizer()
      ..onTap = (){
        _showCompanyInfo(_detailData);
      };

//    _welfareList.add(
//        WelfareData('定期体检', '阶段性职业健康检查', 'images/img_time_check_gray.png'));
//    _welfareList.add(WelfareData(
//        '加班补助', '正常工作时间之外的工资报酬', 'images/img_work_welfare_gray.png'));
//    _welfareList.add(WelfareData(
//        '年终奖金', '年末给予员工年终奖励，对一年来的工作业绩给予肯定', 'images/img_year_salray_gray.png'));

    _menuItem.add('举报公司');
    _menuItem.add('屏蔽公司');

    for (int i1 = 0; i1 < 20; i1++) {
      _reports.add('广告骚扰');
    }
    WidgetsBinding.instance.addPostFrameCallback((i) {
      _companyModel=Provider.of<CompanyModel>(context);
      getCompanyDetail(widget.companyId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    _jobAnimationController.dispose();
    _infoController.dispose();
    _jobController.dispose();

    _moreInfoRecognizer.dispose();
    super.dispose();
  }

  /// 展示公司更多信息
  void _showCompanyInfo(CompanyDetailData detailData) {
    if(detailData==null){
      return;
    }
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return null;
      },
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, widget) {
        final curvedValue =
            Curves.easeInOut.transform(animation1.value) - 1.0;
        return Transform(
          transform:
          Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: CompanyInfoDialog(
              detailData,
              cancel: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  /// 显示更多福利
  void _showWelfareInfo(CompanyDetailData companyDetailData) {
    if(companyDetailData==null){
      return;
    }
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return null;
      },
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, widget) {
        final curvedValue =
            Curves.easeInOut.transform(animation1.value) - 1.0;
        return Transform(
          transform:
          Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: CompanyWelfareDialog(
              companyDetailData.welfare.map((item){
                return WelfareData('${item.welfareName}', '${item.content}', 'images/img_time_check_gray.png');
              },).toList(),
              startTime: _detailData.company.startDate,
              endTime: _detailData.company.endDate,
              cancel: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/img_company_bg.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 0,
              sigmaX: 0,
            ),
            child: Container(
              color: Color.fromRGBO(0, 17, 130, 0.7),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(bottom: false,child: CompanyAppBar(
              leading: 'images/ic_action_back_white.png',
              leftListener: () {
                Navigator.pop(context);
              },
              rightAction: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      NetUtils.validateLogin(context,
                          isLogin: Application.sp.get('jobSeekerId') != null, callback: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return RemindColDialog(
                                  items: _menuItem,
                                  itemColor: Color.fromRGBO(
                                      57, 57, 57, 1),
                                  cancelText: '取消',
                                  cancelColor: Color.fromRGBO(
                                      159, 199, 235, 1),
                                  cancel: () {
                                    Navigator.pop(context);
                                  },
                                  itemClick: (index) {
                                    Navigator.pop(context);
                                    switch (index) {
                                      case 0:
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Report(reportType: ReportType.company,reportId: widget.companyId,)));
                                        break;
                                      case 1:
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return RemindDialog(
                                                title: '确定屏蔽该公司吗？',
                                                titleColor: Color.fromRGBO(57, 57, 57, 1),
                                                content: '系统将不会再向您推荐该公司及岗位',
                                                contentColor: Color.fromRGBO(57, 57, 57, 1),
                                                cancelText: '取消',
                                                cancelColor: Color.fromRGBO(
                                                    142, 190, 245, 1),
                                                confirmText: '确定',
                                                confirmColor: Color.fromRGBO(
                                                    142, 190, 245, 1),
                                                cancel: () {
                                                  Navigator.pop(context);
                                                },
                                                confirm: () {
                                                  Navigator.pop(context);
                                                  _shieldCompany(widget.companyId);
                                                },
                                              );
                                            });
                                        break;
                                    }
                                  },
                                );
                              },);
                          });
                    },
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
            ),),
            Expanded(child: _detailData == null
                ? Container(
              height: ScreenUtil().setWidth(400),
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(),
            ) : Stack(
              children: <Widget>[
                SafeArea(top:false,child: SingleChildScrollView(
                  controller: _infoController,
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
                              child:NetImage(img: '${_detailData.company.avatar}',placeholder:'images/ic_ask_resume_action.png',error: 'images/ic_ask_resume_action.png',size: ScreenUtil().setWidth(80),),
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
                                    Text('${_detailData.company
                                        .managementName} · ${_detailData
                                        .company.scaleName} · ${_detailData.company.industryName}',
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
                                  _isFocus ? '已关注' : '+  关注',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(16)),
                                ),
                              ),
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                NetUtils.validateLogin(context,
                                    isLogin: Application.sp.get('jobSeekerId') != null, callback: () {
                                      _operateStar(widget.companyId, _starId);
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
                            Image.asset('images/img_work_time.png',
                              width: ScreenUtil().setWidth(24),
                              height: ScreenUtil().setWidth(24),
                              fit: BoxFit.contain,),

                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Expanded(
                              child: Text(
//                          'AM 09:00 - PM 06:00',
                                '${_detailData.company.startDate} - ${_detailData
                                    .company.endDate}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Colors.white),),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(30),
                            ),
                            GestureDetector(
                              onTap: (){
                                _showWelfareInfo(_detailData);
                              }, child: Text('更多福利',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(159, 199, 235, 1))),
                              behavior: HitTestBehavior.opaque,),
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
                        Offstage(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[      SizedBox(
                          height: ScreenUtil().setWidth(30),
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
                                      isLastItem: index ==
                                          _detailData.welfare.length - 1,
                                    );
                                  }
                                  return null;
                                }),
                          ),],),offstage: _detailData.welfare.length<1,),
                        SizedBox(
                          height: ScreenUtil().setWidth(30),
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
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '${_detailData.company.companySummary}…',
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontWeight: FontWeight.w300,
                                      fontSize: ScreenUtil().setWidth(24),
                                      color: Colors.white)),
                              TextSpan(
                                  recognizer: _moreInfoRecognizer,
                                  text: '查看更多',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: ScreenUtil().setSp(24),
                                      color: Color.fromRGBO(159, 199, 235, 1))),
                            ],
                          ),
                        ),
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
                        Offstage(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[SizedBox(
                          height: ScreenUtil().setWidth(30),
                        ),
                          Container(
                            height: ScreenUtil().setWidth(200),
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _detailData.companyImages.length,
                                itemBuilder: (context, index) {
                                  if (index < _detailData.companyImages.length) {
                                    return CompanyPicItem(
                                      picData: _detailData.companyImages[index],
                                      index: index,
                                      isLastItem: index == _detailData.companyImages.length - 1,
                                    );
                                  }
                                  return null;
                                }),
                          ),],),offstage: _detailData.companyImages.length<1,),
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
                        Text('${_detailData.company.cityName} ${_detailData.company.registerAddress}',
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(26),
                                color: Colors.white)),
                        SizedBox(
                          height: ScreenUtil().setWidth(30),
                        ),
//                  ClipRRect(
//                    borderRadius: BorderRadius.all(
//                        Radius.circular(ScreenUtil().setWidth(30))),
//                    child: Image.asset('images/img_location_example.png',
//                        height: ScreenUtil().setWidth(400),
//                        fit: BoxFit.cover),
//                  ),
                        Container(
                          alignment: Alignment.center,
                          height: ScreenUtil().setWidth(400),
                          child: Text("地图",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: ScreenUtil().setWidth(1),
                                style: BorderStyle.solid,

                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
//                  SizedBox(
//                    height: ScreenUtil().setWidth(30),
//                  ),
//                  Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Expanded(
//                        child: Text('公司还有9个其他办公地址',
//                            maxLines: 1,
//                            overflow: TextOverflow.ellipsis,
//                            style: TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: ScreenUtil().setSp(26),
//                                color: Colors.white)),
//                      ),
//                      SizedBox(
//                        width: 15,
//                      ),
//                      Text('查看全部',
//                          maxLines: 1,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(
//                              wordSpacing: 1,
//                              letterSpacing: 1,
//                              fontSize: ScreenUtil().setSp(26),
//                              color: Color.fromRGBO(181, 182, 183, 1))),
//                    ],
//                  ),
//                  SizedBox(
//                    height: ScreenUtil().setWidth(30),
//                  ),
//                  Text('公司官网',
//                      maxLines: 1,
//                      overflow: TextOverflow.ellipsis,
//                      style: TextStyle(
//                          wordSpacing: 1,
//                          letterSpacing: 1,
//                          fontSize: ScreenUtil().setSp(32),
//                          fontWeight: FontWeight.w500,
//                          color: Colors.white)),
//                  SizedBox(
//                    height: ScreenUtil().setWidth(30),
//                  ),
//                  Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Expanded(
//                        child: Text('http://www.tencent.com',
//                            maxLines: 1,
//                            overflow: TextOverflow.ellipsis,
//                            style: TextStyle(
//                                wordSpacing: 1,
//                                letterSpacing: 1,
//                                fontSize: ScreenUtil().setSp(26),
//                                color: Colors.white)),
//                      ),
//                      SizedBox(
//                        height: ScreenUtil().setWidth(30),
//                      ),
//                      Image.asset(
//                        'images/f3_right_arrow_white.png',
//                        width: ScreenUtil().setWidth(20),
//                        height: ScreenUtil().setWidth(20),
//                        fit: BoxFit.contain,
//                      ),
//                    ],
//                  ),
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
                        // SizedBox(
                        //   height: ScreenUtil().setWidth(20),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: <Widget>[
                        //     Text('企业法人',
                        //         maxLines: 1,
                        //         overflow: TextOverflow.ellipsis,
                        //         style: TextStyle(
                        //             wordSpacing: 1,
                        //             letterSpacing: 1,
                        //             fontSize: ScreenUtil().setSp(26),
                        //             color: Colors.white)),
                        //     SizedBox(
                        //       width: ScreenUtil().setWidth(30),
                        //     ),
                        //     Expanded(
                        //       child: Text('${_detailData.company.legalPerson}',
                        //           textAlign: TextAlign.end,
                        //           maxLines: 1,
                        //           overflow: TextOverflow.ellipsis,
                        //           style: TextStyle(
                        //               wordSpacing: 1,
                        //               letterSpacing: 1,
                        //               fontSize: ScreenUtil().setSp(26),
                        //               color: Colors.white)),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: ScreenUtil().setWidth(20),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: <Widget>[
                        //     Text('注册时间',
                        //         maxLines: 1,
                        //         overflow: TextOverflow.ellipsis,
                        //         style: TextStyle(
                        //             wordSpacing: 1,
                        //             letterSpacing: 1,
                        //             fontSize: ScreenUtil().setSp(26),
                        //             color: Colors.white)),
                        //     SizedBox(
                        //       width: ScreenUtil().setWidth(30),
                        //     ),
                        //     Expanded(
                        //       child: Text('${DateUtil.formatDateStr(
                        //           _detailData.company.registerDate,
                        //           format: "yyyy-MM-dd")}',
                        //           textAlign: TextAlign.end,
                        //           maxLines: 1,
                        //           overflow: TextOverflow.ellipsis,
                        //           style: TextStyle(
                        //               wordSpacing: 1,
                        //               letterSpacing: 1,
                        //               fontSize: ScreenUtil().setSp(26),
                        //               color: Colors.white)),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: ScreenUtil().setWidth(20),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: <Widget>[
                        //     Text('注册资本',
                        //         maxLines: 1,
                        //         overflow: TextOverflow.ellipsis,
                        //         style: TextStyle(
                        //             wordSpacing: 1,
                        //             letterSpacing: 1,
                        //             fontSize: ScreenUtil().setSp(26),
                        //             color: Colors.white)),
                        //     SizedBox(
                        //       width: ScreenUtil().setWidth(30),
                        //     ),
                        //     Expanded(
                        //       child: Text('${_detailData.company.registerCapital}',
                        //           textAlign: TextAlign.end,
                        //           maxLines: 1,
                        //           overflow: TextOverflow.ellipsis,
                        //           style: TextStyle(
                        //               wordSpacing: 1,
                        //               letterSpacing: 1,
                        //               fontSize: ScreenUtil().setSp(26),
                        //               color: Colors.white)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: ScreenUtil().setWidth(30),
                        ),
                        GestureDetector(
                          onTap: (){
                            _showCompanyInfo(_detailData);
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Text('查看全部',
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(26),
                                  color: Color.fromRGBO(159, 199, 235, 1))),

                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(136),
                        ),
                      ],
                    ),
                  ),
                ),),
                buildJobDrawer(),
              ],
            ),),
          ],),
        ],
      ),
    );
  }

  /// 抽屉
  Widget buildJobDrawer() {
    return Transform.translate(offset: Offset(0, ScreenUtil.screenHeightDp -
        ScreenUtil.bottomBarHeight -
        ScreenUtil().setWidth(136) - 56 - ScreenUtil.statusBarHeight -
        _jobAnimation.value), child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(48),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ScreenUtil().setWidth(20)),
          topRight: Radius.circular(ScreenUtil().setWidth(20),),),),
      child: SafeArea(top: false,child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(child: Container(
            height: ScreenUtil().setWidth(136),
            child: Stack(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft, child: Text('职位',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(20, 20, 20, 1),),),),
                Align(alignment: Alignment.topCenter,
                  child: Container(margin: EdgeInsets.only(top: ScreenUtil()
                      .setWidth(46),), width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(159, 199, 235, 1),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(5),),),),),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1))),
            ),
          ),
            behavior: HitTestBehavior.opaque, onTap: () async {
              if (_jobAnimationController.isCompleted) {
                await _jobAnimationController
                    .reverse()
                    .orCancel;
              } else if (_jobAnimationController.isDismissed) {
                await _jobAnimationController
                    .forward()
                    .orCancel;
              }
            },),
          Expanded(
            child:
            EasyRefresh.custom(
              controller: _refreshController,
              emptyWidget: _companyModel.jobList.length>0?null:EmptyWidget(remindText: '暂未发布岗位',),
              firstRefresh: true,
              header: MaterialHeader(),
              footer: ClassicalFooter(
                  infoColor: Color.fromRGBO(159, 199, 235, 1)),
              onRefresh: () async {
                _pageIndex = 1;
                getJob4Company(widget.companyId);
                _refreshController.resetLoadState();
              },
              onLoad: () async {
                getJob4Company(widget.companyId);
                _refreshController.resetLoadState();
              },
              slivers: <Widget>[
                _companyModel == null
                    ? SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setWidth(400),
                    alignment: Alignment.center,
                    child: CupertinoActivityIndicator(),
                  ),
                ) : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (index < _companyModel.jobList.length) {
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: CompanyJobItem(
                                job: _companyModel.jobList[index],
                                index: index,
                                lastItem: index == _companyModel.jobList.length - 1),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(jobId:_companyModel.jobList[index].id),
                                  ));
                            });
                      }
                      return null;
                    }, childCount: _companyModel.jobList.length)),
              ],
            ),
          ),
        ],
      ),),
    ),);
  }

  /// 获取公司详情
  void getCompanyDetail(String companyId) async {
    CompanyDetailEntity companyDetailEntity = await _companyModel.getCompanyDetail(
        context, companyId);
    if (companyDetailEntity.data != null) {
      _starId=companyDetailEntity.data.starId;
      setState(() {
        _isFocus=(_starId!=null&&_starId.isNotEmpty);
        _detailData = companyDetailEntity.data;
      });
    }
  }

  /// 获取公司发布的岗位列表
  void getJob4Company(String companyId) async {
    CompanyJobEntity jobEntity = await _companyModel.getJob4Company(
        context, companyId,_pageIndex,15,0);
    if (jobEntity != null && jobEntity.data.records.length > 0) {
      _pageIndex++;
    }
    setState(() {
    });
  }

  /// 收藏夹操作
  _operateStar(String id,String starId) async {
    CollectionEntity _baseEntity = await MineModel.instance.starCompanyJob(
        context, false, id,Application.sp.getString('jobSeekerId'),starId:(_isFocus?starId:''));
    if (_baseEntity != null) {
//      Utils.showToast(_baseEntity.msg ?? (_isFocus?'取消关注':'已关注'));
      setState(() {
        _starId=_baseEntity.data;
        _isFocus=!_isFocus;
      });
    }
  }

  /// 屏蔽公司
  _shieldCompany(String id) async {
    BaseRespEntity _baseEntity = await MineModel.instance.shieldCompanyJob(
        context, id, jobSeekerId: Application.sp.getString('jobSeekerId'));
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '已屏蔽');
    }
  }
}
