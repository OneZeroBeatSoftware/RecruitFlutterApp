import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeView extends StatelessWidget {
  final String content;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final double badgeSize;
  final Color badgeColor;
  final bool isShowBadge;
  final Function() onTap;

  BadgeView(
      {Key key,
      this.content,
      this.badgeSize,
      this.badgeColor,
      this.isShowBadge,
      this.onTap,
      this.fontWeight,
      this.fontSize,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            content,
            style: TextStyle(
                fontSize: fontSize, color: textColor, fontWeight: fontWeight),
          ),
          Opacity(
            opacity: isShowBadge ? 1 : 0,
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(3),),
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(badgeSize / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
