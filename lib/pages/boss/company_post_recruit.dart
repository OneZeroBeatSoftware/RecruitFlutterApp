import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/boss_job_detail_entity.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/pages/boss/company_job_candidate.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/mine/job_type.dart';
import 'package:recruit_app/pages/boss/job_describe.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/pages/boss/company_job_salary.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/company_job_key_word.dart';
import 'package:recruit_app/pages/boss/company_work_address.dart';

import '../../application.dart';

class RecruitType{
	String id;
	String type;

	RecruitType(this.id, this.type);
}

class CompanyPostRecruit extends StatefulWidget {
	final String companyId;
	final String recruitName;
	final bool isADDMode;
	final String jobId;
	
	CompanyPostRecruit({this.isADDMode = true, this.jobId='', this.companyId, this.recruitName});
	
	@override
	_State createState() {
		// TODO: implement createState
		return _State();
	}
}

class _State extends State<CompanyPostRecruit> {
	bool _isLoad=false;
	TextEditingController _jobNameController;
	TextEditingController _recruitNumController;
	TextEditingController _candidateNumController;

	List<EduLevelData> _eduLevelList = [];
	String _eduLevel;
	String _eduId = '';
	int _eduPos = 0;

	List<WorkDateData> _wordDateList = [];
	String _workDate;
	String _workDateId ='';
	int _workDatePos = 0;

	List<RecruitType> _recruitList = [];
	String _recruitType='招聘中';
	String _recruitTypeId='1';
	int _recruitTypePos = 0;

	List<RecruitType> _sexList = [];
	String _sex='性别不限';
	String _sexId='2';
	int _sexPos = 0;

	List<RecruitType> _jobClassifyList = [];
	String _classify='请选择岗位分类';
	String _classifyId='';
	int _classifyPos = 0;

	String _industryType='请选择行业类型';
	String _industryId='';
	String _jobType='请选择岗位类型';
	String _jobTypeId='';
	String _minSalary='';
	String _maxSalary='';
	int _candidatesCurrent=0;
	int _candidatesTotal=0;
	String _cityId='';
	String _city='';
	String _workAddress='';
	String _jobContent='';
	List<BossJobDetailDataJobTag> _tagList = [];

	@override
	void initState() {
		// TODO: implement initState
		_recruitList.add(RecruitType('1','招聘中'));
		_recruitList.add(RecruitType('2','隐藏'));
		_recruitList.add(RecruitType('3','暂停招聘'));

		_sexList.add(RecruitType('2', '性别不限'));
		_sexList.add(RecruitType('1', '男'));
		_sexList.add(RecruitType('0', '女'));

		_jobClassifyList.add(RecruitType('1', '技术'));
		_jobClassifyList.add(RecruitType('2', '人事'));
		_jobClassifyList.add(RecruitType('3', '财务'));

		_jobNameController=TextEditingController(text: '');
		_recruitNumController=TextEditingController(text: '');
		_candidateNumController=TextEditingController(text:'');
		_isLoad = (widget.jobId != null && widget.jobId.isNotEmpty);
		super.initState();

		WidgetsBinding.instance.addPostFrameCallback((callback) {
			if (_isLoad) {
				_getResumeDetail(widget.jobId);
			}
			getEduLevel();
			getWorkDate();
		});
	}

	@override
  void dispose() {
    // TODO: implement dispose
		if(_jobNameController!=null){
			_jobNameController.dispose();
		}
		if(_recruitNumController!=null){
			_recruitNumController.dispose();
		}
		if(_candidateNumController!=null){
			_candidateNumController.dispose();
		}
    super.dispose();
  }

	@override
	Widget build(BuildContext context) {
		// TODO: implement build

		String tags=_tagList.map((item)=>item.tagName).toList().join('、');
		return Scaffold(
		   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
		   appBar: CommonAppBar(
			   leading: 'images/img_arrow_left_black.png',
			   leftListener: () {
				   Navigator.pop(context);
			   },
			   center: Text(widget.isADDMode? '发布招聘' : '岗位修改',
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
					   	if(_jobNameController.text.isEmpty){
					   		Utils.showToast('请填写岗位姓名');
					   		return;
							}
							if(_recruitNumController.text.isEmpty){
								Utils.showToast('请填写招聘人数');
								return;
							}
							if(_candidateNumController.text.isEmpty){
								Utils.showToast('请填写最大候选人数');
								return;
							}
							if(_jobTypeId==null||_jobTypeId.isEmpty){
								Utils.showToast('请选择岗位类型');
								return;
							}
					   	if(_industryId==null||_industryId.isEmpty){
								Utils.showToast('请选择行业类型');
								return;
							}
							if(_classifyId==null||_classifyId.isEmpty){
								Utils.showToast('请选择岗位分类');
								return;
							}
							if(_workDateId==null||_workDateId.isEmpty){
								Utils.showToast('请选择工作经验要求');
								return;
							}
							if(_eduId==null||_eduId.isEmpty){
								Utils.showToast('请选择学历要求');
								return;
							}
							if(_minSalary==null||_minSalary.isEmpty||_maxSalary==null||_maxSalary.isEmpty){
								Utils.showToast('请填写薪资要求');
								return;
							}
							if(_jobContent==null||_jobContent.isEmpty){
								Utils.showToast('请填写岗位描述');
								return;
							}
							if(_tagList==null||_tagList.length<=0){
								Utils.showToast('请填写岗位关键字');
								return;
							}
							if(_cityId==null||_cityId.isEmpty||_workAddress==null||_workAddress.isEmpty){
								Utils.showToast('请填写工作地点');
								return;
							}
							if(_recruitTypeId==null||_recruitTypeId.isEmpty){
								Utils.showToast('请选择岗位类型');
								return;
							}
							if(_sexId==null||_sexId.isEmpty){
								Utils.showToast('请选择岗位类型');
								return;
							}
							_postJob();
					   },
					   child: Text(widget.isADDMode ? '保存' : '修改',
						   style: TextStyle(
							  color: Color.fromRGBO(57, 57, 57, 1),
							  fontSize: ScreenUtil().setSp(36),
							  fontWeight: FontWeight.bold
						   ),
					   ),
				   ),
			   
			   ),
		   ),
		   body: _isLoad?Center(heightFactor: 20,child: CupertinoActivityIndicator(),):CommonPageBody(
				 children: <Widget>[
					 Container(
						 decoration: BoxDecoration(
							 border: Border(
								 bottom: BorderSide(
									 color: Color.fromRGBO(159, 199, 235, 1),
									 width: ScreenUtil().setWidth(1),
								 ),
							 ),
						 ),
						 child: Column(
							 crossAxisAlignment: CrossAxisAlignment.stretch,
							 children: <Widget>[
								 Text(
									 '岗位名称',
									 maxLines: 1,
									 overflow: TextOverflow.ellipsis,
									 style: TextStyle(
										 fontSize: ScreenUtil().setSp(32),
										 fontWeight: FontWeight.bold,
										 color: Color.fromRGBO(57, 57, 57, 1),
									 ),
								 ),
								 TextField(
									 controller: _jobNameController,
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
											 bottom: ScreenUtil().setWidth(40),
										 ),
										 border: InputBorder.none,
										 hintText: '请填写岗位名称',
										 hintStyle: TextStyle(
											 fontSize: ScreenUtil().setSp(28),
											 color: Color.fromRGBO(176, 181, 180, 1),
										 ),
									 ),
									 onChanged: (text){
									 },
									 onSubmitted: (text) {},
								 ),
							 ],
						 ),
					 ),
					 SizedBox(height: ScreenUtil().setWidth(23),),
					 Container(
						 decoration: BoxDecoration(
							 border: Border(
								 bottom: BorderSide(
									 color: Color.fromRGBO(159, 199, 235, 1),
									 width: ScreenUtil().setWidth(1),
								 ),
							 ),
						 ),
						 child: Column(
							 crossAxisAlignment: CrossAxisAlignment.stretch,
							 children: <Widget>[
								 Text(
									 '招聘人数',
									 maxLines: 1,
									 overflow: TextOverflow.ellipsis,
									 style: TextStyle(
										 fontSize: ScreenUtil().setSp(32),
										 fontWeight: FontWeight.bold,
										 color: Color.fromRGBO(57, 57, 57, 1),
									 ),
								 ),
								 TextField(
									 controller: _recruitNumController,
									 autofocus: false,
									 keyboardType: TextInputType.number,
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
											 bottom: ScreenUtil().setWidth(40),
										 ),
										 border: InputBorder.none,
										 hintText: '请填写招聘人数',
										 hintStyle: TextStyle(
											 fontSize: ScreenUtil().setSp(28),
											 color: Color.fromRGBO(176, 181, 180, 1),
										 ),
									 ),
									 onChanged: (text){
									 },
									 onSubmitted: (text) {},
								 ),
							 ],
						 ),
					 ),
					 SizedBox(height: ScreenUtil().setWidth(23),),
					 Container(
						 decoration: BoxDecoration(
							 border: Border(
								 bottom: BorderSide(
									 color: Color.fromRGBO(159, 199, 235, 1),
									 width: ScreenUtil().setWidth(1),
								 ),
							 ),
						 ),
						 child: Column(
							 crossAxisAlignment: CrossAxisAlignment.stretch,
							 children: <Widget>[
								 Text(
									 '最大候选人数',
									 maxLines: 1,
									 overflow: TextOverflow.ellipsis,
									 style: TextStyle(
										 fontSize: ScreenUtil().setSp(32),
										 fontWeight: FontWeight.bold,
										 color: Color.fromRGBO(57, 57, 57, 1),
									 ),
								 ),
								 TextField(
									 controller: _candidateNumController,
									 autofocus: false,
									 keyboardType: TextInputType.number,
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
											 bottom: ScreenUtil().setWidth(40),
										 ),
										 border: InputBorder.none,
										 hintText: '请填写最大候选人数',
										 hintStyle: TextStyle(
											 fontSize: ScreenUtil().setSp(28),
											 color: Color.fromRGBO(176, 181, 180, 1),
										 ),
									 ),
									 onChanged: (text){
									 },
									 onSubmitted: (text) {},
								 ),
							 ],
						 ),
					 ),
					 SizedBox(height: ScreenUtil().setWidth(23),),
					 ProfileItem(title: "岗位类型",
							 value: _jobType,
							 onClick: () {
								 Navigator.push<FilterData>(
										 context,
										 MaterialPageRoute(
												 builder: (context) => JobType(initId: _jobTypeId,))
								 ).then((value){
								 	if(value!=null){
								 		setState(() {
								 		  _jobTypeId=value.filterId;
								 		  _jobType=value.filterName;
								 		});
									}
								 });
							 }),
					 ProfileItem(title: "行业类型",
							 value: _industryType,
							 onClick: () {
								 Navigator.push<FilterData>(
										 context,
										 MaterialPageRoute(
												 builder: (context) => IndustryType(initId: _industryId,)
										 )
								 ).then((value){
									 if(value!=null){
										 setState(() {
											 _industryId=value.filterId;
											 _industryType=value.filterName;
										 });
									 }
								 });
							 }
					 ),
					 ProfileItem(title: "岗位分类",
							 value: _classify,
							 onClick: () {
								 chooseJobClassify();
							 }),
					 Column(
						 crossAxisAlignment: CrossAxisAlignment.start,
						 children: <Widget>[
							 Text('岗位要求', style: ProfileStyle.titleStyle),
							 SizedBox(height: ScreenUtil().setHeight(40)),
							 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
								 crossAxisAlignment: CrossAxisAlignment.center,
								 children: <Widget>[
									 Item10(title: '工作经验', value: _workDate??'请选择经验', onClick: () {
										 chooseWorkExperience();
									 },),
									 VDivider(),
									 Item10(title: '最低学历', value: _eduLevel??'请选择学历', onClick: () {
									 	chooseEduExp();
									 },),
									 VDivider(),
									 Item10(title: '薪资范围', value: (_minSalary.isEmpty&&_maxSalary.isEmpty)?'请选择薪资范围':'$_minSalary-${_maxSalary}k', onClick: () {
										 setupSalary();
									 },),
								 ],
							 ),

						 ],
					 ),
					 ProfileStyle.divider,
					 ProfileItem(title: "岗位描述",
							 value: _jobContent.isEmpty?'请填写岗位描述':_jobContent,
							 onClick: () {
								 Navigator.push<String>(
										 context,
										 MaterialPageRoute(
												 builder: (context) => JobDescribe(jobContent:_jobContent)
										 )
								 ).then((value){
								 	if(value!=null){
								 		setState(() {
								 		  _jobContent=value;
								 		});
									}
								 });
							 }
					 ),
					 ProfileItem(title: "岗位关键字",
							 value: tags.isEmpty?'请填写岗位关键字':tags,
							 onClick: () {
								 Navigator.push<String>(
										 context,
										 MaterialPageRoute(
												 builder: (context) => CompanyJobKeyword(keyword: tags.replaceAll('、', ' '),)
										 )
								 ).then((value){
								 	if(value!=null){
								 		setState(() {
											_tagList=value.split('、').map((item){
												return BossJobDetailDataJobTag()
													..tagName = item;
											}).toList();
								 		});
									}
								 });
							 }
					 ),
					 ProfileItem(title: "工作地点",
							 value: '${_city??""}${_workAddress??""}'.isEmpty?"请选择工作地点":'${_city??""}${_workAddress??""}',
							 onClick: () {
								 Navigator.push<WorkAddressResult>(
									 context,
									 MaterialPageRoute(
										 builder: (context) =>
												 CompanyWorkAddress(
													 cityId: _cityId,
													 cityName: _city,
													 detailAddress: _workAddress,),
									 ),
								 ).then((value) {
									 if (value != null) {
										 _cityId=value.cityId;
									 	setState(() {
									 	  _city=value.cityName;
									 	  _workAddress=value.detailAddress;
									 	});
									 }
								 });
							 }
					 ),
					 Offstage(
							 offstage: false,
							 child: Column(
								 children: <Widget>[
									 Item(
										 '性别要求', '', canClick: true,
										 onClick: () {
											 FocusScope.of(context).requestFocus(FocusNode());
											 chooseSexType();
										 },
										 tailValue: '$_sex',
										 topPadding: 3,
									 ),
									 ProfileStyle.divider,
								 ],
							 )
					 ),
					 Offstage(
							 offstage: false,
							 child: Column(
								 children: <Widget>[
									 Item(
										 '岗位状态', '', canClick: true,
										 onClick: () {
											 FocusScope.of(context).requestFocus(FocusNode());
											 chooseJobType();
										 },
										 tailValue: '$_recruitType',
										 topPadding: 3,
									 ),
									 ProfileStyle.divider,
								 ],
							 )
					 ),
					 Offstage(
							 offstage: widget.isADDMode,
							 child: Column(
								 children: <Widget>[
									 Item(
										 '候选人', '', canClick: true,
										 onClick: () {
											 if (_candidatesCurrent <= 0) {
												 Utils.showToast('该岗位还没有候选人！');
												 return;
											 }
											 FocusScope.of(context).requestFocus(FocusNode());
											 Navigator.push<int>(
													 context,
													 MaterialPageRoute(
															 builder: (context) =>
																	 CompanyJobCandidate(jobId: widget.jobId,)
													 )
											 ).then((value) {
												 if (value != null) {
													 setState(() {
														 _candidatesCurrent = value;
													 });
												 }
											 });
										 },
										 tailValue: '$_candidatesCurrent/$_candidatesTotal',
										 topPadding: 3,
									 ),
									 ProfileStyle.divider,
								 ],
							 )
					 ),
					 SizedBox(height: ScreenUtil().setWidth(80),),
//					 Container(
//						 margin: EdgeInsets.only(
//								 top: ScreenUtil().setHeight(40),
//								 bottom: ScreenUtil().setHeight(82)
//						 ),
//						 height: ScreenUtil().setHeight(72),
//						 width: ScreenUtil().setWidth(652),
//						 child: RaisedButton(
//							 color: Color.fromRGBO(255,255,255,1),
//							 child: Text(widget.isADDMode ? '保存' : '修改',
//									 style: TextStyle(
//											 color: Color.fromRGBO(159,199,235,1),
//											 fontSize: ScreenUtil().setSp(32),
//											 fontWeight: FontWeight.w300
//									 )
//							 ),
//							 onPressed: () {
//							 },
//							 shape: RoundedRectangleBorder(
//									 borderRadius: BorderRadius.all(Radius.circular(20)),
//									 side: BorderSide(
//											 color: Color.fromRGBO(159,199,235,1),
//											 style: BorderStyle.solid,
//											 width: ScreenUtil().setWidth(2)
//									 )
//							 ),
//						 ),
//					 )
				 ],
			 ),
		);
	}

	/// 工作经验
	chooseWorkExperience() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_workDatePos = selPos;
							_workDateId=_wordDateList[selPos].id;
							_workDate = _wordDateList[selPos].workDateName;
						});
					},
					title: '工作经验',
					pickList: _wordDateList.map((item)=>item.workDateName).toList(),
					selIdx: _workDatePos,
				);
			},
		);
	}

	/// 学历
	chooseEduExp() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_eduPos = selPos;
							_eduId=_eduLevelList[selPos].id;
							_eduLevel = _eduLevelList[selPos].educationName;
						});
					},
					title: '最低学历',
					pickList: _eduLevelList.map((item)=>item.educationName).toList(),
					selIdx: _eduPos,
				);
			},
		);
	}

	/// 经验要求
	void getWorkDate() async {
		WorkDateEntity workDateEntity = await NetUtils.getWorkDate(context);
		if(workDateEntity.statusCode==200&&workDateEntity.data!=null){
			_wordDateList.clear();
			_wordDateList.addAll(workDateEntity.data);
			setState(() {
			});
		}
	}

	/// 学历要求
	void getEduLevel() async {
		EduLevelEntity eduLevelEntity = await NetUtils.getEduLevel(context);
		if(eduLevelEntity.statusCode==200&&eduLevelEntity.data!=null){
			_eduLevelList.clear();
			_eduLevelList.addAll(eduLevelEntity.data);
			setState(() {
			});
		}
	}

	/// 设置薪资
	setupSalary() {
		Navigator.push<SalaryResult>(
		   context,
		   MaterialPageRoute(
			  builder: (context) => CompanyJobSalary(minSalary: _minSalary,maxSalary: _maxSalary,))
		).then((value){
			if(value!=null){
				setState(() {
				  _minSalary=value.minSalary;
				  _maxSalary=value.maxSalary;
				});
			}
		});
	}

	/// 岗位状态
	chooseJobType() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_recruitTypePos = selPos;
							_recruitTypeId=_recruitList[selPos].id;
							_recruitType = _recruitList[selPos].type;
						});
					},
					title: '岗位状态',
					pickList: _recruitList.map((item)=>item.type).toList(),
					selIdx: _recruitTypePos,
				);
			},
		);
	}

	/// 岗位分类
	chooseJobClassify() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_classifyPos = selPos;
							_classifyId=_jobClassifyList[selPos].id;
							_classify = _jobClassifyList[selPos].type;
						});
					},
					title: '岗位分类',
					pickList: _jobClassifyList.map((item)=>item.type).toList(),
					selIdx: _classifyPos,
				);
			},
		);
	}

	/// 性别
	chooseSexType() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_sexPos = selPos;
							_sexId=_sexList[selPos].id;
							_sex = _sexList[selPos].type;
						});
					},
					title: '性别要求',
					pickList: _sexList.map((item)=>item.type).toList(),
					selIdx: _sexPos,
				);
			},
		);
	}

	/// 获取岗位详情
	_getResumeDetail(String id){
		BossMineModel.instance.getJobDetail(context, id).then((detail){
			if(detail!=null){
				_jobNameController.text=detail.job.jobName;
				_recruitNumController.text='${detail.job.recruitsTotal}';
				_candidateNumController.text='${detail.job.candidatesTotal}';

				for(var i=0; i< _recruitList.length;i++){
					if(int.parse(_recruitList[i].id)==detail.job.state) {
						_recruitType=_recruitList[i].type;
						_recruitTypeId=_recruitList[i].id;
						_recruitTypePos=i;
						break;
					}
				}

				for(var i=0; i< _sexList.length;i++){
					if(int.parse(_sexList[i].id)==detail.job.sex) {
						_sex=_sexList[i].type;
						_sexId=_sexList[i].id;
						_sexPos=i;
						break;
					}
				}

				for(var i=0; i< _jobClassifyList.length;i++){
					if(_jobClassifyList[i].type==detail.job.positionTypeName) {
						_classify=_jobClassifyList[i].type;
						_classifyId=_jobClassifyList[i].id;
						_classifyPos=i;
						break;
					}
				}

				setState(() {
					_workDateId=detail.job.workDateId;
					_workDate=detail.job.workDateName;
					_industryId=detail.job.industryId;
					_industryType=detail.job.industryName;
					_jobType=detail.job.positionName;
					_jobTypeId=detail.job.positionId;
					_eduId=detail.job.educationId;
					_eduLevel=detail.job.educationName;
					_minSalary=detail.job.minSalary;
					_maxSalary=detail.job.maxSalary;
					_candidatesCurrent=detail.job.candidatesCurrent;
					_candidatesTotal=detail.job.candidatesTotal;
					_jobContent=detail.job.jobContent;
					_cityId=detail.job.cityId;
					_city=detail.job.cityName;
					_workAddress=detail.job.workAddress;
					_tagList.clear();
					_tagList.addAll(detail.jobTags);
					_isLoad=false;
				});
			} else {
				Utils.showToast('岗位详情有误，请重试！');
				setState(() {
					_isLoad=false;
				});
			}
		});
	}

	/// 添加更新岗位
	_postJob() async {
		Map<String,dynamic> params={};
		List jobTags=[];
		Map<String,dynamic> job={};

		if(widget.jobId!=null&&widget.jobId.isNotEmpty){
			job['id']=widget.jobId;
		}
		if(widget.companyId!=null&&widget.companyId.isNotEmpty){
			job['companyId']=widget.companyId;
		}
		job['recruiterId']=Application.sp.get('recruiterId');
		job['realName']=widget.recruitName;
		job['jobName']=_jobNameController.text;
		job['jobContent']=_jobContent;
		job['workAddress']=_workAddress;
		job['minSalary']=_minSalary;
		job['maxSalary']=_maxSalary;
//		job['currency']=currency;
		job['industryId']=_industryId;
		job['positionId']=_jobTypeId;
//		job['AmericanState']=AmericanState;
		job['city']=_cityId;
//		job['longitude']=longitude;
//		job['latitude']=latitude;
		job['educationId']=_eduId;
		job['workDateId']=_workDateId;
		job['candidatesTotal']=_candidateNumController.text;
		job['recruitsTotal']=_recruitNumController.text;
		job['state']=_recruitTypeId;
		job['positionType']=_classifyId;
		job['sex']=_sexId;

		_tagList.forEach((item){
			Map<String,dynamic> params={};
			params['tagName']=item.tagName;
			params['state']='1';
			if(item.id!=null&&item.id.isNotEmpty){
				params['id']=item.id;
			}
			if(widget.jobId!=null&&widget.jobId.isNotEmpty){
				params['jobId']=widget.jobId;
			}
			jobTags.add(params);
		});

		params['jobTags']=jobTags;
		params['job']=job;

		print(json.encode(params));
		BaseRespEntity _baseEntity = await BossMineModel.instance.postJob(context,params);
		if (_baseEntity != null) {
			Utils.showToast(_baseEntity.msg??((widget.jobId!=null&&widget.jobId.isNotEmpty)?'修改成功':'添加成功'));
			Navigator.pop(context,'success');
		}
	}
}

class VDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
	    width: ScreenUtil().setWidth(1),
	    height: ScreenUtil().setHeight(54),
	    color: Color.fromRGBO(159,199,235,1),
    );
  }
	
}

class Item10 extends StatelessWidget {
	final String title;
	final String value;
	final VoidCallback onClick;
	
	Item10({this.title, this.value, this.onClick});
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
	    onTap: () {
				FocusScope.of(context).requestFocus(FocusNode());
				if(onClick != null) {
		        onClick();
	        }
	    },
	    child: Column(
		    children: <Widget>[
			    Text(title, style: TextStyle(
			       color: Color.fromRGBO(176,181,180,1),
			       fontSize: ScreenUtil().setSp(28),
			       fontWeight: FontWeight.w400
			    )),
			    SizedBox(height: ScreenUtil().setHeight(20)),
			    Text(value, style: TextStyle(
			       color: Color.fromRGBO(95,94,94,1),
			       fontSize: ScreenUtil().setSp(28),
			       fontWeight: FontWeight.w400
			    )),
		    ],
	    ),
    );
  }
}