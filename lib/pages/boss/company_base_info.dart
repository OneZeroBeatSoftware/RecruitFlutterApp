import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_appbar_divider.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/style/profile_style.dart';



class CompanyBaseInfo extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
    
  }
}

class _State extends State<CompanyBaseInfo> {
	
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
				       Text('基本信息',
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
		        Row(
			        mainAxisAlignment: MainAxisAlignment.spaceBetween,
			        children: <Widget>[
			        	Text("头像", style: ProfileStyle.titleStyle,),
				        ClipRRect(
					        borderRadius: BorderRadius.circular(50),
					        child: Image.asset("images/avatar_1.png",
						        width: ScreenUtil().setWidth(108),
						        height: ScreenUtil().setWidth(108),
					        ),
				        )
			        ],
		        ),
			    ProfileStyle.divider,
			    ProfileItem(
				    title: "公司名称",
				    value: "福建一零跳动",
				    onClick: () {
				    
				    },
			    ),
			    ProfileStyle.divider,
			    ProfileItem(
				    title: "公司规模",
				    value: "900人",
				    onClick: () {
				    
				    },
			    ),
			    ProfileStyle.divider,
			    ProfileItem(
				    title: "所在行业",
				    value: "020",
				    onClick: () {
				    
				    },
			    ),
			    ProfileStyle.divider,
			    NextLevel(
			       titleW: Text("营业执照",
			          style: ProfileStyle.titleStyle,
			       ),
				    onClick: () {
			     
				    },
				    valueW: Text('已验证', style: TextStyle(
					    color: Color.fromRGBO(176,181,180,1))
				    ),
			    ),
			    ProfileStyle.divider,
		    ],
	    ),
    );
  }
}

