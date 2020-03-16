import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/msg/notify_detail.dart';

class NotifyItem extends StatelessWidget {
  const NotifyItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setWidth(48),
        ),
        Material(
          child: Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: new BorderRadius.circular(
                ScreenUtil().setWidth(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(54),
                    ),
                    Expanded(
                      child: Text(
                        '邀请通知',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontSize: ScreenUtil().setSp(32),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(15),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotifyDetail()));
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            '查看详情',
                            style: TextStyle(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              fontSize: ScreenUtil().setSp(24),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(12),
                          ),
                          Image.asset(
                            'images/img_arrow_right_blue.png',
                            width: ScreenUtil().setWidth(10),
                            height: ScreenUtil().setWidth(20),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(54),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Container(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(54),
                    right: ScreenUtil().setWidth(54),
                    top: ScreenUtil().setWidth(48),
                    bottom: ScreenUtil().setWidth(50),
                  ),
                  child: Text(
                    '您于2月2号成功邀请哈哈哈哈登参加公司平面设计岗位面试。',
                    style: TextStyle(
                      height: 1.5,
                      color: Color.fromRGBO(95, 94, 94, 1),
                      fontSize: ScreenUtil().setSp(28),
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 3,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(20),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setWidth(15),
        ),
        Text(
          '2月2号11:30',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(22),
            color: Color.fromRGBO(176, 181, 180, 1),
          ),
        ),
      ],
    );
  }
}
