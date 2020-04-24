import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';
class WorkTimeResult{
	 String startTime;
	 String endTime;

	 WorkTimeResult(this.startTime, this.endTime);
}
class CompanyWorkTime extends StatefulWidget {
	final String startTime;
	final String endTime;

  const CompanyWorkTime({Key key, this.startTime='', this.endTime=''}) : super(key: key);

	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<CompanyWorkTime> {
	String _startTime;
	String _endTime;
	@override
  void initState() {
    // TODO: implement initState
		_startTime=widget.startTime;
		_endTime=widget.endTime;
    super.initState();
  }
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
		    center: Text('工作时间',
						maxLines: 1,
						overflow: TextOverflow.ellipsis,
						style: TextStyle(
								fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
		    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
		    rightAction: Container(
			    margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
			    child: GestureDetector(
				    onTap: () {
				    	FocusScope.of(context).requestFocus(FocusNode());
				    	if(_startTime==null||_startTime.isEmpty){
				    		Utils.showToast('请选择上班时间');
				    		return;
							}
							if(_endTime==null||_endTime.isEmpty){
								Utils.showToast('请选择下班时间');
								return;
							}
							Navigator.pop(context,WorkTimeResult(_startTime, _endTime));
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
									child: Text(_startTime.isEmpty?'请选择上班时间':_startTime,
										style: TextStyle(
												color: Color.fromRGBO(95,94,94,1),
												fontSize: ScreenUtil().setSp(28),
												fontWeight: FontWeight.w500
										),
									),
								),behavior: HitTestBehavior.opaque,onTap: (){
									adjustStartTime('上班时间');
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
									child: Text(_endTime.isEmpty?'请选择下班时间':_endTime,
										style: TextStyle(
												color: Color.fromRGBO(95,94,94,1),
												fontSize: ScreenUtil().setSp(28),
												fontWeight: FontWeight.w500
										),
									),
								),behavior: HitTestBehavior.opaque,onTap: (){
									adjustEndTime('下班时间');
								},),
					    ],
			        )),
			    
		    ],
	    )
    );
  }
	/// 调整上班时间
	void adjustStartTime(String title) {
		DateTime initialTime=DateTime.now();
		if(_startTime.isNotEmpty){
			List<String> times=_startTime.split(':');
			initialTime=DateTime(initialTime.year,initialTime.month,initialTime.day,int.parse(times[0]),int.parse(times[1]));
		}
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftDateTimePicker(
					isHaveDate: false,
					title: title,
					initialTime: initialTime,
					confirm: (datetime) {
						Navigator.pop(context);
						var hour=datetime.hour;
						var min=datetime.minute;
						setState(() {
							_startTime=(hour<10?'0$hour':'$hour')+':'+(min<10?'0$min':'$min');
						});
					},
				);
			},
		);
	}

	/// 调整下班时间
	void adjustEndTime(String title) {
		DateTime initialTime=DateTime.now();
		if(_endTime.isNotEmpty){
			List<String> times=_endTime.split(':');
			initialTime=DateTime(initialTime.year,initialTime.month,initialTime.day,int.parse(times[0]),int.parse(times[1]));
		}
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftDateTimePicker(
					isHaveDate: false,
					title: title,
					initialTime: initialTime,
					confirm: (datetime) {
						Navigator.pop(context);
						var hour=datetime.hour;
						var min=datetime.minute;
						setState(() {
							_endTime=(hour<10?'0$hour':'$hour')+':'+(min<10?'0$min':'$min');
						});
					},
				);
			},
		);
	}
}