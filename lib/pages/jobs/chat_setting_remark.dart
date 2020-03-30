import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class ChatRemarkSetting extends StatefulWidget {
  @override
  _ChatRemarkSettingState createState() {
    // TODO: implement createState
    return _ChatRemarkSettingState();
  }
}

class _ChatRemarkSettingState extends State<ChatRemarkSetting> {
  TextEditingController _remarkController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _remarkController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pop(context);
        },
        center: Text(
          '设置备注',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              '确定',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: ScreenUtil().setSp(34),
                color: Color.fromRGBO(57, 57, 57, 1),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(48),
        ),
        child: TextField(
          controller: _remarkController,
          autofocus: false,
          scrollPadding: EdgeInsets.all(0),
          textAlign: TextAlign.start,
          maxLines: 1,
          cursorColor: Color.fromRGBO(176, 181, 180, 1),
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: Color.fromRGBO(95, 94, 94, 1)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: ScreenUtil().setWidth(34),
              bottom: ScreenUtil().setWidth(34),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(159, 199, 235, 1),
                width: ScreenUtil().setWidth(1),
              ),
            ),
            hintText: '备注',
            hintStyle: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: Color.fromRGBO(176, 181, 180, 1),
            ),
          ),
          onSubmitted: (text) {},
        ),
      ),
    );
  }
}
