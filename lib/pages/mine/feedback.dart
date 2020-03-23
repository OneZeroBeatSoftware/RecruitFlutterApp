import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CraftFeedback extends StatefulWidget {
  @override
  _CraftFeedbackState createState() => _CraftFeedbackState();
}

class _CraftFeedbackState extends State<CraftFeedback> {
  TextEditingController _editController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
          '反馈',
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
              '提交',
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(56),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
                bottom: ScreenUtil().setWidth(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '反馈内容',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color.fromRGBO(95, 94, 94, 1),
                      fontSize: ScreenUtil().setSp(28)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                TextField(
                  controller: _editController,
                  autofocus: false,
                  maxLines: 10,
                  textAlign: TextAlign.start,
                  cursorColor: Color.fromRGBO(95, 94, 94, 1),
                  maxLength: 500,
                  scrollPhysics: BouncingScrollPhysics(),
                  style: TextStyle(
                      height: 1.5,
                      letterSpacing: ScreenUtil().setWidth(3),
                      wordSpacing: ScreenUtil().setWidth(3),
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(255, 248, 248, 1),
                    contentPadding: EdgeInsets.all(
                      ScreenUtil().setWidth(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          ScreenUtil().setWidth(15),
                        ),
                      ),
                    ),
                    hintText: '请简要说明您遇到的问题和意见，以便我们为您提供更好的帮助',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1),
                    ),
                    counterStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setWidth(4),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(44),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
                bottom: ScreenUtil().setWidth(80)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '图片上传',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color.fromRGBO(95, 94, 94, 1),
                      fontSize: ScreenUtil().setSp(28)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Wrap(
                  spacing: ScreenUtil().setWidth(20),
                  runSpacing: ScreenUtil().setWidth(20),
                  children: <Widget>[
                    Image.asset(
                      'images/img_img_add_blue.png',
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setWidth(120),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
