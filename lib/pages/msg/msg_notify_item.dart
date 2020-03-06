import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MsgNotifyItem extends StatefulWidget {
  final GlobalKey<SlideButtonState> btnKey;
  final String imgPath;
  final String title;
  final String content;

  const MsgNotifyItem({Key key, @required this.btnKey, this.imgPath, this.title, this.content,}) : super(key: key);

  @override
  _MsgNotifyItemState createState() => _MsgNotifyItemState();
}

class _MsgNotifyItemState extends State<MsgNotifyItem> {
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
              bottom: ScreenUtil().setWidth(38),
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setWidth(44))),
                  child: Image.asset(widget.imgPath,
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
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Color.fromRGBO(57, 57, 57, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(16),
                          ),
                          Text(
                            '20:30',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Color.fromRGBO(159, 199, 235, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setWidth(20)),
                      Text(
                        widget.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                    ],
                  ),),
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
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(48),
          ),
          height: ScreenUtil().setWidth(1),
          color: Color.fromRGBO(159, 199, 235, 1),
        ),
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
