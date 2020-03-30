import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(48),
            right: ScreenUtil().setWidth(48),
            top: ScreenUtil().setWidth(28),
            bottom: ScreenUtil().setWidth(20)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(65, 123, 176, 0.1),
                  offset: Offset(0, ScreenUtil().setWidth(6)),
                  blurRadius: 8,
                  spreadRadius: ScreenUtil().setWidth(12))
            ],
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setWidth(24),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text('品牌设计师',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(32),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(20, 20, 20, 1))),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(16)),
                    Text('5.5-7K',
                        style: TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: ScreenUtil().setSp(32),
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(68, 77, 151, 1))),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Wrap(
                  spacing: ScreenUtil().setWidth(12),
                  runSpacing: ScreenUtil().setWidth(12),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(24),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(1000),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                      child: Text(
                        '福州仓山',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color.fromRGBO(159, 199, 235, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(24),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(1000),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                      child: Text(
                        '1-3年',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color.fromRGBO(159, 199, 235, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(24),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(1000),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                      child: Text(
                        '本科',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color.fromRGBO(159, 199, 235, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(24)),
                  padding:
                      EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                  ),
                  child: Text(
                    '1月12日09:51由他发起的沟通',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24), color: Color.fromRGBO(176, 181, 180, 1)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
