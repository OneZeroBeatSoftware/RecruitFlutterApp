import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String leading;
  final String leftText;
  final Widget center;
  final Widget rightAction;
  final Color backgroundColor;
  final Function() leftListener;

  CommonAppBar(
      {this.leading,
      this.leftText='',
      this.center,
      this.rightAction,
      this.backgroundColor,
      this.leftListener});

  @override
  _CommonAppBarState createState() => _CommonAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(56);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: SafeArea(child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap:widget.leftListener,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      widget.leading,
                      width: ScreenUtil().setWidth(20),
                      height: ScreenUtil().setWidth(36),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    Text(
                      widget.leftText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: ScreenUtil().setSp(36),
                        color: Color.fromRGBO(159, 199, 235, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: widget.center,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: widget.rightAction,
          ),
        ],
      ),),
    );
  }
}
