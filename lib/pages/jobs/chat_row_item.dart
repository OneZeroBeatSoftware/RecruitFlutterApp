import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/chat_list.dart';

class ChatRowItem extends StatelessWidget {
  final Chat chat;
  final int index;
  final bool isBoss;

  const ChatRowItem({
    Key key,
    this.chat,
    this.index,
    this.isBoss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(136),
            top: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(48)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Material(
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        borderRadius: new BorderRadius.circular(
                          ScreenUtil().setWidth(20),
                        ),
                      ),
                      padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
                      child: Text(
                        chat.content,
                        style: TextStyle(
                          height: 1.4,
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                    elevation: 3,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(20),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    '已阅读',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(12),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(44),
              ),
              child: Image.asset(
                chat.sender,
                width: ScreenUtil().setWidth(88),
                height: ScreenUtil().setWidth(88),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(48),
            top: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(136)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(44),
              ),
              child: Image.asset(
                chat.sender,
                width: ScreenUtil().setWidth(88),
                height: ScreenUtil().setWidth(88),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(12),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(20),
                    ),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        borderRadius: new BorderRadius.circular(
                          ScreenUtil().setWidth(20),
                        ),
                      ),
                      padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
                      child: Text(
                        chat.content,
                        style: TextStyle(
                          height: 1.4,
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                    elevation: 3,
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    '已阅读',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
