import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/msg/notify_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class MsgNotify extends StatefulWidget {
  @override
  _MsgNotifyState createState() => _MsgNotifyState();
}

class _MsgNotifyState extends State<MsgNotify> {
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
      body: ListView.builder(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(88),right:ScreenUtil().setWidth(88),bottom: ScreenUtil().setWidth(48),),
        itemBuilder: (context, index) {
          if (index < 5) {
            return NotifyItem();
          }
          return null;
        },
        itemCount: 5,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
