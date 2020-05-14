import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Experience2 extends StatelessWidget {
	String _title;
	String _value;
	
	Experience2(this._title, this._value);
	
	@override
	Widget build(BuildContext context) {
		
		// TODO: implement build
		return Container(
			margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Expanded(child: Text(_title,
							style: TextStyle(
									color: Color.fromRGBO(95, 94, 94, 1),
									fontSize: ScreenUtil().setSp(26),
									fontWeight: FontWeight.w300)),),
					Text(_value,
					   style: TextStyle(
						  color: Color.fromRGBO(176, 181, 180, 1),
						  fontSize: ScreenUtil().setSp(22),
						  fontWeight: FontWeight.w300))
				],
			),
		);
	}
}
