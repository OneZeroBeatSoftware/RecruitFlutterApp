import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/mine/industry_type.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_date_picker.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class JobProjectExp extends StatefulWidget {
  @override
  _JobProjectExpState createState() {
    // TODO: implement createState
    return _JobProjectExpState();
  }
}

class _JobProjectExpState extends State<JobProjectExp> {
  String _industryType='请选择所在行业';
  TextEditingController _projectController;
  TextEditingController _contentController;

  DateTime _starDate;
  DateTime _endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectController = TextEditingController();
    _contentController = TextEditingController();

    _starDate = DateTime.now();
    _endDate = DateTime.now();
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
          '项目经历',
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
                SizedBox(
                  height: ScreenUtil().setWidth(38),
                ),
                Text(
                  '项目名称',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  controller: _projectController,
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
                    hintText: '请填写项目名称',
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
                  '所在行业',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>IndustryType())).then((value){
                      if(value!=null)
                        setState(() {
                          _industryType=value;
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
                          child: Text('$_industryType',
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
                        SizedBox(width: ScreenUtil().setWidth(14)),
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
                  '项目周期',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(40)),
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
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CraftDatePicker(
                                  title: '开始时间',
                                  initialMonth: _starDate,
                                  confirm: (datetime) {
                                    Navigator.pop(context);
                                    setState(() {
                                      _starDate = datetime;
                                    });
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                              '${_starDate.year}-${_starDate.month < 10 ? ("0" + _starDate.month.toString()) : (_starDate.month)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                          behavior: HitTestBehavior.opaque,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(44),
                      ),
                      Text(
                        '—',
                        style: TextStyle(
                          color: Color.fromRGBO(95, 94, 94, 1),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(44),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CraftDatePicker(
                                  title: '结束时间',
                                  initialMonth: _endDate,
                                  confirm: (datetime) {
                                    Navigator.pop(context);
                                    setState(() {
                                      _endDate = datetime;
                                    });
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                              '${_endDate.year}-${_endDate.month < 10 ? ("0" + _endDate.month.toString()) : (_endDate.month)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Color.fromRGBO(95, 94, 94, 1))),
                          behavior: HitTestBehavior.opaque,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '工作内容',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  controller: _contentController,
                  autofocus: false,
                  maxLines: 5,
                  scrollPadding: EdgeInsets.all(0),
                  textAlign: TextAlign.start,
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
                    hintText: '请填写工作内容',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(80),
                ),
                MaterialButton(
                  elevation: 0,
                  color: Colors.white,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  textColor: Color.fromRGBO(159, 199, 235, 1),
                  child: Text(
                    "删除",
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
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
