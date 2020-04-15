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

class ProfileDivider2 extends StatelessWidget {
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       height: ScreenUtil().setHeight(1),
	    decoration: BoxDecoration(
		    color: Color.fromRGBO(159,199,235,1),
	    ),
    );
  }
}

class ProfileInput extends StatelessWidget {
	final String title;
	final String value;
	final String placeholder;
	ProfileInput({this.title, this.value, this.placeholder = '请输入内容'});
	
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
	return Column(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: <Widget>[
			Text(title, style: ProfileStyle.titleStyle),
			SizedBox(height: ScreenUtil().setHeight(10)),
			TextField(
				style: ProfileStyle.valueStyle,
				decoration: InputDecoration(
					hintText: placeholder,
					border: InputBorder.none,
				),
			),
			SizedBox(height: ScreenUtil().setHeight(10)),
			ProfileDivider2(),
			SizedBox(height: ScreenUtil().setHeight(40)),
		],
	);
  }
}

class ProfileText extends StatelessWidget {
	final String title;
	final String value;
	final bool canClick;
	final VoidCallback onClick;
	ProfileText({this.title, this.value, this.canClick = false, this.onClick});
	
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
	List<Widget> bottomW = <Widget>[];
	bottomW.add(Text(value));
	
	if(canClick) {
		bottomW.add(Image.asset('images/img_arrow_right_blue.png',
		   width:ScreenUtil().setWidth(12),
		   height: ScreenUtil().setHeight(20)
		));
	}
	
	return Column(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: <Widget>[
			Text(title, style: ProfileStyle.titleStyle),
			SizedBox(height: ScreenUtil().setHeight(10)),
			GestureDetector(
				onTap: () {
					if(canClick && onClick != null) {
						onClick();
					}
				},
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: bottomW,
				),
			),
			SizedBox(height: ScreenUtil().setHeight(20)),
			ProfileDivider2(),
			SizedBox(height: ScreenUtil().setHeight(40)),
		],
	);
  }
}

class ProfileItem extends StatelessWidget {
	final String title;
	final String value;
	final Function() onClick;
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
		    ProfileStyle.divider,
	    ],
    );
  }
}


class NextLevel extends StatelessWidget {
	final Widget titleW;
	final Widget valueW;
	final Function() onClick;
	NextLevel({@required this.titleW, @required this.onClick, this.valueW});
	
	@override
	Widget build(BuildContext context) {
		List<Widget> tailWs = [];
		if(this.valueW != null) {
			tailWs.add(valueW);
			tailWs.add(SizedBox(width: ScreenUtil().setWidth(10)));
		}
		tailWs.add(Image.asset('images/img_arrow_right_blue.png',
		   width:ScreenUtil().setWidth(14),
		   height: ScreenUtil().setHeight(22)));
		
		// TODO: implement build
		return GestureDetector(
			behavior: HitTestBehavior.opaque,
			onTap: () {
				if(onClick != null) {
					onClick();
				}
			},
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				
				children: <Widget>[
					this.titleW,
					Row(
						children: tailWs,
					),
				],
			),
		);
	}
	
}