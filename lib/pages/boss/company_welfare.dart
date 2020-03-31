import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_appbar_divider.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';

class CompanyWelfare extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<CompanyWelfare> {
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
				       Text('公司福利',
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
			    ProfileInput(title: "福利",),
			    ProfileInput(title: "福利描述"),
			    //按钮
			    Container(
				    height: ScreenUtil().setHeight(72),
			        width: ScreenUtil().setWidth(652),
				    child: RaisedButton(
				        color: Color.fromRGBO(255,255,255,1),
					    child: Text("删除",
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
	
}