import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/socket_msg_entity.dart';
import 'package:recruit_app/model/chat_list.dart';
import 'package:recruit_app/widgets/network_image.dart';

class ChatRowItem extends StatelessWidget {
  final SocketMsgEntity chat;
  final int index;
  final bool isBoss;
  final String fromAvatar;
  final String toAvatar;

  const ChatRowItem({
    Key key,
    this.chat,
    this.index,
    this.isBoss,
    this.fromAvatar='',
    this.toAvatar='',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userId=Application.sp.getString('userId');
//    if (index == 1) {
//      return Padding(
//        padding: EdgeInsets.only(
//            left: ScreenUtil().setWidth(136),
//            top: ScreenUtil().setWidth(20),
//            bottom: ScreenUtil().setWidth(40),
//            right: ScreenUtil().setWidth(48)),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.end,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Expanded(
//              child: Container(
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.all(
//                      Radius.circular(ScreenUtil().setWidth(20))),
//                  boxShadow: [
//                    BoxShadow(
//                        color: Color.fromRGBO(65, 123, 176, 0.1),
//                        offset: Offset(0, ScreenUtil().setWidth(6)),
//                        blurRadius: 8,
//                        spreadRadius: ScreenUtil().setWidth(12))
//                  ],
//                ),
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.symmetric(
//                        horizontal: ScreenUtil().setWidth(28),
//                        vertical: ScreenUtil().setWidth(36),
//                      ),
//                      child: Text(
//                        '我想与您交换电话号码可以吗？',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          height: 1.5,
//                          fontSize: ScreenUtil().setSp(26),
//                          color: Color.fromRGBO(95, 94, 94, 1),
//                        ),
//                      ),
//                      decoration: BoxDecoration(
//                        border: Border(
//                          bottom: BorderSide(
//                            color: Color.fromRGBO(159, 199, 235, 1),
//                            width: ScreenUtil().setWidth(1),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            height: ScreenUtil().setWidth(76),
//                            alignment: Alignment.center,
//                            child: Text(
//                              '拒绝',
//                              textAlign: TextAlign.center,
//                              maxLines: 1,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  color: Color.fromRGBO(159, 199, 235, 1),
//                                  fontSize: ScreenUtil().setSp(26)),
//                            ),
//                          ),
//                        ),
//                        Container(
//                            height: ScreenUtil().setWidth(76),
//                            color: Color.fromRGBO(159, 199, 235, 1),
//                            width: ScreenUtil().setWidth(1)),
//                        Expanded(
//                          child: Container(
//                            height: ScreenUtil().setWidth(76),
//                            alignment: Alignment.center,
//                            child: Text(
//                              '接受',
//                              textAlign: TextAlign.center,
//                              maxLines: 1,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  color: Color.fromRGBO(159, 199, 235, 1),
//                                  fontSize: ScreenUtil().setSp(26)),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            SizedBox(
//              width: ScreenUtil().setWidth(12),
//            ),
//            ClipRRect(
//              borderRadius: BorderRadius.circular(
//                ScreenUtil().setWidth(44),
//              ),
//              child: Image.asset(
//                chat.sender,
//                width: ScreenUtil().setWidth(88),
//                height: ScreenUtil().setWidth(88),
//                fit: BoxFit.cover,
//              ),
//            ),
//          ],
//        ),
//      );
//    }
//
//    if (index == 3) {
//      return Padding(
//        padding: EdgeInsets.only(
//            left: ScreenUtil().setWidth(48),
//            top: ScreenUtil().setWidth(20),
//            right: ScreenUtil().setWidth(136)),
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            ClipRRect(
//              borderRadius: BorderRadius.circular(
//                ScreenUtil().setWidth(44),
//              ),
//              child: Image.asset(
//                chat.sender,
//                width: ScreenUtil().setWidth(88),
//                height: ScreenUtil().setWidth(88),
//                fit: BoxFit.cover,
//              ),
//            ),
//            SizedBox(
//              width: ScreenUtil().setWidth(12),
//            ),
//            Expanded(
//              child: Container(
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.all(
//                      Radius.circular(ScreenUtil().setWidth(20))),
//                  boxShadow: [
//                    BoxShadow(
//                        color: Color.fromRGBO(65, 123, 176, 0.1),
//                        offset: Offset(0, ScreenUtil().setWidth(6)),
//                        blurRadius: 8,
//                        spreadRadius: ScreenUtil().setWidth(12))
//                  ],
//                ),
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.symmetric(
//                        horizontal: ScreenUtil().setWidth(28),
//                        vertical: ScreenUtil().setWidth(36),
//                      ),
//                      child: Text(
//                        '我想邀请您2月10号下午3:30参加公司面试品牌设计师岗位',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          height: 1.5,
//                          fontSize: ScreenUtil().setSp(26),
//                          color: Color.fromRGBO(95, 94, 94, 1),
//                        ),
//                      ),
//                      decoration: BoxDecoration(
//                        border: Border(
//                          bottom: BorderSide(
//                            color: Color.fromRGBO(159, 199, 235, 1),
//                            width: ScreenUtil().setWidth(1),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            height: ScreenUtil().setWidth(76),
//                            alignment: Alignment.center,
//                            child: Text(
//                              '已拒绝',
//                              textAlign: TextAlign.center,
//                              maxLines: 1,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  color: Color.fromRGBO(159, 199, 235, 1),
//                                  fontSize: ScreenUtil().setSp(26)),
//                            ),
//                          ),
//                        ),
//                        Container(
//                            height: ScreenUtil().setWidth(76),
//                            color: Color.fromRGBO(159, 199, 235, 1),
//                            width: ScreenUtil().setWidth(1)),
//                        Expanded(
//                          child: Container(
//                            height: ScreenUtil().setWidth(76),
//                            alignment: Alignment.center,
//                            child: Text(
//                              '接受',
//                              textAlign: TextAlign.center,
//                              maxLines: 1,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  color: Color.fromRGBO(176, 181, 180, 1),
//                                  fontSize: ScreenUtil().setSp(26)),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      );
//    }
    if (userId==chat.fromId) {
      return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(136),
            top: ScreenUtil().setWidth(48),
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
//                  SizedBox(
//                    height: ScreenUtil().setWidth(10),
//                  ),
//                  Text(
//                    '已阅读',
//                    style: TextStyle(
//                      fontSize: ScreenUtil().setSp(22),
//                      color: Color.fromRGBO(176, 181, 180, 1),
//                    ),
//                  ),
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
              child: NetImage(img: fromAvatar,placeholder: 'images/avatar_2.png',error: 'images/avatar_2.png',size: ScreenUtil().setWidth(88),),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(48),
            top: ScreenUtil().setWidth(48),
            right: ScreenUtil().setWidth(136)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(44),
              ),
              child: NetImage(img: toAvatar,placeholder: 'images/avatar_1.png',error: 'images/avatar_1.png',size: ScreenUtil().setWidth(88),),
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
//                  SizedBox(
//                    height: ScreenUtil().setWidth(10),
//                  ),
//                  Text(
//                    '已阅读',
//                    style: TextStyle(
//                      fontSize: ScreenUtil().setSp(22),
//                      color: Color.fromRGBO(176, 181, 180, 1),
//                    ),
//                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
