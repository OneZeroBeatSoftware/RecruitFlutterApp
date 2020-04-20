import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/boss/company_business_license.dart';

class CompanyBaseInfo extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
    
  }
}

class _State extends State<CompanyBaseInfo> {
	TextEditingController _companyController;


	String _industry = 'o2o';
	String _industryId = '';

	String _scale;
	String _scaleId='';
	int _selScale=0;
	List<CompanyScaleData> _scaleList=[];

	@override
  void initState() {
    // TODO: implement initState
		_companyController = TextEditingController();
		super.initState();
		WidgetsBinding.instance.addPostFrameCallback((i) {
			getScaleList();
		});
	}

  @override
  void dispose() {
    // TODO: implement dispose
		if(_companyController!=null){
			_companyController.dispose();
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
					Text(
						'公司名称',
						maxLines: 1,
						overflow: TextOverflow.ellipsis,
						style: TextStyle(
							fontSize: ScreenUtil().setSp(32),
							fontWeight: FontWeight.bold,
							color: Color.fromRGBO(57, 57, 57, 1),
						),
					),
					TextField(
						controller: _companyController,
						autofocus: false,
						scrollPadding: EdgeInsets.all(0),
						textAlign: TextAlign.start,
						maxLines: 1,
						cursorColor: Color.fromRGBO(176, 181, 180, 1),
						style: TextStyle(
								fontSize: ScreenUtil().setSp(28),
								color: Color.fromRGBO(95, 94, 94, 1)),
						decoration: InputDecoration(
							contentPadding: EdgeInsets.only(
								top: ScreenUtil().setWidth(34),
								bottom: ScreenUtil().setWidth(34),
							),
							focusedBorder: UnderlineInputBorder(
								borderSide: BorderSide(
									color: Color.fromRGBO(159, 199, 235, 1),
									width: ScreenUtil().setWidth(1),
								),
							),
							enabledBorder: UnderlineInputBorder(
								borderSide: BorderSide(
									color: Color.fromRGBO(159, 199, 235, 1),
									width: ScreenUtil().setWidth(1),
								),
							),
							hintText: '请填写公司名称',
							hintStyle: TextStyle(
								fontSize: ScreenUtil().setSp(28),
								color: Color.fromRGBO(176, 181, 180, 1),
							),
						),
						onSubmitted: (text) {},
					),
					SizedBox(
						height: ScreenUtil().setWidth(40),
					),
			    ProfileItem(
				    title: "公司规模",
				    value: _scale??'请选择公司规模',
				    onClick: () {
				    	chooseScopeUnit();
				    },
			    ),
			    ProfileItem(
				    title: "所在行业",
				    value: _industry??'请选择所在行业',
				    onClick: () {
					    Navigator.push<FilterData>(
					       context,
					       MaterialPageRoute(
						      builder: (context) => IndustryType(initId: _industryId,))
					    ).then((value){
					    	if(value!=null){
					    		setState(() {
					    		  _industryId=value.filterId;
					    		  _industry=value.filterName;
					    		});
								}
					    });
				    },
			    ),
			    NextLevel(
			       titleW: Text("营业执照",
			          style: ProfileStyle.titleStyle,
			       ),
				    onClick: () {
					    Navigator.push<String>(
					       context,
					       MaterialPageRoute(
						      builder: (context) => CraftBusinessLicense())
					    );
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
  
	
	chooseScopeUnit() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_selScale = selPos;
							_scaleId = _scaleList[selPos].id;
							_scale = _scaleList[selPos].scaleName;
						});
					},
					title: '公司规模',
					pickList: _scaleList.map((item)=>item.scaleName).toList(),
					selIdx: _selScale,
				);
			},
		);
	}

	/// 公司规模
	void getScaleList() async {
		CompanyScaleEntity scaleEntity = await NetUtils.getScaleList(context);
		if(scaleEntity.statusCode==200&&scaleEntity.data!=null){
			_scaleList.clear();
			_scaleList.addAll(scaleEntity.data);
			setState(() {
			});
		}
	}
	
}

