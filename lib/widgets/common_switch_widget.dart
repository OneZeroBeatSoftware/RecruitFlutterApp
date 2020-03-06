import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSwitch extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxBorder border;
  final bool value;
  final Function(bool) onChanged;
  final Color activeColor;
  final String content;
  final String remark;

  const CommonSwitch(
      {Key key,
      this.padding,
      this.margin,
      this.border,
      this.value = false,
      this.onChanged,
      this.activeColor,
      this.content,
      this.remark = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(border: border),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Color.fromRGBO(95, 94, 94, 1),
                  ),
                ),

                Visibility(
                  child:   SizedBox(
                    height: ScreenUtil().setWidth(15),
                  ),
                  visible: remark.isNotEmpty,
                ),
                Visibility(
                  child: Text(
                    remark,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                  visible: remark.isNotEmpty,
                ),
              ],
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
          ),
        ],
      ),
    );
  }
}
