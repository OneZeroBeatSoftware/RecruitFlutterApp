import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/seeker_notice_entity.dart';
import 'package:recruit_app/model/seeker_notice_model.dart';
import 'package:recruit_app/pages/msg/notify_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/empty_widget.dart';

class MsgNotify extends StatefulWidget {
  @override
  _MsgNotifyState createState() => _MsgNotifyState();
}

class _MsgNotifyState extends State<MsgNotify> {
  int _noticePage = 1;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '通知',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: EasyRefresh.custom(
        controller: _refreshController,
        firstRefresh: true,
        header: MaterialHeader(),
        emptyWidget: NoticeModel.instance.noticeList.length>0?null:EmptyWidget(remindText: '没有通知哦',),
        footer: ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
        onRefresh: () async {
          _noticePage = 1;
          getNoticeList();
          _refreshController.resetLoadState();
        },
        onLoad: () async {
          getNoticeList();
          _refreshController.resetLoadState();
        },
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(88),
              right: ScreenUtil().setWidth(88),
              bottom: ScreenUtil().setWidth(48),),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((cxt, idx) {
                if (idx < NoticeModel.instance.noticeList.length) {
                  return NotifyItem(notice:NoticeModel.instance.noticeList[idx]);
                }
                return null;
              }, childCount: NoticeModel.instance.noticeList.length),
            ),),
        ],
      ),
    );
  }

  /// 获取通知列表
  getNoticeList() async {
    SeekerNoticeEntity _notifyEntity =
        await NoticeModel.instance.getNoticeList(context, _noticePage, 15);
    if (_notifyEntity != null && _notifyEntity.data.records.length > 0) {
      _noticePage++;
    }
    setState(() {});
  }
}
