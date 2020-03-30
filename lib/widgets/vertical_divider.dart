import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileVerticalDivider extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		return Row(
			children: <Widget>[
				Padding(
					padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
				),
				Container(color: Color.fromRGBO(127, 127, 127, 1),
				   height: ScreenUtil().setHeight(20),
				   width: ScreenUtil().setWidth(1)
				),
				Padding(
					padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
				),
			],
		);
	}
	
}