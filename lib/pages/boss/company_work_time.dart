import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';

class CompanyWorkTime extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<CompanyWorkTime> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
	    appBar: CommonAppBar(
		    leading: 'images/img_arrow_left_black.png',
		    leftListener: () {
			    Navigator.pop(context);
		    },
		    center: Container(
		       alignment: Alignment.center,
		       child: Column(
			       crossAxisAlignment: CrossAxisAlignment.center,
			       mainAxisAlignment: MainAxisAlignment.center,
			       children: <Widget>[
				       SizedBox(
					       height: ScreenUtil().setHeight(7),
				       ),
				       Text('工作时间',
					      maxLines: 1,
					      overflow: TextOverflow.ellipsis,
					      style: TextStyle(
						     fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
				       SizedBox(
					       height: 3,
				       ),
			       ],
		       )),
		    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
		    rightAction: Container(
			    margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
			    child: GestureDetector(
				    onTap: () {
					    Navigator.pop(context);
				    },
				    child: Text("保存",
					    style: TextStyle(
					       color: Color.fromRGBO(57,57,57,1),
					       fontSize: ScreenUtil().setSp(36),
					       fontWeight: FontWeight.bold
					    ),
				    ),
			    ),
		
		    ),
	    ),
	    body: CommonPageBody(
		    children: <Widget>[
		    	Text("工作时间",
			       style: ProfileStyle.titleStyle,
			    ),
			    SizedBox(height: ScreenUtil().setHeight(40)),
			    Container(
				    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
				    decoration: BoxDecoration(
					  border: Border(
						 bottom: BorderSide(
							 color: Color.fromRGBO(159,199,235,1),
							 width: ScreenUtil().setHeight(1),
							 style: BorderStyle.solid
						 )
					  )
				    ),
			        child: Row(
					    mainAxisAlignment: MainAxisAlignment.start,
					    crossAxisAlignment: CrossAxisAlignment.center,
					    children: <Widget>[
								GestureDetector(child: Container(
									constraints: BoxConstraints(
											minHeight: ScreenUtil().setHeight(40)
									),
									child: Text("9:30",
										style: TextStyle(
												color: Color.fromRGBO(95,94,94,1),
												fontSize: ScreenUtil().setSp(28),
												fontWeight: FontWeight.w500
										),
									),
								),behavior: HitTestBehavior.opaque,onTap: (){
									adJustTime('上班时间');
								},),
						    Container(
							    margin: EdgeInsets.only(left: ScreenUtil().setWidth(84), right:  ScreenUtil().setWidth(84)),
							    color: Color.fromRGBO(95,94,94,1),
							    width: ScreenUtil().setHeight(16),
							    height: ScreenUtil().setHeight(1),
						    ),
						    GestureDetector(child: Container(
									constraints: BoxConstraints(
											minHeight: ScreenUtil().setHeight(40)
									),
									child: Text("19:30",
										style: TextStyle(
												color: Color.fromRGBO(95,94,94,1),
												fontSize: ScreenUtil().setSp(28),
												fontWeight: FontWeight.w500
										),
									),
								),behavior: HitTestBehavior.opaque,onTap: (){
									adJustTime('下班时间');
								},),
					
					    ],
			        )),
			    
		    ],
	    )
    );
  }
	/// 调整时间
	void adJustTime(String title) {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftDateTimePicker(
					isHaveDate: false,
					title: title,
					initialTime: DateTime.now(),
					confirm: (datetime) {
						Navigator.pop(context);
					},
				);
			},
		);
	}
}