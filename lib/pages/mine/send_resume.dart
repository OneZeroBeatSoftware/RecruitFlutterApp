import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/mine/send_resume_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class SendResumeJob extends StatefulWidget {
  @override
  _SendResumeJobState createState() {
    // TODO: implement createState
    return _SendResumeJobState();
  }
}

class _SendResumeJobState extends State<SendResumeJob> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '投递列表',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(159, 199, 235, 1),
          ),
          Expanded(
            child: EasyRefresh.custom(
              controller: _refreshController,
              firstRefresh: true,
              header: MaterialHeader(),
              footer:
                  ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
              onRefresh: () async {
                _pageIndex = 1;
                _getApplyList();
                _refreshController.resetLoadState();
              },
              onLoad: () async {
                _getApplyList();
                _refreshController.resetLoadState();
              },
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < MineModel.instance.applyList.length) {
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: SendResumeItem(
                            job: MineModel.instance.applyList[index],
                            index: index,
                            lastItem: index ==
                                MineModel.instance.applyList.length - 1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetail(jobId: MineModel.instance.applyList[index].jobId,),
                              ));
                        });
                  }
                  return null;
                }, childCount: MineModel.instance.applyList.length)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 获取已投递列表
  _getApplyList() {
    MineModel.instance
        .getApplyList(context, Application.sp.get('jobSeekerId'), 1, _pageIndex)
        .then((model) {
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }
}
