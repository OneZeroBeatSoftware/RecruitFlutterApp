import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';

class CompanyLegalPerson extends StatefulWidget {
	final String legalPerson;

  const CompanyLegalPerson({Key key, this.legalPerson=''}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<CompanyLegalPerson> {
	TextEditingController _editingController;

	@override
  void initState() {
    // TODO: implement initState
		_editingController=TextEditingController(text: widget.legalPerson);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
		if(_editingController!=null){
			_editingController.dispose();
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
		    center: Text('法人',
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
				    	if(_editingController.text.isEmpty){
				    		Utils.showToast('请填写法人姓名');
				    		return;
							}
				    	Navigator.pop(context,_editingController.text);
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
			    ProfileInput(title: "名称", placeholder: '请输入名称',inputController: _editingController,),
		    ],
	    )
    );
  }
	
}