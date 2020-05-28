import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/boss/boss_communicate_item.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/mine/communicate_row_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/empty_widget.dart';

class CommunicateJob extends StatefulWidget {
  @override
  _CommunicateJobState createState() {
    // TODO: implement createState
    return _CommunicateJobState();
  }
}

class _CommunicateJobState extends State<CommunicateJob> {
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
    if (_refreshController != null) {
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    IdentityModel identityModel=Provider.of<IdentityModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '沟通过',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setWidth(1),
          color: Color.fromRGBO(159, 199, 235, 1),
        ),
        Expanded(
          child: EasyRefresh.custom(
            controller: _refreshController,
            firstRefresh: true,
            emptyWidget: identityModel.identity == Identity.boss
                ? (BossMineModel.instance.applyList.length > 0
                ? null
                : EmptyWidget(remindText: '没有沟通记录哦',))
                : (MineModel.instance.applyList.length > 0 ? null : EmptyWidget(
              remindText: '没有沟通记录哦',)),
            header: MaterialHeader(),
            footer:
            ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
            onRefresh: () async {
              _pageIndex = 1;
              if (identityModel.identity == Identity.boss) {
                _getRecruiterApplyList();
              } else {
                _getApplyList();
              }
              _refreshController.resetLoadState();
            },
            onLoad: () async {
              if (identityModel.identity == Identity.boss) {
                _getRecruiterApplyList();
              } else {
                _getApplyList();
              }
              _refreshController.resetLoadState();
            },
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if(identityModel.identity==Identity.boss){
                      if (index < BossMineModel.instance.applyList.length) {
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: BossCommunicateItem(
                                resume: BossMineModel.instance.applyList[index],
                                index: index,
                                lastItem: index == BossMineModel.instance.applyList.length - 1),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EmployeeDetail(
                                          resumeDetailType: ResumeDetailType
                                              .resume,
                                          resumeId: BossMineModel.instance
                                              .applyList[index].resumeId,),
                                  ));
                            });
                      }
                    }else {
                      if (index < MineModel.instance.applyList.length) {
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: CommunicateRowItem(
                                job: MineModel.instance.applyList[index],
                                index: index,
                                lastItem: index == MineModel.instance.applyList.length - 1),
                            onTap: () {
                                //默认跳转行为
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobDetail(jobId: MineModel.instance.applyList[index].jobId,),
                                    ));
                            });
                      }
                    }
                    return null;
                  }, childCount: identityModel.identity==Identity.boss?BossMineModel.instance.applyList.length:MineModel.instance.applyList.length)),
            ],
          ),
        ),
      ],),
    );
  }

  /// 获取沟通列表
  _getApplyList() {
    MineModel.instance
        .getApplyList(context, Application.sp.get('jobSeekerId'), 7, _pageIndex)
        .then((model) {
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 获取沟通列表
  _getRecruiterApplyList() {
    BossMineModel.instance
        .getApplyList(context, Application.sp.get('recruiterId'), 7, _pageIndex)
        .then((model) {
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }
}
