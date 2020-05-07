import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/model/file_model.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_date_picker.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/widgets/craft_sex_picker.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';
class PersonalInfoResult{
  String name;
  String avatar;
  int sex;
  DateTime birthDate;
  String address;
  DateTime graduateDate;
  String eduId;
  String eduName;
  String workExpId;
  String workExp;
  DateTime workDate;

  PersonalInfoResult(this.name, this.sex, this.birthDate, this.address,
      this.graduateDate, this.eduId, this.eduName, this.workDate,this.workExpId,this.workExp,this.avatar);
}
class PersonalInfo extends StatefulWidget {
  final ResumeDetailDataResume detailData;

  const PersonalInfo({Key key, this.detailData}) : super(key: key);
  @override
  _PersonalInfoState createState() {
    // TODO: implement createState
    return _PersonalInfoState();
  }
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController _nameController;
  TextEditingController _addressController;
  List<EduLevelData> _eduLevelList = [];
  List<WorkDateData> _wordDateList = [];
  String _avatar;
  String _selSex;
  String _workExpId='';
  String _workExp = '请选择';
  int _workPos=0;
  String _eduLevel = '请选择';
  String _eduId = '';
  int _eduPos = 0;
  DateTime _birthDate;
  DateTime _graduateDate;
  DateTime _workDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((i) {
      getEduLevel();
      getWorkDate();
    });

    if(widget.detailData!=null){
      _avatar=widget.detailData.avatar;
      _nameController = TextEditingController(text: widget.detailData.realName);
      _addressController= TextEditingController(text: widget.detailData.address);
      if(widget.detailData.sex!=-1){
        _selSex=(1==widget.detailData.sex)?"男":"女";
      }
      if(widget.detailData.educationId!=null&&widget.detailData.educationId.isNotEmpty){
        _eduId=widget.detailData.educationId;
        _eduLevel=widget.detailData.educationName;
      }

      if(widget.detailData.workDateId!=null&&widget.detailData.workDateId.isNotEmpty){
        _workExpId=widget.detailData.workDateId;
        _workExp=widget.detailData.workDateName;
      }

      _birthDate = DateTime.fromMillisecondsSinceEpoch(widget.detailData.birthDate);
      _graduateDate = DateTime.fromMillisecondsSinceEpoch(widget.detailData.graduationDate);
      _workDate = DateTime.fromMillisecondsSinceEpoch(widget.detailData.workExp);
    } else {
      _nameController = TextEditingController();
      _addressController = TextEditingController();

      _birthDate=DateTime.now();
      _graduateDate=DateTime.now();
      _workDate=DateTime.now();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_nameController != null) {
      _nameController.dispose();
    }
    if (_addressController != null) {
      _addressController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          FocusScope.of(context).requestFocus(FocusNode());
          showDialog(
              context: context,
              builder: (context) {
                return RemindDialog(
                  title: '退出，修改内容将不会保存',
                  titleColor: Color.fromRGBO(51, 51, 51, 1),
                  cancelText: '取消',
                  cancelColor: Color.fromRGBO(142, 190, 245, 1),
                  confirmText: '退出',
                  confirmColor: Color.fromRGBO(142, 190, 245, 1),
                  cancel: () {
                    Navigator.pop(context);
                  },
                  confirm: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              });
        },
        center: Text(
          '个人信息',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
//            if(null==_avatar||_avatar.isEmpty){
//              Utils.showToast('请选择头像');
//              return;
//            }
//            if(_nameController.text.isEmpty){
//              Utils.showToast('请填写名字');
//              return;
//            }
            if(null==_selSex||_selSex.isEmpty){
              Utils.showToast('请选择性别');
              return;
            }
            if(_addressController.text.isEmpty){
              Utils.showToast('请填写居住所在地');
              return;
            }
            if(null==_eduId||_eduId.isEmpty){
              Utils.showToast('请选择学历');
              return;
            }
            if(null==_workExpId||_workExpId.isEmpty){
              Utils.showToast('请选择工作经验');
              return;
            }
            Navigator.pop(context, PersonalInfoResult(
                _nameController.text,
                ("男" == _selSex) ? 1 : 0,
                _birthDate,
                _addressController.text,
                _graduateDate,
                _eduId,
                _eduLevel,
                _workDate,
                _workExpId,
                _workExp,
                _avatar));
          },
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              '保存',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: ScreenUtil().setSp(34),
                color: Color.fromRGBO(57, 57, 57, 1),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(48),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(
//                    top: ScreenUtil().setWidth(38),
//                    bottom: ScreenUtil().setWidth(40),
//                  ),
//                  margin: EdgeInsets.only(
//                    bottom: ScreenUtil().setWidth(40),
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border(
//                      bottom: BorderSide(
//                        color: Color.fromRGBO(159, 199, 235, 1),
//                        width: ScreenUtil().setWidth(1),
//                      ),
//                    ),
//                  ),
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Text(
//                          '头像',
//                          maxLines: 1,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(
//                            fontSize: ScreenUtil().setSp(32),
//                            fontWeight: FontWeight.bold,
//                            color: Color.fromRGBO(57, 57, 57, 1),
//                          ),
//                        ),
//                      ),
//                      SizedBox(
//                        width: ScreenUtil().setWidth(16),
//                      ),
//                      GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
//                        _openGallery();
//                      },child: ClipRRect(
//                        borderRadius: BorderRadius.circular(
//                          ScreenUtil().setWidth(54),
//                        ),
//                        child: NetImage(img: '$_avatar',placeholder: 'images/img_default_head.png',error: 'images/img_default_head.png',size: ScreenUtil().setWidth(108),),
//                      ),),
//                    ],
//                  ),
//                ),
//                Text(
//                  '姓名',
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                    fontSize: ScreenUtil().setSp(32),
//                    fontWeight: FontWeight.bold,
//                    color: Color.fromRGBO(57, 57, 57, 1),
//                  ),
//                ),
//                TextField(
//                  controller: _nameController,
//                  autofocus: false,
//                  scrollPadding: EdgeInsets.all(0),
//                  textAlign: TextAlign.start,
//                  maxLines: 1,
//                  cursorColor: Color.fromRGBO(176, 181, 180, 1),
//                  style: TextStyle(
//                      fontSize: ScreenUtil().setSp(28),
//                      color: Color.fromRGBO(95, 94, 94, 1)),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(
//                      top: ScreenUtil().setWidth(34),
//                      bottom: ScreenUtil().setWidth(34),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                        color: Color.fromRGBO(159, 199, 235, 1),
//                        width: ScreenUtil().setWidth(1),
//                      ),
//                    ),
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                        color: Color.fromRGBO(159, 199, 235, 1),
//                        width: ScreenUtil().setWidth(1),
//                      ),
//                    ),
//                    hintText: '请填写姓名',
//                    hintStyle: TextStyle(
//                      fontSize: ScreenUtil().setSp(28),
//                      color: Color.fromRGBO(176, 181, 180, 1),
//                    ),
//                  ),
//                  onSubmitted: (text) {},
//                ),
                SizedBox(
                  height: ScreenUtil().setWidth(40),
                ),
                Text(
                  '性别',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftSexPicker(
                          confirm: (sex){
                            if(sex!=null)
                              setState(() {
                                _selSex=sex;
                              });
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text(_selSex??'请选择性别',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                Text(
                  '出生年月',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftDatePicker(title: '出生年月',initialMonth: _birthDate,confirm: (datetime){
                          Navigator.pop(context);
                          setState(() {
                            _birthDate=datetime;
                          });
                        },);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text('${_birthDate.year}-${_birthDate.month<10?("0"+_birthDate.month.toString()):(_birthDate.month)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                Text(
                  '现居住所在地',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  controller: _addressController,
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
                    hintText: '请填写现居住所在地',
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
//                GestureDetector(
//                  onTap: () {
//                    FocusScope.of(context).requestFocus(FocusNode());
//
//                    Navigator.push<FilterData>(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => CityFilter(initId: _cityId,))).then((value) {
//                      if (value != null)
//                        setState(() {
//                          _cityId= value.filterId;
//                          _selCity = value.filterName;
//                        });
//                    });
//                  },
//                  child: Container(
//                    padding: EdgeInsets.symmetric(
//                        vertical: ScreenUtil().setWidth(40)),
//                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
//                    decoration: BoxDecoration(
//                      border: Border(
//                        bottom: BorderSide(
//                          color: Color.fromRGBO(159, 199, 235, 1),
//                          width: ScreenUtil().setWidth(1),
//                        ),
//                      ),
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text('$_selCity',
//                              maxLines: 1,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  wordSpacing: 1,
//                                  letterSpacing: 1,
//                                  fontSize: ScreenUtil().setSp(28),
//                                  color: Color.fromRGBO(95, 94, 94, 1))),
//                        ),
//                        SizedBox(
//                          width: ScreenUtil().setWidth(16),
//                        ),
//                        Image.asset(
//                          'images/img_arrow_right_blue.png',
//                          width: ScreenUtil().setWidth(10),
//                          height: ScreenUtil().setWidth(20),
//                          fit: BoxFit.cover,
//                        )
//                      ],
//                    ),
//                  ),
//                  behavior: HitTestBehavior.opaque,
//                ),
                Text(
                  '毕业时间',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftDatePicker(title: '毕业时间',initialMonth: _graduateDate,confirm: (datetime){
                          Navigator.pop(context);
                          setState(() {
                            _graduateDate=datetime;
                          });
                        },);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text('${_graduateDate.year}-${_graduateDate.month<10?("0"+_graduateDate.month.toString()):(_graduateDate.month)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                Text(
                  '学历',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftPicker(
                          confirm: (selPos) {
                            Navigator.pop(context);
                            setState(() {
                              _eduPos = selPos;
                              _eduId = _eduLevelList[selPos].id;
                              _eduLevel = _eduLevelList[selPos].educationName;
                            });
                          },
                          title: '学历',
                          pickList: _eduLevelList.map((item)=>item.educationName).toList(),
                          selIdx: _eduPos,
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text('$_eduLevel',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                Text(
                  '工作时间',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftDatePicker(title: '工作时间',initialMonth: _workDate,confirm: (datetime){
                          Navigator.pop(context);
                          setState(() {
                            _workDate=datetime;
                          });
                        },);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text('${_workDate.year}-${_workDate.month<10?("0"+_workDate.month.toString()):(_workDate.month)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                Text(
                  '工作经验',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CraftPicker(
                          confirm: (selPos) {
                            Navigator.pop(context);
                            setState(() {
                              _workPos = selPos;
                              _workExpId = _wordDateList[selPos].id;
                              _workExp = _wordDateList[selPos].workDateName;
                            });
                          },
                          title: '工作经验',
                          pickList: _wordDateList.map((item)=>item.workDateName).toList(),
                          selIdx: _workPos,
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(40)),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
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
                          child: Text('$_workExp',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
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
                  behavior: HitTestBehavior.opaque,
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(40),
                ),
              ],
            ),
          ),
        ),
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
}
