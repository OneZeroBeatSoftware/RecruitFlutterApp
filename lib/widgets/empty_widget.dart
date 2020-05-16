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
        Offstage(child: Text('$remindText', style: TextStyle(color: Color.fromRGBO(159, 199,
            235, 1),
            fontSize: ScreenUtil().setSp(25),
            fontWeight: FontWeight.bold),),offstage: remindText==null||remindText.isEmpty,)
      ],
    );
  }
}
