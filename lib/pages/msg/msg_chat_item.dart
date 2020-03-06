import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MsgChatItem extends StatefulWidget {
  final GlobalKey<SlideButtonState> btnKey;

  const MsgChatItem({Key key, @required this.btnKey}) : super(key: key);

  @override
  _MsgChatItemState createState() => _MsgChatItemState();
}

class _MsgChatItemState extends State<MsgChatItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SlideButton(
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
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  'Craft Time',
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
                                '在线',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(176, 181, 180, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          '11:14',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setWidth(12)),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            '品牌策划师(9-10K)',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(95, 94, 94, 1),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(16)),
                          width: ScreenUtil().setWidth(1),
                          height: ScreenUtil().setWidth(20),
                          color: Color.fromRGBO(95, 94, 94, 1),
                        ),
                        Text(
                          '福州·金山',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color.fromRGBO(95, 94, 94, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setWidth(14)),
                    Text(
                      'HR:你好,这是我们公司的资料，您方便可...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(26),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
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
        ),
        Container(
            color: Color.fromRGBO(245, 245, 245, 1),
            height: ScreenUtil().setWidth(6)),
      ],
    );
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
