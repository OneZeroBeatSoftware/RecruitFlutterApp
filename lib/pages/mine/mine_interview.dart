import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/msg/msg_interview_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_switch_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MineInterView extends StatefulWidget {
  @override
  _MineInterViewState createState() => _MineInterViewState();
}

class _MineInterViewState extends State<MineInterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '面试列表',
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
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, idx) {
                var key = GlobalKey<SlideButtonState>();
                if (idx < 10) {
                  return MsgInterviewItem(btnKey: key);
                }
                return null;
              },
              physics: BouncingScrollPhysics(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
