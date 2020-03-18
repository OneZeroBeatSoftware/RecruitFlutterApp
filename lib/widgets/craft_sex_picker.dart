import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftSexPicker extends StatelessWidget {
  final Function(String) confirm;

  const CraftSexPicker({
    Key key,
    @required this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        height: ScreenUtil().setWidth(446),
        decoration: BoxDecoration(
          color: Color.fromRGBO(162, 198, 238, 1),
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
                        'images/img_cancel_white.png',
                        width: ScreenUtil().setWidth(35),
                        height: ScreenUtil().setWidth(35),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '性别',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(2),
              color: Colors.white,
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(159, 199, 235, 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          confirm("男");
                          Navigator.pop(context);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/img_setting_male.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setWidth(30),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Text(
                              '男',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(32),
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(2),
                          height: ScreenUtil().setWidth(100),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          confirm("女");
                          Navigator.pop(context);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/img_setting_female.png',
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setWidth(30),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Text(
                              '女',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(32),
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      type: MaterialType.transparency,
    );
  }
}
