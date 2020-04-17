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

	TextEditingController _editController;

	@override
	void initState() {
		// TODO: implement initState
		_editController=TextEditingController();
		super.initState();
	}

	@override
	void dispose() {
		// TODO: implement dispose
		_editController.dispose();
		super.dispose();
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
					TextField(
						controller: _editController,
						autofocus: false,
						maxLines: 10,
						textAlign: TextAlign.start,
						cursorColor: Color.fromRGBO(95, 94, 94, 1),
						maxLength: 500,
						scrollPhysics: BouncingScrollPhysics(),
						style: TextStyle(
								height: 1.5,
								letterSpacing: ScreenUtil().setWidth(3),
								wordSpacing: ScreenUtil().setWidth(3),
								fontSize: ScreenUtil().setSp(24),
								color: Color.fromRGBO(95, 94, 94, 1)),
						decoration: InputDecoration(
							filled: true,
							fillColor: Color.fromRGBO(255, 248, 248, 1),
							contentPadding: EdgeInsets.all(
								ScreenUtil().setWidth(20),
							),
							border: OutlineInputBorder(
								borderSide: BorderSide.none,
								borderRadius: BorderRadius.all(
									Radius.circular(
										ScreenUtil().setWidth(15),
									),
								),
							),
							hintText: '请简要说明该岗位的基本信息',
							hintStyle: TextStyle(
								fontSize: ScreenUtil().setSp(24),
								color: Color.fromRGBO(95, 94, 94, 1),
							),
							counterStyle: TextStyle(
								fontSize: ScreenUtil().setSp(24),
								color: Color.fromRGBO(95, 94, 94, 1),
							),
						),
						onSubmitted: (text) {},
					),
		    ],
	    )
    );
  }
	
}