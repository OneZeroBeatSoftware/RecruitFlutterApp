import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/menu_list_dialog.dart';

class CompanyRegisterCapital extends StatefulWidget {
	final String capital;

  const CompanyRegisterCapital({Key key, this.capital=''}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<CompanyRegisterCapital> {
	TextEditingController _editController;

	@override
	void initState() {
		// TODO: implement initState
		_editController=TextEditingController(text: widget.capital);
		super.initState();
	}

	@override
	void dispose() {
		// TODO: implement dispose
		if(_editController!=null){
			_editController.dispose();
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
				center: Text('注册资金',
						maxLines: 1,
						overflow: TextOverflow.ellipsis,
						style: TextStyle(
								fontSize: ScreenUtil().setSp(36),
								color: Color.fromRGBO(68, 77, 151, 1),
								fontWeight: FontWeight.bold)),
				backgroundColor: Color.fromRGBO(255, 255, 255, 1),
		    rightAction: Container(
			    margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
			    child: GestureDetector(
						onTap: () {
							FocusScope.of(context).requestFocus(FocusNode());
							if (_editController.text.isEmpty) {
								Utils.showToast('请填写注册资金');
								return;
							}
							Navigator.pop(context, _editController.text);
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
			    ProfileInput(title: "注册资金", placeholder: '请输入资金',inputController:_editController,inputType: TextInputType.number,),
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