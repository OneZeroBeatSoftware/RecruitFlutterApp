
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/collection_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/companys/company_row_item.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/empty_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

import '../../application.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionSate createState() {
    // TODO: implement createState
    return _CollectionSate();
  }
}

class _CollectionSate extends State<Collection> {
  int _selectFilterType = 2;

  int _pageIndex = 1;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_refreshController != null) {
      _refreshController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyWidget;
    if (_selectFilterType == 2 && MineModel.instance.companyList.length <= 0) {
      emptyWidget = EmptyWidget(remindText: '没有收藏的公司哦',);
    } else if (MineModel.instance.jobList.length <= 0) {
      emptyWidget = EmptyWidget(remindText: '没有收藏的岗位哦',);
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          leading: 'images/img_arrow_left_black.png',
          leftListener: () {
            Navigator.pop(context);
          },
          center: Text(
            '收藏夹',
            style: TextStyle(
                color: Color.fromRGBO(68, 77, 151, 1),
                fontSize: ScreenUtil().setSp(36),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: ScreenUtil().setWidth(88),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        "企业",
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
                        "岗位",
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
            Expanded(
              child: EasyRefresh.custom(
                controller: _refreshController,
                firstRefresh: true,
                emptyWidget: emptyWidget,
                header: MaterialHeader(),
                footer: ClassicalFooter(
                    infoColor: Color.fromRGBO(159, 199, 235, 1)),
                onRefresh: () async {
                  _pageIndex = 1;
                  _getStarList();
                  _refreshController.resetLoadState();
                },
                onLoad: () async {
                  _getStarList();
                  _refreshController.resetLoadState();
                },
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index <
                            (_selectFilterType == 2
                                ? MineModel.instance.companyList.length
                                : MineModel.instance.jobList.length)) {
                          var btnKey = GlobalKey<SlideButtonState>();
                          return SlideButton(
                            key: btnKey,
                            singleButtonWidth: ScreenUtil().setWidth(116),
                            child: _selectFilterType == 2
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CompanyDetail(companyId: MineModel.instance.companyList[index].id,),
                                          ));
                                    },
                                    behavior: HitTestBehavior.opaque,
                                    child: CompanyRowItem(
                                        company: MineModel.instance.companyList[index],
                                        index: index,
                                        lastItem: index ==
                                            MineModel.instance.companyList.length -
                                                1),
                                  )
                                : GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    child: JobRowItem(
                                        job: MineModel.instance.jobList[index],
                                        index: index,
                                        lastItem: index ==
                                            MineModel.instance.jobList.length - 1),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => JobDetail(
                                                jobId: MineModel.instance
                                                    .jobList[index].id),
                                          ));
                                    },
                                  ),
                            buttons: <Widget>[
                              buildAction(btnKey, Colors.red, () {
                                btnKey.currentState.close();
                                _unStar(_selectFilterType == 2
                                    ? MineModel.instance.companyList[index].id
                                    : MineModel.instance.jobList[index].id,_selectFilterType == 2
                                    ? MineModel.instance.companyList[index].starId
                                    : MineModel.instance.jobList[index].starId,index);
                              }),
                            ],
                          );
                        }
                        return null;
                      },
                      childCount: _selectFilterType == 2
                          ? MineModel.instance.companyList.length
                          : MineModel.instance.jobList.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  InkWell buildAction(
      GlobalKey<SlideButtonState> key, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          'images/img_del_white.png',
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(38),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// 获取收藏列表
  _getStarList() {
    MineModel.instance.getStarList(context, Application.sp.getString('jobSeekerId'), _pageIndex, _selectFilterType).then((model){
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 移除收藏夹
  _unStar(String id,String starId, int index) async {
    CollectionEntity _baseEntity = await MineModel.instance.starCompanyJob(
        context, _selectFilterType==1, id,Application.sp.getString('jobSeekerId'),starId:starId);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '删除成功');
      if(_selectFilterType==1){
        MineModel.instance.jobList.removeAt(index);
      }else {
        MineModel.instance.companyList.removeAt(index);
      }
      setState(() {});
    }
  }
}
