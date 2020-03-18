import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDivider extends StatelessWidget {
	int marginBottom;
	ProfileDivider({this.marginBottom = 0});
	
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       margin: EdgeInsets.only(top: ScreenUtil().setHeight(40), bottom: ScreenUtil().setHeight(marginBottom)),
       color: Color.fromRGBO(159,199,235,1),
       constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))
    );
  }
}