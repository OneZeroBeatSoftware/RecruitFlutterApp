import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/pages/boss/job_manage_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/pages/boss/company_post_recruit.dart';
import 'package:recruit_app/widgets/empty_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';


class JobManage extends StatefulWidget {
  final String companyId;
  final String recruitName;

  const JobManage({Key key, this.companyId, this.recruitName}) : super(key: key);
  @override
  _JobManageState createState() {
    // TODO: implement createState
    return _JobManageState();
  }
}

class _JobManageState extends State<JobManage> {
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
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: CommonAppBar(
            leading: 'images/img_arrow_left_black.png',
            leftListener: () {
                Navigator.pop(context);
            },
            center: Container(
               alignment: Alignment.center,
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                       SizedBox(
                           height: ScreenUtil().setHeight(7),
                       ),
                       Text('岗位管理',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                             fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
                       SizedBox(
                           height: 3,
                       ),
                   ],
               )),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                 color: Color.fromRGBO(245, 245, 245, 1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
            Expanded(
              child: EasyRefresh.custom(
                controller: _refreshController,
                firstRefresh: true,
                emptyWidget: BossMineModel.instance.jobList.length>0?null:EmptyWidget(remindText: '暂未发布岗位',),
                header: MaterialHeader(),
                footer:
                ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
                onRefresh: () async {
                  _pageIndex = 1;
                  _getJobList();
                  _refreshController.resetLoadState();
                },
                onLoad: () async {
                  _getJobList();
                  _refreshController.resetLoadState();
                },
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index < BossMineModel.instance.jobList.length) {
                          var key = GlobalKey<SlideButtonState>();
                          return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: SlideButton(
                                key: key,
                                singleButtonWidth: ScreenUtil().setWidth(116),
                                child: Container(
                                  color: Colors.white,
                                  child: JobManageItem(
                                      jobManageData:  BossMineModel.instance.jobList[index],
                                      index: index),
                                ),
                                buttons: <Widget>[
                                  buildAction(key, Colors.red, () {
                                    key.currentState.close();
                                    _deleteJob(BossMineModel.instance.jobList[index].id, index);
                                  }),
                                ],
                              ),
                              onTap: () {
                                Navigator.push<String>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CompanyPostRecruit(isADDMode: false,
                                            jobId: BossMineModel.instance
                                                .jobList[index].id,
                                            companyId: widget.companyId,
                                            recruitName: widget.recruitName,),
                                    )).then((value){
                                  if (value != null && value == 'success') {
                                    _refreshController.callRefresh();
                                  }
                                });
                              });
                        }
                        return null;
                      }, childCount: BossMineModel.instance.jobList.length)),
                ],
              ),
            ),
          ],
        ));
  }

  InkWell buildAction(GlobalKey<SlideButtonState> key, Color color,
      GestureTapCallback tap) {
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

  /// 获取岗位列表
  _getJobList() {
    BossMineModel.instance.getJobList(context, Application.sp.getString('recruiterId'),_pageIndex).then((model){
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 删除岗位信息
  _deleteJob(String id,int index) async {
    BaseRespEntity _baseEntity = await BossMineModel.instance
        .deleteJob(context,id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??'删除成功');
      BossMineModel.instance.jobList.removeAt(index);
      setState(() {
      });
    }
  }
}
