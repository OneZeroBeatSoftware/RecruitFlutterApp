import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CraftBusinessLicense extends StatefulWidget {
  @override
  _CraftFeedbackState createState() => _CraftFeedbackState();
}

class _CraftFeedbackState extends State<CraftBusinessLicense> {
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
          '营业执照验证',
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
                top: ScreenUtil().setWidth(44),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '图片上传',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(20,20,20,1),
                      fontSize: ScreenUtil().setSp(32)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Text(
                  '请上传JPG/PNG/PDF格式文件系统将在三个工作日进行验证',
                  style: TextStyle(
                     fontWeight: FontWeight.w300,
                     color: Color.fromRGBO(194,203,202,1),
                     fontSize: ScreenUtil().setSp(24),
                      letterSpacing: 1,
                  ),
                  softWrap: true,
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(30),
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
                SizedBox(
                  height: ScreenUtil().setWidth(38),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(245,245,245,1),
            height: ScreenUtil().setHeight(4),
          )
        ],
      ),
    );
  }
}
