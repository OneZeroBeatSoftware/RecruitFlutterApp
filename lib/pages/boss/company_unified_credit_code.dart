import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';

class CompanyUnifiedCreditCode extends StatefulWidget {
	final String code;

  const CompanyUnifiedCreditCode({Key key, this.code=''}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<CompanyUnifiedCreditCode> {
	TextEditingController _editController;
	@override
	void initState() {
		// TODO: implement initState
		_editController=TextEditingController(text: widget.code);
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
				center: Text('统一信用代码',
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
								Utils.showToast('请填写统一信用代码');
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
			    ProfileInput(title: "统一信用代码", placeholder: '',inputController: _editController,inputType: TextInputType.number,),
		    ],
	    )
    );
  }
	
}