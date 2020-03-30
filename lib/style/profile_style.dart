import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/profile_divider.dart';


class ProfileStyle {
	static TextStyle titleStyle = TextStyle(
	   color: Color.fromRGBO(57,57,57,1),
		fontSize: ScreenUtil().setSp(32),
		fontWeight: FontWeight.bold,
		letterSpacing: 1
	);
	
	static TextStyle valueStyle = TextStyle(
	   color: Color.fromRGBO(95,94,94,1),
		fontSize: ScreenUtil().setSp(28),
		fontWeight: FontWeight.w500,
		letterSpacing: 1
	);
	
	static Widget divider = ProfileDivider(marginBottom: 40);
}

class ProfileItem extends StatelessWidget {
	String title;
	String value;
	Function() onClick;
	ProfileItem({@required this.title, @required this.value, @required this.onClick});
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
	    crossAxisAlignment: CrossAxisAlignment.start,
	    children: <Widget>[
		    Text(title, style: ProfileStyle.titleStyle),
		    SizedBox(height: ScreenUtil().setHeight(40)),
		    NextLevel(
			    titleW: Text(value, style: ProfileStyle.valueStyle),
			    onClick: () {
					if(onClick != null) {
						onClick();
					}
			    },
		    ),
	    ],
    );
  }
}


class NextLevel extends StatelessWidget {
	Widget titleW;
	Widget valueW;
	Function() onClick;
	NextLevel({@required this.titleW, @required this.onClick, this.valueW});
	
	@override
	Widget build(BuildContext context) {
		List<Widget> tailWs = [];
		if(this.valueW != null) {
			tailWs.add(valueW);
			tailWs.add(SizedBox(width: ScreenUtil().setWidth(10)));
		}
		
		tailWs.add(
		   GestureDetector(
			   child: Image.asset('images/img_arrow_right_blue.png',
				   width:ScreenUtil().setWidth(14),
				   height: ScreenUtil().setHeight(22)
				),
			    onTap: () {
			   	    if(onClick != null) {
			   	    	onClick();
			        }
			    },
			)
		);
		
		// TODO: implement build
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				this.titleW,
				Row(
					children: tailWs,
				),
			],
		);
	}
	
}