import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/employe/tag.dart';

// ignore: must_be_immutable
class Experience extends StatelessWidget {
	String _coName;
	String _workTime;
	List<String> _tags = ['地产设计', '平面设计', '设计部'];
	
	Experience(this._coName, this._workTime, this._tags);
	
	@override
	Widget build(BuildContext context) {
		List<Tag> tagViews = [];
		
		for(String tag in _tags) {
			tagViews.add(Tag(tag));
		}
		print(' size: ' + tagViews.length.toString());
		
		// TODO: implement build
		return Container(
			margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
			child: Column(
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Text(_coName,
							   style: TextStyle(
								  color: Color.fromRGBO(95, 94, 94, 1),
								  fontSize: ScreenUtil().setSp(26),
								  fontWeight: FontWeight.w300)),
							Text(_workTime,
							   style: TextStyle(
								  color: Color.fromRGBO(176, 181, 180, 1),
								  fontSize: ScreenUtil().setSp(22),
								  fontWeight: FontWeight.w300))
						],
					),
					SizedBox(height: ScreenUtil().setHeight(14)),
					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						children: tagViews,
					)
				],
			),
		);
	}
}
