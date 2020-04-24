import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
class WelfareResult{
	int index;
	String title;
	String content;

	WelfareResult(this.index, this.title, this.content);
}
class CompanyWelfare extends StatefulWidget {
	final CompanyDetailDataWelfare welfare;
	final int index;
  const CompanyWelfare({Key key, this.welfare, this.index=-1}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
  
}

class _State extends State<CompanyWelfare> {
	TextEditingController _titleController;
	TextEditingController _contentController;

	@override
  void initState() {
    // TODO: implement initState
		if (widget.welfare!=null) {
			_titleController=TextEditingController(text: widget.welfare.welfareName);
			_contentController=TextEditingController(text: widget.welfare.content);
		} else {
			_titleController=TextEditingController();
			_contentController=TextEditingController();
		}
    super.initState();
  }
	@override
  void dispose() {
    // TODO: implement dispose
		if(_titleController!=null){
			_titleController.dispose();
		}
		if(_contentController!=null){
			_contentController.dispose();
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
				center: Text('公司福利',
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
				    	if(_titleController.text.isEmpty){
				    		Utils.showToast('请填写福利名称');
				    		return;
							}
							if(_contentController.text.isEmpty){
								Utils.showToast('请填写福利内容');
								return;
							}
							Navigator.pop(context,WelfareResult(widget.index, _titleController.text, _contentController.text));
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
			    ProfileInput(title: "福利",inputController: _titleController,),
			    ProfileInput(title: "福利描述",inputController: _contentController,),
			    //按钮
//			    Container(
//				    height: ScreenUtil().setHeight(72),
//			        width: ScreenUtil().setWidth(652),
//				    child: RaisedButton(
//				        color: Color.fromRGBO(255,255,255,1),
//					    child: Text("删除",
//					       style: TextStyle(
//						       color: Color.fromRGBO(159,199,235,1),
//						       fontSize: ScreenUtil().setSp(32),
//						       fontWeight: FontWeight.w300
//					       )
//					    ),
//					    onPressed: () {
//					    },
//					    shape: RoundedRectangleBorder(
//					       borderRadius: BorderRadius.all(Radius.circular(20)),
//						    side: BorderSide(
//							    color: Color.fromRGBO(159,199,235,1),
//							    style: BorderStyle.solid,
//							    width: ScreenUtil().setWidth(2)
//						    )
//					    ),
//				    ),
//			    )
		    ],
	    )
    );
  }
	
}