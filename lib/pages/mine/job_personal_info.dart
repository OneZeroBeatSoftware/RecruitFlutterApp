import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_date_picker.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/widgets/craft_sex_picker.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() {
    // TODO: implement createState
    return _PersonalInfoState();
  }
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController _nameController;
  List<String> _eduLevelList = [];
  String _selSex = '请选择性别';
  String _selCity = '请选择现居住所在地';
  String _eduLevel = '请选择';
  int _eduPos = 0;
  DateTime _birthDate;
  DateTime _graduateDate;
  DateTime _workDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eduLevelList.add('高中');
    _eduLevelList.add('中专');
    _eduLevelList.add('大专');
    _eduLevelList.add('大学');
    _eduLevelList.add('研究生');

    _nameController = TextEditingController(text: '狐说');

    _birthDate=DateTime.now();
    _graduateDate=DateTime.now();
    _workDate=DateTime.now();
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
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(38),
                    bottom: ScreenUtil().setWidth(40),
                  ),
                  margin: EdgeInsets.only(
                    bottom: ScreenUtil().setWidth(40),
                  ),
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
                        child: Text(
                          '头像',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(57, 57, 57, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(16),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(54),
                        ),
                        child: Image.asset(
                          'images/avatar_15.png',
                          width: ScreenUtil().setWidth(108),
                          height: ScreenUtil().setWidth(108),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '姓名',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  controller: _nameController,
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
                    hintText: '请填写姓名',
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
                          child: Text('$_selSex',
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
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CityFilter())).then((value) {
                      if (value != null)
                        setState(() {
                          _selCity = value;
                        });
                    });
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
                          child: Text('$_selCity',
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
                              _eduLevel = _eduLevelList[selPos];
                            });
                          },
                          title: '学历',
                          pickList: _eduLevelList,
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
}
