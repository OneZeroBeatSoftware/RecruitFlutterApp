import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:recruit_app/widgets/menu_list_dialog.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/pages/boss/company_job_salary.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/company_job_key_word.dart';
import 'package:recruit_app/pages/boss/company_work_address.dart';


class CompanyPostRecruit extends StatefulWidget {

	final bool isADDMode;
	final String jobId;
	
	CompanyPostRecruit({this.isADDMode = true, this.jobId=''});
	
	@override
	_State createState() {
		// TODO: implement createState
		return _State();
	}
}

class _State extends State<CompanyPostRecruit> {
	bool _isLoad=false;
	BossJobDetailData _detailData;

	List<EduLevelData> _eduLevelList = [];
	String _eduLevel;
	String _eduId = '请选择';
	int _eduPos = 0;

	List<WorkDateData> _wordDateList = [];
	String _workDate;
	String _workDateId = '请选择';
	int _workDatePos = 0;

	String _industryType='请选择期望行业';
	String _industryId='';
	String _jobType='请选择期望岗位';
	String _jobTypeId='';

	@override
	void initState() {
		// TODO: implement initState
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
						  Text(widget.isADDMode? '发布招聘' : '岗位修改',
							 maxLines: 1,
							 overflow: TextOverflow.ellipsis,
							 style: TextStyle(
								fontSize: ScreenUtil().setSp(36),
								color: Color.fromRGBO(68, 77, 151, 1),
								fontWeight: FontWeight.bold)),
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
					 ProfileItem(title: "求职期望",
							 value: '平面设计师',
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
					 ProfileItem(title: "职业类型",
							 value: '广告/设计',
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
									 Item10(title: '薪资范围', value: '8-10k', onClick: () {
										 setupSalary();
									 },),
								 ],
							 ),

						 ],
					 ),
					 ProfileStyle.divider,
					 ProfileItem(title: "岗位描述",
							 value: '负责公司的日常平面设计及公司设计项目1',
							 onClick: () {
								 Navigator.push(
										 context,
										 MaterialPageRoute(
												 builder: (context) => JobDescribe()
										 )
								 );
							 }
					 ),
					 ProfileItem(title: "岗位关键字",
							 value: '设计',
							 onClick: () {
								 Navigator.push(
										 context,
										 MaterialPageRoute(
												 builder: (context) => CompanyJobKeyword()
										 )
								 );
							 }
					 ),
					 ProfileItem(title: "工作地点",
							 value: '福建福州市仓山区',
							 onClick: () {
								 Navigator.push(
										 context,
										 MaterialPageRoute(
												 builder: (context) => CompanyWorkAddress()
										 )
								 );
							 }
					 ),
					 Offstage(
							 offstage: widget.isADDMode,
							 child: Column(
								 children: <Widget>[
									 Item(
										 '候选人', '', canClick: true,
										 onClick: () {
											 Navigator.push(
													 context,
													 MaterialPageRoute(
															 builder: (context) => CompanyJobCandidate()
													 )
											 );
										 },
										 tailValue: '1/10',
										 topPadding: 3,
									 ),
									 ProfileStyle.divider,
								 ],
							 )
					 ),

					 Container(
						 margin: EdgeInsets.only(
								 top: ScreenUtil().setHeight(40),
								 bottom: ScreenUtil().setHeight(82)
						 ),
						 height: ScreenUtil().setHeight(72),
						 width: ScreenUtil().setWidth(652),
						 child: RaisedButton(
							 color: Color.fromRGBO(255,255,255,1),
							 child: Text(widget.isADDMode ? '修改' : '保存',
									 style: TextStyle(
											 color: Color.fromRGBO(159,199,235,1),
											 fontSize: ScreenUtil().setSp(32),
											 fontWeight: FontWeight.w300
									 )
							 ),
							 onPressed: () {
							 },
							 shape: RoundedRectangleBorder(
									 borderRadius: BorderRadius.all(Radius.circular(20)),
									 side: BorderSide(
											 color: Color.fromRGBO(159,199,235,1),
											 style: BorderStyle.solid,
											 width: ScreenUtil().setWidth(2)
									 )
							 ),
						 ),
					 )
				 ],
			 ),
		);
	}
	
	chooseWorkExperience() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_workDatePos = selPos;
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

	chooseEduExp() {
		showCupertinoModalPopup(
			context: context,
			builder: (context) {
				return CraftPicker(
					confirm: (selPos) {
						Navigator.pop(context);
						setState(() {
							_eduPos = selPos;
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
	
	setupSalary() {
		Navigator.push<String>(
		   context,
		   MaterialPageRoute(
			  builder: (context) => CompanyJobSalary())
		);
	}

	/// 获取岗位详情
	_getResumeDetail(String id){
		BossMineModel.instance.getJobDetail(context, id).then((detail){
			if(detail!=null){
				setState(() {
					_isLoad=false;
					_detailData=detail;
				});
			} else {
				Utils.showToast('岗位详情有误，请重试！');
				setState(() {
					_isLoad=false;
				});
			}
		});
	}
}

class CandidateItem extends StatelessWidget {
	
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
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