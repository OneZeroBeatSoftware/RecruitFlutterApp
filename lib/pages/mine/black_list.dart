import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/mine/black_list_item.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/empty_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class BlackList extends StatefulWidget {
  @override
  _BlackListSate createState() {
    // TODO: implement createState
    return _BlackListSate();
  }
}

class _BlackListSate extends State<BlackList> {
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
          '黑名单',
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
          Expanded(
            child: EasyRefresh.custom(
              controller: _refreshController,
              emptyWidget: MineModel.instance.shieldList.length>0?null:EmptyWidget(remindText: '没有找到屏蔽的公司哦',),
              firstRefresh: true,
              header: MaterialHeader(),
              footer:
                  ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
              onRefresh: () async {
                _pageIndex = 1;
                _getShieldList();
                _refreshController.resetLoadState();
              },
              onLoad: () async {
                _getShieldList();
                _refreshController.resetLoadState();
              },
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index < MineModel.instance.shieldList.length) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: BlackListItem(
                            deleteBlack:(index){
                              _shieldCompany(MineModel.instance.shieldList[index].id,MineModel.instance.shieldList[index].shieldId, index);
                            },
                            btnKey: btnKey,
                            company: MineModel.instance.shieldList[index],
                            index: index,
                            lastItem: index ==
                                MineModel.instance.shieldList.length - 1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompanyDetail(companyId: MineModel.instance.shieldList[index].id,),
                              ));
                        },
                      );
                    }
                    return null;
                  }, childCount: MineModel.instance.shieldList.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 获取黑名单列表
  _getShieldList() async {
    MineModel.instance
        .getShieldList(
            context, Application.sp.getString('jobSeekerId'), _pageIndex)
        .then((model) {
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 移除黑名单
  _shieldCompany(String id,String shieldId, int index) async {
    BaseRespEntity _baseEntity = await MineModel.instance.shieldCompanyJob(
        context, id,shieldId: shieldId,
        jobSeekerId: Application.sp.getString('jobSeekerId'));
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '删除成功');
      MineModel.instance.shieldList.removeAt(index);
      setState(() {});
    }
  }
}
