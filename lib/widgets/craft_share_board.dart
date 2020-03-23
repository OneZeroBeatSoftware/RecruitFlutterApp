import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareBoard extends StatefulWidget {
  final String title;

  const ShareBoard({
    Key key,
    this.title = '',
  }) : super(key: key);

  @override
  _ShareBoardState createState() => _ShareBoardState();
}

class _ShareBoardState extends State<ShareBoard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
            topRight: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
              ),
              height: ScreenUtil().setWidth(144),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'images/img_cancel_gray.png',
                        width: ScreenUtil().setWidth(25),
                        height: ScreenUtil().setWidth(25),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(2),
              color: Color.fromRGBO(159, 199, 235, 1),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(ScreenUtil().setWidth(48),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/img_share_wechat.png',
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setWidth(80),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(12),
                      ),
                      Text(
                        '微信',
                        style: TextStyle(
                          fontSize: ScreenUtil().setWidth(22),
                          color: Color.fromRGBO(95, 94, 94, 1),
                        ),
                      ),
                    ],
                  ),),
                  SizedBox(width: ScreenUtil().setWidth(50),),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/img_share_facebook.png',
                          width: ScreenUtil().setWidth(80),
                          height: ScreenUtil().setWidth(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(12),
                        ),
                        Text(
                          '脸书',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(22),
                            color: Color.fromRGBO(95, 94, 94, 1),
                          ),
                        ),
                      ],
                    ),),
                  SizedBox(width: ScreenUtil().setWidth(50),),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/img_share_google.png',
                          width: ScreenUtil().setWidth(80),
                          height: ScreenUtil().setWidth(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(12),
                        ),
                        Text(
                          '谷歌',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(22),
                            color: Color.fromRGBO(95, 94, 94, 1),
                          ),
                        ),
                      ],
                    ),),
                  SizedBox(width: ScreenUtil().setWidth(50),),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/img_share_copy_link.png',
                          width: ScreenUtil().setWidth(80),
                          height: ScreenUtil().setWidth(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(12),
                        ),
                        Text(
                          '复制链接',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(22),
                            color: Color.fromRGBO(95, 94, 94, 1),
                          ),
                        ),
                      ],
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
      type: MaterialType.transparency,
    );
  }
}
