import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindDialog extends Dialog {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final Color titleColor;
  final Color contentColor;
  final Color cancelColor;
  final Color confirmColor;
  final Function() confirm;
  final Function() cancel;

  RemindDialog(
      {this.title = '',
      this.content = '',
      this.confirmText = '',
      this.cancelText = '',
      this.titleColor,
      this.contentColor,
      this.cancelColor,
      this.confirmColor,
      this.confirm,
      this.cancel});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(60),
                      right: ScreenUtil().setWidth(60),
                      top: ScreenUtil().setWidth(60),
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: ScreenUtil().setSp(36),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(child: Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                      right: ScreenUtil().setWidth(30),
                      top: ScreenUtil().setWidth(20),
                    ),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: contentColor,
                        fontSize: ScreenUtil().setSp(26),
                      ),
                    ),
                  ),visible: content!=null&&content.isNotEmpty,),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(48),),
                    color: Color.fromRGBO(177, 177, 179, 1),
                    height: ScreenUtil().setWidth(1),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(30),
                            ),
                            alignment: Alignment.center,
                            height: ScreenUtil().setWidth(90),
                            child: Text(
                              cancelText,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: cancelColor,
                                fontSize: ScreenUtil().setSp(34),
                              ),
                            ),
                          ),
                          onTap: cancel,
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setWidth(90),
                        color: Color.fromRGBO(177, 177, 179, 1),
                      ),
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(30),
                            ),
                            alignment: Alignment.center,
                            height: ScreenUtil().setWidth(90),
                            child: Text(
                              confirmText,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: confirmColor,
                                fontSize: ScreenUtil().setSp(34),
                              ),
                            ),
                          ),
                          onTap: confirm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
