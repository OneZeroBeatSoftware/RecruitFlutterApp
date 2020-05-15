import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
class SalaryResult{
	 String minSalary;
	 String maxSalary;
	 SalaryResult(this.minSalary, this.maxSalary);
}
class CompanyJobSalary extends StatefulWidget {
	final String minSalary;
	final String maxSalary;

  const CompanyJobSalary({Key key, this.minSalary='', this.maxSalary=''}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<CompanyJobSalary> {
	TextEditingController _minController;
	TextEditingController _maxController;

	@override
  void initState() {
    // TODO: implement initState
		_minController=TextEditingController(text: widget.minSalary);
		_maxController=TextEditingController(text: widget.maxSalary);
		super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
		if(_minController!=null){
			_minController.dispose();
		}
		if(_maxController!=null){
			_maxController.dispose();
		}
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
				       Text('薪资范围',
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
				    	FocusScope.of(context).requestFocus(FocusNode());
				    	if(_minController.text.isEmpty){
				    		Utils.showToast('请填写最低薪资要求');
				    		return;
							}
							if(_maxController.text.isEmpty){
								Utils.showToast('请填写最高薪资要求');
								return;
							}
							Navigator.pop(context,SalaryResult(_minController.text,_maxController.text));
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
			    Column(
				    crossAxisAlignment: CrossAxisAlignment.start,
				    children: <Widget>[
					    Text(
						    '薪资要求',
						    maxLines: 1,
						    overflow: TextOverflow.ellipsis,
						    style: TextStyle(
						       color: Color.fromRGBO(95, 94, 94, 1),
						       fontWeight: FontWeight.bold,
						       fontSize: ScreenUtil().setSp(32)),
					    ),
					    Row(
						    children: <Widget>[
							    SizedBox(
								    width: ScreenUtil().setWidth(100),
								    child: CupertinoTextField(
									    maxLines: 1,
									    controller: _minController,
									    keyboardType: TextInputType.number,
											inputFormatters: [
												WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
											],
									    cursorColor: Color.fromRGBO(176, 181, 180, 1),
									    textAlign: TextAlign.center,
									    padding: EdgeInsets.only(
										    left: ScreenUtil().setWidth(10),
										    right: ScreenUtil().setWidth(10),
										    top: ScreenUtil().setWidth(24),
									    ),
									    autofocus: false,
									    decoration: BoxDecoration(
										    border: Border(),
									    ),
									    style: TextStyle(
										    color: Color.fromRGBO(176, 181, 180, 1),
										    fontSize: ScreenUtil().setSp(28),
									    ),
								    ),
							    ),
							    Padding(
								    padding: EdgeInsets.only(
									    top: ScreenUtil().setWidth(24),),
								    child: Text(
									    'K  —  ',
									    style: TextStyle(
										    fontWeight: FontWeight.w500,
										    color: Color.fromRGBO(95, 94, 94, 1),
										    fontSize: ScreenUtil().setSp(28),
									    ),
								    ),
							    ),
							    SizedBox(
								    width: ScreenUtil().setWidth(100),
								    child: CupertinoTextField(
									    maxLines: 1,
											controller: _maxController,
											keyboardType: TextInputType.number,
											inputFormatters: [
												WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
											],
									    cursorColor: Color.fromRGBO(176, 181, 180, 1),
									    textAlign: TextAlign.center,
									    padding: EdgeInsets.only(
										    left: ScreenUtil().setWidth(10),
										    right: ScreenUtil().setWidth(10),
										    top: ScreenUtil().setWidth(24),
									    ),
									    autofocus: false,
									    decoration: BoxDecoration(
										    border: Border(),
									    ),
									    style: TextStyle(
										    color: Color.fromRGBO(176, 181, 180, 1),
										    fontSize: ScreenUtil().setSp(28),
									    ),
								    ),
							    ),
							
							    Padding(
								    padding: EdgeInsets.only(
									    top: ScreenUtil().setWidth(24),),
								    child: Text(
									    'K之间',
									    style: TextStyle(
										    fontWeight: FontWeight.w500,
										    color: Color.fromRGBO(95, 94, 94, 1),
										    fontSize: ScreenUtil().setSp(28),
									    ),
								    ),
							    ),
						    ],
					    ),
					    ProfileStyle.divider,
				    ],
			    )
		    ],
	    )
    );
  }
	
}