import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_appbar_divider.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/menu_list_dialog.dart';

class CompanyRegisterCapital extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<CompanyRegisterCapital> {
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
				       Text('注册资金',
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
			    ProfileInput(title: "注册资金", placeholder: '请输入资金',),
			    ProfileItem(title: "货币单位", value: '美金', onClick: () {
				    chooseMoneyUnit();
			    })
		    ],
	    )
    );
  }
  
  chooseMoneyUnit() {
	  MenuListDialog.showMenu(context, DialogConfig (
	     title: '请选择货币单位',
	     menus: <String> [
		     '人民币',
		     '美金',
	     ]
	
	  )
	  );
  }
	
}