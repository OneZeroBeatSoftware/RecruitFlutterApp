import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyAppBar extends StatefulWidget {
  final String leading;
  final String leftText;
  final Widget center;
  final Widget rightAction;
  final Color backgroundColor;
  final BoxBorder border;
  final Function() leftListener;

  CompanyAppBar(
      {this.leading,
      this.leftText='',
      this.center,
      this.rightAction,
      this.backgroundColor,
      this.leftListener, this.border});

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CompanyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(color: widget.backgroundColor,border: widget.border??Border()),
      child: Stack(
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
                  mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
