import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/main_resume_list_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';
import 'package:recruit_app/pages/boss/employee_star_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application.dart';
enum BossCollectionType{shield,star}

class BossCollectionJob extends StatefulWidget {
  final String title;
  final BossCollectionType type;

  BossCollectionJob({this.title = '收藏夹', this.type = BossCollectionType.star});
    
  @override
  _BossCollectionJobSate createState() {
    // TODO: implement createState
    return _BossCollectionJobSate();
  }
}

class _BossCollectionJobSate extends State<BossCollectionJob> {
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
    List<MainResumeListDataRecord> content=(widget.type==BossCollectionType.shield?BossMineModel.instance.shieldList:BossMineModel.instance.starList);
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          widget.title,
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: EasyRefresh.custom(
            controller: _refreshController,
            firstRefresh: true,
            header: MaterialHeader(),
            footer:
            ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
            onRefresh: () async {
              _pageIndex = 1;
              if(widget.type==BossCollectionType.shield){
                _getShieldList();
              }else {
                _getStarList();
              }
              _refreshController.resetLoadState();
            },
            onLoad: () async {
              if(widget.type==BossCollectionType.shield){
                _getShieldList();
              }else {
                _getStarList();
              }
              _refreshController.resetLoadState();
            },
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < content.length) {
                    var btnKey = GlobalKey<SlideButtonState>();
                    return   SlideButton(
                      key: btnKey,
                      singleButtonWidth: ScreenUtil().setWidth(116),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: EmployeeStarItem(
                            employee: content[index],
                            index: index,
                            lastItem: index == content.length - 1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeDetail(
                                  resumeId: content[index].id,
                                  resumeDetailType: ResumeDetailType
                                      .resume,),
                              ));
                        },
                      ),
                      buttons: <Widget>[
                        buildAction(btnKey, Colors.red, () {
                          btnKey.currentState.close();
                          if(widget.type==BossCollectionType.shield) {
                            _shieldSeeker(content[index].jobSeekerId, content[index].shieldId, index);
                          } else {
                            _unStar(content[index].jobSeekerId, content[index].starId, index);
                          }
                        }),
                      ],
                    );
                  }
                  return null;
                }, childCount: content.length),
              ),
            ],
          ),
        ),
      ],),
    );
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

  /// 获取黑名单列表
  _getShieldList() async {
    BossMineModel.instance
        .getShieldList(
        context, Application.sp.getString('recruiterId'), _pageIndex)
        .then((model) {
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 移除黑名单
  _shieldSeeker(String id,String shieldId, int index) async {
    BaseRespEntity _baseEntity = await BossMineModel.instance.shieldSeeker(
        context, id,Application.sp.getString('recruiterId'),shieldId: shieldId);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '删除成功');
      BossMineModel.instance.shieldList.removeAt(index);
      setState(() {});
    }
  }

  /// 获取收藏列表
  _getStarList() {
    BossMineModel.instance.getStarList(context, Application.sp.getString('recruiterId'), _pageIndex).then((model){
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 移除收藏夹
  _unStar(String id,String starId, int index) async {
    BaseRespEntity _baseEntity = await BossMineModel.instance.starSeeker(
        context,id,Application.sp.getString('recruiterId'),starId:starId);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '删除成功');
      BossMineModel.instance.starList.removeAt(index);
      setState(() {});
    }
  }
}
