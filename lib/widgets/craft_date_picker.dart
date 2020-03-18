import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftDatePicker extends StatefulWidget {
  final String title;
  final DateTime initialMonth;
  final Function(DateTime) confirm;

  const CraftDatePicker({
    Key key,
    this.initialMonth, this.title='', @required this.confirm,
  }) : super(key: key);

  @override
  _CraftDatePickerState createState() => _CraftDatePickerState();
}

class _CraftDatePickerState extends State<CraftDatePicker> {
  List<String> _years = [];
  List<String> _months = [];
  ScrollController _yearController;
  ScrollController _monthController;
  DateTime _nowTime;
  int _yearPos=0;
  int _monthPos=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nowTime=DateTime.now();
    for (int year = _nowTime.year-59; year < _nowTime.year+61; year++) {
      if(year==widget.initialMonth.year){
        _yearPos=year-_nowTime.year+59;
      }
      _years.add(year.toString());
    }

    for (int month = 1; month < 13; month++) {
      if(month==widget.initialMonth.month){
        _monthPos=month-1;
      }
      _months.add(month.toString());
    }
    _yearController = FixedExtentScrollController(initialItem: _yearPos);
    _monthController = FixedExtentScrollController(initialItem: _monthPos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_yearController != null) {
      _yearController.dispose();
    }
    if (_monthController != null) {
      _monthController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: ScreenUtil().setWidth(446),
        decoration: BoxDecoration(
          color: Color.fromRGBO(162, 198, 238, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
            topRight: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
              ),
              height: ScreenUtil().setWidth(144),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'images/img_cancel_white.png',
                        width: ScreenUtil().setWidth(35),
                        height: ScreenUtil().setWidth(35),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if(widget.confirm!=null){
                          widget.confirm(DateTime(int.parse(_years[_yearPos]),int.parse(_months[_monthPos])));
                        }
                      },
                      child: Text(
                        '确定',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(2),
              color: Colors.white,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(48),
                      ),
                      color: Color.fromRGBO(159, 199, 235, 1),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              physics: BouncingScrollPhysics(),
                              controller: _yearController,
                              itemExtent: ScreenUtil().setWidth(76),
                              onSelectedItemChanged: (index) {
                                _yearPos=index;
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _years[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(32),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                                childCount: _years.length,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              physics: BouncingScrollPhysics(),
                              controller: _monthController,
                              itemExtent: ScreenUtil().setWidth(76),
                              onSelectedItemChanged: (index) {
                                _monthPos=index;
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _months[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(32),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                                childCount: _months.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildMagnifierScreen(ScreenUtil().setWidth(76)),
                ],
              ),
            ),
          ],
        ),
      ),
      type: MaterialType.transparency,
    );
  }

  Widget _buildMagnifierScreen(itemExtent) {
    return IgnorePointer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.0, color: Colors.white),
                bottom: BorderSide(width: 0.0, color: Colors.white),
              ),
            ),
            constraints: BoxConstraints.expand(
              height: itemExtent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
