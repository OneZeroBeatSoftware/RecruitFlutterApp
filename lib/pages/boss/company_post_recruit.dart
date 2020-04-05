import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/boss/company_job_candidate.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_appbar_divider.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/mine/job_type.dart';
import 'package:recruit_app/pages/boss/job_describe.dart';
import 'package:recruit_app/widgets/menu_list_dialog.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/pages/mine/job_edu_exp.dart';
import 'package:recruit_app/pages/boss/company_job_salary.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/company_job_key_word.dart';
import 'package:recruit_app/pages/boss/company_work_address.dart';


class CompanyPostRecruit extends StatefulWidget {
	
	bool isADDMode;
	
	CompanyPostRecruit({this.isADDMode = true});
	
	@override
	_State createState() {
		// TODO: implement createState
		return _State();
	}
}


class _State extends State<CompanyPostRecruit> {
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
						  Text(widget.isADDMode? '发布招聘' : '岗位修改',
							 maxLines: 1,
							 overflow: TextOverflow.ellipsis,
							 style: TextStyle(
								fontSize: ScreenUtil().setSp(36),
								color: Color.fromRGBO(68, 77, 151, 1),
								fontWeight: FontWeight.bold)),
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
							  color: Color.fromRGBO(57, 57, 57, 1),
							  fontSize: ScreenUtil().setSp(36),
							  fontWeight: FontWeight.bold
						   ),
					   ),
				   ),
			   
			   ),
		   ),
		   body: CommonPageBody(
			   children: <Widget>[
				   ProfileItem(title: "求职期望",
					  value: '平面设计师',
					  onClick: () {
						  Navigator.push(
							 context,
							 MaterialPageRoute(
								builder: (context) => JobType()
							 )
						  );
					  }),
				   ProfileItem(title: "职业类型",
					  value: '广告/设计',
					  onClick: () {
						  Navigator.push(
							 context,
							 MaterialPageRoute(
								builder: (context) => IndustryType()
							 )
						  );
					  }
				   ),
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text('岗位要求', style: ProfileStyle.titleStyle),
							SizedBox(height: ScreenUtil().setHeight(40)),
							Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>[
									Item10(title: '工作经验', value: '3-5年', onClick: () {
										chooseWorkExperience();
									},),
									VDivider(),
									Item10(title: '最低学历', value: '本科', onClick: () {
										
										showCupertinoModalPopup(
											context: context,
											builder: (context) {
												return CraftPicker(
													confirm: (selPos) {
														Navigator.pop(context);
													},
													title: '薪资范围',
													pickList: <String>['高中', '本科'],
													selIdx: 0,
												);
											},
										);
									},),
									VDivider(),
									Item10(title: '薪资范围', value: '8-10k', onClick: () {
										setupSalary();
									},),
								],
							),
							
						],
					),
				   ProfileStyle.divider,
				   ProfileItem(title: "岗位描述",
					  value: '负责公司的日常平面设计及公司设计项目1',
					  onClick: () {
						  Navigator.push(
							 context,
							 MaterialPageRoute(
								builder: (context) => JobDescribe()
							 )
						  );
					  }
				   ),
				   ProfileItem(title: "岗位关键字",
					  value: '设计',
					  onClick: () {
						  Navigator.push(
							 context,
							 MaterialPageRoute(
								builder: (context) => CompanyJobKeyword()
							 )
						  );
					  }
				   ),
				   ProfileItem(title: "工作地点",
					  value: '福建福州市仓山区',
					  onClick: () {
						  Navigator.push(
							 context,
							 MaterialPageRoute(
								builder: (context) => CompanyWorkAddress()
							 )
						  );
					  }
				   ),
				   Offstage(
					   offstage: widget.isADDMode,
					   child: Column(
						   children: <Widget>[
							   Item(
								   '候选人', '', canClick: true,
								   onClick: () {
									   Navigator.push(
									      context,
									      MaterialPageRoute(
										     builder: (context) => CompanyJobCandidate()
									      )
									   );
								   },
								   tailValue: '1/10',
								   topPadding: 3,
							   ),
							   ProfileStyle.divider,
						   ],
					   )
				   ),
				   
				   Container(
					   margin: EdgeInsets.only(
					      top: ScreenUtil().setHeight(40),
					      bottom: ScreenUtil().setHeight(82)
					   ),
					   height: ScreenUtil().setHeight(72),
					   width: ScreenUtil().setWidth(652),
					   child: RaisedButton(
						   color: Color.fromRGBO(255,255,255,1),
						   child: Text(widget.isADDMode ? '修改' : '保存',
						      style: TextStyle(
							     color: Color.fromRGBO(159,199,235,1),
							     fontSize: ScreenUtil().setSp(32),
							     fontWeight: FontWeight.w300
						      )
						   ),
						   onPressed: () {
						   },
						   shape: RoundedRectangleBorder(
						      borderRadius: BorderRadius.all(Radius.circular(20)),
						      side: BorderSide(
							     color: Color.fromRGBO(159,199,235,1),
							     style: BorderStyle.solid,
							     width: ScreenUtil().setWidth(2)
						      )
						   ),
					   ),
				   )
			   ],
		   )
		);
	}
	
	chooseWorkExperience() {
		MenuListDialog.showMenu(context, DialogConfig (
		   title: '工作经验',
		   menus: <String> [
			   '1-2年',
			   '3-5年',
		   ]
		
		)
		);
	}
	
	setupSalary() {
		Navigator.push<String>(
		   context,
		   MaterialPageRoute(
			  builder: (context) => CompanyJobSalary())
		);
	}
}

class CandidateItem extends StatelessWidget {
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
	
}

class VDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
	    width: ScreenUtil().setWidth(1),
	    height: ScreenUtil().setHeight(54),
	    color: Color.fromRGBO(159,199,235,1),
    );
  }
	
}

class Item10 extends StatelessWidget {
	String title;
	String value;
	VoidCallback onClick;
	
	Item10({this.title, this.value, this.onClick});
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
	    onTap: () {
	        if(onClick != null) {
		        onClick();
	        }
	    },
	    child: Column(
		    children: <Widget>[
			    Text(title, style: TextStyle(
			       color: Color.fromRGBO(176,181,180,1),
			       fontSize: ScreenUtil().setSp(28),
			       fontWeight: FontWeight.w400
			    )),
			    SizedBox(height: ScreenUtil().setHeight(20)),
			    Text(value, style: TextStyle(
			       color: Color.fromRGBO(95,94,94,1),
			       fontSize: ScreenUtil().setSp(28),
			       fontWeight: FontWeight.w400
			    )),
		    ],
	    ),
    );
  }
	
}