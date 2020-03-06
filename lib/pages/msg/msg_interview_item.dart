import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MsgInterviewItem extends StatefulWidget {
  final GlobalKey<SlideButtonState> btnKey;

  const MsgInterviewItem({Key key, @required this.btnKey}) : super(key: key);

  @override
  _MsgInterviewItemState createState() => _MsgInterviewItemState();
}

class _MsgInterviewItemState extends State<MsgInterviewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[SlideButton(
      key: widget.btnKey,
      singleButtonWidth: ScreenUtil().setWidth(116),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(38),
          left: ScreenUtil().setWidth(48),
          right: ScreenUtil().setWidth(48),
          bottom: ScreenUtil().setWidth(38),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(ScreenUtil().setWidth(44))),
              child: Image.asset('images/ic_ask_resume_action.png',
                  width: ScreenUtil().setWidth(88),
                  height: ScreenUtil().setWidth(88),
                  fit: BoxFit.cover),
            ),
            SizedBox(width: ScreenUtil().setWidth(32)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '品牌策划师(9-10K)',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(36),
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          '待处理',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setWidth(10)),
                    Text(
                      '先知先觉传媒有限公司邀请您参与面试',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_time_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '1月5号上午09:30',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(16),
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_call_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '188 8888 8888',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(16),
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_location_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '福州市鼓楼区塔头路85号',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(20),
                        ),
                        Image.asset(
                          'images/img_arrow_right_blue.png',
                          width: ScreenUtil().setWidth(10),
                          height: ScreenUtil().setWidth(20),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      buttons: <Widget>[
        buildAction(widget.btnKey, Colors.red, () {
          widget.btnKey.currentState.close();
        }),
      ],
    ),  Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        height: ScreenUtil().setWidth(6)),],);
  }

  InkWell buildAction(
      GlobalKey<SlideButtonState> key, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          'images/img_del_white.png',
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(38),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
