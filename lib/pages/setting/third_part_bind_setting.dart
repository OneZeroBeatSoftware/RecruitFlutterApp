import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class ThirdBindSetting extends StatefulWidget {
  @override
  _ThirdBindSettingState createState() => _ThirdBindSettingState();
}

class _ThirdBindSettingState extends State<ThirdBindSetting> {
  bool _isBindWeChat=false;
  bool _isBindFacebook=false;
  bool _isBindGoogle=false;

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
          '绑定第三方',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(15),
            ),
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(159, 199, 235, 1),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(40),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/${_isBindWeChat?"img_bind_wechat":"img_unbind_wechat"}.png',
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(80),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Expanded(
                  child: Text(
                    '微信',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color.fromRGBO(95, 94, 94, 1),
                        fontSize: ScreenUtil().setSp(22)),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),

                GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                  setState(() {
                    _isBindWeChat=!_isBindWeChat;
                  });
                },child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(46),
                    vertical: ScreenUtil().setWidth(10),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(159, 199, 235, 1),
                      width: ScreenUtil().setWidth(1),
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(1000),
                    ),
                  ),
                  child: Text(
                    _isBindWeChat?'解绑':"绑定",
                    style: TextStyle(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        fontSize: ScreenUtil().setSp(24)),
                  ),
                ),),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(40),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/${_isBindFacebook?"img_bind_facebook":"img_unbind_facebook"}.png',
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(80),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Expanded(
                  child: Text(
                    '脸书',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color.fromRGBO(95, 94, 94, 1),
                        fontSize: ScreenUtil().setSp(22)),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                  setState(() {
                    _isBindFacebook=!_isBindFacebook;
                  });
                },child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(46),
                    vertical: ScreenUtil().setWidth(10),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(159, 199, 235, 1),
                      width: ScreenUtil().setWidth(1),
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(1000),
                    ),
                  ),
                  child: Text(
                    _isBindFacebook?'解绑':"绑定",
                    style: TextStyle(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        fontSize: ScreenUtil().setSp(24)),
                  ),
                ),),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(40),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/${_isBindGoogle?"img_bind_google":"img_unbind_google"}.png',
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(80),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Expanded(
                  child: Text(
                    '谷歌',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color.fromRGBO(95, 94, 94, 1),
                        fontSize: ScreenUtil().setSp(22)),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                  setState(() {
                    _isBindGoogle=!_isBindGoogle;
                  });
                },child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(46),
                    vertical: ScreenUtil().setWidth(10),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(159, 199, 235, 1),
                      width: ScreenUtil().setWidth(1),
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(1000),
                    ),
                  ),
                  child: Text(
                    _isBindGoogle?'解绑':"绑定",
                    style: TextStyle(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        fontSize: ScreenUtil().setSp(24)),
                  ),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
