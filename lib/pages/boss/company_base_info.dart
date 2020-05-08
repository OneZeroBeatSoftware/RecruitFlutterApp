import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/model/file_model.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/boss/company_business_license.dart';
import 'package:recruit_app/widgets/network_image.dart';

class CompanyInfoResult{
	String industryId;
	String industryName;
	String scaleId;
	String scaleName;
	String companyName;
	String avatar;
	List<CompanyDetailDataLicense> licenses;

	CompanyInfoResult(this.industryId, this.industryName, this.scaleId,
			this.scaleName, this.companyName,this.avatar,this.licenses);
}
class CompanyBaseInfo extends StatefulWidget {
	final CompanyInfoResult company;

  const CompanyBaseInfo({Key key, this.company}) : super(key: key);
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();

  }
}

class _State extends State<CompanyBaseInfo> {
	TextEditingController _companyController;

	String _avatar='';
	String _industry = 'o2o';
	String _industryId = '';

	String _scale;
	String _scaleId='';
	int _selScale=0;
	List<CompanyScaleData> _scaleList=[];
	List<CompanyDetailDataLicense> _licenses=[];
	int _licensesLength=0;

	@override
  void initState() {
    // TODO: implement initState
		if(widget.company!=null){
			if(widget.company.licenses!=null){
				_licenses.clear();
				_licenses.addAll(widget.company.licenses);
			}
			_avatar=widget.company.avatar;
			_industry=widget.company.industryName;
			_industryId=widget.company.industryId;
			_scale=widget.company.scaleName;
			_scaleId=widget.company.scaleId;
			_companyController = TextEditingController(text: widget.company.companyName);
		}else {
			_companyController = TextEditingController();
		}
		_licensesLength=_licenses.length;
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
		    center: Text('基本信息',
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
							if(_avatar==null||_avatar.isEmpty){
								Utils.showToast('请选择公司LOGO');
								return;
							}
				    	if(_companyController.text.isEmpty){
				    		Utils.showToast('请填写公司名称');
				    		return;
							}
				    	if(_scaleId==null||_scaleId.isEmpty){
								Utils.showToast('请选择公司规模');
								return;
							}
							if(_industryId==null||_industryId.isEmpty){
								Utils.showToast('请选择公司行业');
								return;
							}
							if (_licenses.length<1) {
								Utils.showToast('请上传营业执照');
								return;
							}
							Navigator.pop(context,CompanyInfoResult(_industryId, _industry, _scaleId, _scale, _companyController.text,_avatar,_licenses));
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
				        GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){_openGallery();},child: ClipRRect(
									borderRadius: BorderRadius.circular(54),
									child: NetImage(img: _avatar,
											placeholder: 'images/img_default_head.png',
											error: 'images/img_default_head.png',
											size: ScreenUtil().setWidth(108)),
								),),
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
					    Navigator.push<LicenseResult>(
					       context,
					       MaterialPageRoute(
						      builder: (context) => CraftBusinessLicense(licenses: _licenses,))
					    ).then((value){
								if (value != null) {
									for (var i = 0; i < (value.licenses.length); i++) {
										if (i < _licenses.length) {
											_licenses[i].image = value.licenses[i].image;
										} else {
											_licenses.add(value.licenses[i]);
										}
									}
									if (_licenses.length > value.licenses.length) {
										_licenses.removeRange(
												value.licenses.length, _licenses.length);
									}
									setState(() {
									  _licensesLength=_licenses.length;
									});
								}
							});
				    },
				    valueW: Text(_licensesLength>0?'已验证':'未验证', style: TextStyle(
					    color: Color.fromRGBO(176,181,180,1))
				    ),
			    ),
			    ProfileStyle.divider,
		    ],
	    ),
    );
  }

	/// 相册获取图片上传
	_openGallery() async{
		var _image=await ImagePicker.pickImage(source: ImageSource.gallery,);
		if(_image==null){
			return;
		}
		_uploadFile(_image);
	}

	/// 选中图片后上传图片
	_uploadFile(File file) async {
		String imgPath= await FileModel.instance.uploadFile(context, file);
		if (null!=imgPath) {
			Utils.showToast('上传成功');
			setState(() {
				_avatar=imgPath;
			});
		}else {
			Utils.showToast('上传失败');
		}
	}
  
	/// 公司规模
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

