import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';

class JobDescribe extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<JobDescribe> {
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
				       Text('岗位描述',
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
		    	Text("岗位信息",
			       style: TextStyle(
				       color: Color.fromRGBO(95,94,94,1),
				       fontSize: ScreenUtil().setSp(28),
				       fontWeight: FontWeight.w500
			       ),
			    ),
			    SizedBox(height: ScreenUtil().setHeight(20)),
			    Container(
				    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
				    constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(392)),
				    color: Color.fromRGBO(255,248,248,1),
				    child: Column(
					    crossAxisAlignment: CrossAxisAlignment.end,
					    children: <Widget>[
						    Expanded(
							    child: TextField(
								    maxLines: 7,
				                    minLines: 7,
								    decoration: InputDecoration(
								       border: InputBorder.none,
								       hintText: "请简要说明该岗位的基本信息",
								       hintStyle: TextStyle(
									      color: Color.fromRGBO(95,94,94,1),
									      fontSize: ScreenUtil().setSp(24),
									      letterSpacing: 1
								       )
								    ),
							    ),
						    ),
						    SizedBox(height: ScreenUtil().setHeight(15)),
						    Text("0/500",
						        style: TextStyle(
							        color: Color.fromRGBO(95,94,94,1),
							        fontSize: ScreenUtil().setSp(24),
							        fontWeight: FontWeight.w300
						        ),
						    )
				    ],)
			    ),
		    ],
	    )
    );
  }
	
}