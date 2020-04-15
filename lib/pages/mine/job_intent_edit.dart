import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/entity/intent_list_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/pages/mine/job_type.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class JobIntentEdit extends StatefulWidget {
  final bool isModify;
  final IntentListData intentData;
  final String limit;

  const JobIntentEdit({Key key, this.intentData, this.limit, this.isModify=false}) : super(key: key);

  @override
  _JobIntentEditState createState() {
    // TODO: implement createState
    return _JobIntentEditState();
  }
}

class _JobIntentEditState extends State<JobIntentEdit> {
  String _selCity='请选择期望城市';
  String _jobType='请选择期望岗位';
  String _industryType='请选择期望行业';
  String _cityId='';
  String _jobTypeId='';
  String _industryId='';
  TextEditingController _minSalaryController;
  TextEditingController _maxSalaryController;

  @override
  void initState() {
    // TODO: implement initState
    if(widget.intentData!=null){
      _cityId=widget.intentData.cityId;
      _selCity=widget.intentData.cityName;
      _jobTypeId=widget.intentData.positionId;
      _jobType=widget.intentData.positionName;
      _industryId=widget.intentData.industryId;
      _industryType=widget.intentData.industryName;
      _minSalaryController=TextEditingController(text: widget.intentData.minSalary);
      _maxSalaryController=TextEditingController(text: widget.intentData.maxSalary);
    }else {
      _minSalaryController=TextEditingController();
      _maxSalaryController=TextEditingController();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_minSalaryController!=null){
      _minSalaryController.dispose();
    }
    if(_maxSalaryController!=null){
      _maxSalaryController.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          showDialog(
              context: context,
              builder: (context) {
                return RemindDialog(
                  title: '退出，${widget.isModify?"修改":"添加"}内容将不会保存',
                  titleColor: Color.fromRGBO(51, 51, 51, 1),
                  cancelText: '取消',
                  cancelColor: Color.fromRGBO(142, 190, 245, 1),
                  confirmText: '退出',
                  confirmColor: Color.fromRGBO(142, 190, 245, 1),
                  cancel: (){
                    Navigator.pop(context);
                  },
                  confirm: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              });
        },
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(48),
                  right: ScreenUtil().setWidth(48),
                  top: ScreenUtil().setWidth(54),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text('${widget.isModify?'修改':'添加'}求职期望',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 2,
                                  letterSpacing: 2,
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(20, 20, 20, 1))),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(16)),
                        Text(
                          '${widget.limit}',
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: ScreenUtil().setSp(32),
                              color: Color.fromRGBO(95, 94, 94, 1)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(14),
                    ),
                    Text(
                      '不同的求职期望，推荐的岗位也会不同',
                      style: TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                        fontSize: ScreenUtil().setSp(28),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(16),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(40),
                            bottom: ScreenUtil().setWidth(15)),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              width: ScreenUtil().setWidth(1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '期望岗位',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(32)),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setWidth(26),
                                  ),
                                  Text(
                                    '$_jobType',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(176, 181, 180, 1),
                                        fontSize: ScreenUtil().setSp(28)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Image.asset(
                              'images/img_arrow_right_blue.png',
                              width: ScreenUtil().setWidth(10),
                              height: ScreenUtil().setWidth(20),
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push<FilterData>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobType(initId:  _jobTypeId,))).then((value){
                          if(value!=null)
                            setState(() {
                              _jobTypeId=value.filterId;
                              _jobType=value.filterName;
                            });
                        });
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(40),
                            bottom: ScreenUtil().setWidth(15)),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              width: ScreenUtil().setWidth(1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '期望行业',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(32)),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setWidth(26),
                                  ),
                                  Text(
                                    '$_industryType',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(176, 181, 180, 1),
                                        fontSize: ScreenUtil().setSp(28)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Image.asset(
                              'images/img_arrow_right_blue.png',
                              width: ScreenUtil().setWidth(10),
                              height: ScreenUtil().setWidth(20),
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push<FilterData>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndustryType(initId: _industryId,))).then((value){
                          if(value!=null)
                            setState(() {
                              _industryId=value.filterId;
                              _industryType=value.filterName;
                            });
                        });
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(40),
                            bottom: ScreenUtil().setWidth(15)),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              width: ScreenUtil().setWidth(1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '工作城市',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(32)),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setWidth(26),
                                  ),
                                  Text(
                                    '$_selCity',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(176, 181, 180, 1),
                                        fontSize: ScreenUtil().setSp(28)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Image.asset(
                              'images/img_arrow_right_blue.png',
                              width: ScreenUtil().setWidth(10),
                              height: ScreenUtil().setWidth(20),
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push<FilterData>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityFilter(initId: _cityId,))).then((value){
                          if (value != null)
                            setState(() {
                              _cityId=value.filterId;
                              _selCity = value.filterName;
                            });
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(40),
                          bottom: ScreenUtil().setWidth(15)),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(1),
                          ),
                        ),
                      ),
                      child: Column(
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
                                  controller: _minSalaryController,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
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
                                  controller: _maxSalaryController,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(80),
                    ),
                    MaterialButton(
                      elevation: 0,
                      color: Colors.white,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if(_jobTypeId==null||_jobTypeId.isEmpty){
                          Utils.showToast('请选择期望岗位');
                          return;
                        }
                        if(_industryId==null||_industryId.isEmpty){
                          Utils.showToast('请选择期望行业');
                          return;
                        }
                        if(_cityId==null||_cityId.isEmpty){
                          Utils.showToast('请选择城市');
                          return;
                        }
                        if(_minSalaryController.text.isEmpty){
                          Utils.showToast('请填写最少工资');
                          return;
                        }
                        if(_maxSalaryController.text.isEmpty){
                          Utils.showToast('请填写最多工资');
                          return;
                        }
                        _saveIntent(_minSalaryController.text,_maxSalaryController.text);
                      },
                      textColor: Color.fromRGBO(159, 199, 235, 1),
                      child: Text(
                        '${widget.isModify?"修改":"保存"}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30),
                        vertical: ScreenUtil().setWidth(20),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(2),
                          ),
                          borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(1000))),
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(80),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _saveIntent(String minSalary,String maxSalary) async {
    BaseRespEntity _baseEntity = await MineModel.instance
        .saveIntent(context,Application.sp.getString('jobSeekerId'),_jobTypeId,_industryId,_cityId,minSalary,maxSalary,intentId: widget.intentData?.id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??(widget.intentData!=null?'修改成功':'添加成功'));
      Navigator.pop(context,'success');
    }
  }
}
