import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/mine/job_type.dart';
import 'package:recruit_app/pages/boss/job_describe.dart';


class CompanyPostRecruit extends StatefulWidget {
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
						  Text('招聘',
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
				   ProfileItem(title: "岗位描述",
					  value: '负责公司的日常平面设计及公司设计项目',
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
								builder: (context) => IndustryType()
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
								builder: (context) => IndustryType()
							 )
						  );
					  }
				   ),
			   ],
		   )
		);
	}
	
}