import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Tag extends StatelessWidget {
	String _title;
	
	Tag(this._title);
	
	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		return Container(
			alignment: Alignment.center,
			margin: EdgeInsets.only(right: ScreenUtil().setWidth(12)),
			child: Text(
				_title,
				style: TextStyle(color: Color.fromRGBO(159,199,235,1), fontSize: ScreenUtil().setSp(18)),
			),
			padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(4), horizontal: ScreenUtil().setWidth(14)),
			decoration: BoxDecoration(
			   border: Border.all(color: Color.fromRGBO(159,199,235,1), width: ScreenUtil().setWidth(1), style: BorderStyle.solid),
			   borderRadius: BorderRadius.all(Radius.circular(20))
			),
		);
	}
}