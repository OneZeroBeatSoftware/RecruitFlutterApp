import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final String remindText;

  const EmptyWidget({Key key, this.remindText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: ScreenUtil().setWidth(200),),
        Image.asset(
          'images/img_empty.png', width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setWidth(120),
          fit: BoxFit.cover,),
        SizedBox(height: ScreenUtil().setWidth(20),),
        Offstage(child: Text('$remindText', style: TextStyle(color: Color.fromRGBO(160, 160,
            160, 1),
            fontSize: ScreenUtil().setSp(24),),),offstage: remindText==null||remindText.isEmpty)
      ],
    );
  }
}
