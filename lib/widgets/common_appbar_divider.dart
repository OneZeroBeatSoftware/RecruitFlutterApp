import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBarDivider extends StatelessWidget {
	
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
       color: Color.fromRGBO(245, 245, 245, 1),
       constraints: BoxConstraints.expand(
          height: ScreenUtil().setHeight(1)
       )
    );
  }
  
}