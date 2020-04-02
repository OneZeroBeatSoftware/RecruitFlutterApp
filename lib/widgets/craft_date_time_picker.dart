import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftDateTimePicker extends StatefulWidget {
  final String title;
  final DateTime initialTime;
  final bool isHaveDate;
  final bool isHaveTime;
  final Function(DateTime) confirm;

  const CraftDateTimePicker({
    Key key,
    this.initialTime,
    this.title = '',
    @required this.confirm, this.isHaveDate=true, this.isHaveTime=true,
  }) : super(key: key);

  @override
  _CraftDateTimePickerState createState() => _CraftDateTimePickerState();
}

class _CraftDateTimePickerState extends State<CraftDateTimePicker> {
  List<Widget> contentWidget=[];
  
  List<String> _years = [];
  List<String> _months = [];
  List<String> _days = [];
  List<String> _hours = [];
  List<String> _minutes = [];

  ScrollController _yearController;
  ScrollController _monthController;
  ScrollController _dayController;
  ScrollController _hourController;
  ScrollController _minController;

  DateTime _nowTime;
  int _yearPos = 0;
  int _monthPos = 0;
  int _dayPos = 0;
  int _hourPos = 0;
  int _minPos = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nowTime = DateTime.now();
    for (int year = _nowTime.year - 59; year < _nowTime.year + 61; year++) {
      if (year == widget.initialTime.year) {
        _yearPos = year - _nowTime.year + 59;
      }
      _years.add(year.toString());
    }

    for (int month = 1; month < 13; month++) {
      if (month == widget.initialTime.month) {
        _monthPos = month - 1;
      }
      _months.add(month.toString());
    }

    for (int day = 1; day < 32; day++) {
      if (day == widget.initialTime.day) {
        _dayPos = day - 1;
      }
      _days.add(day.toString());
    }

    for (int hour = 0; hour < 24; hour++) {
      if (hour == widget.initialTime.hour) {
        _hourPos = hour;
      }
      _hours.add(hour.toString());
    }

    for (int min = 0; min < 60; min++) {
      if (min == widget.initialTime.minute) {
        _minPos = min;
      }
      _minutes.add(min.toString());
    }
    _yearController = FixedExtentScrollController(initialItem: _yearPos);
    _monthController = FixedExtentScrollController(initialItem: _monthPos);
    _dayController = FixedExtentScrollController(initialItem: _dayPos);
    _hourController = FixedExtentScrollController(initialItem: _hourPos);
    _minController = FixedExtentScrollController(initialItem: _minPos);

    if(widget.isHaveDate){
      contentWidget.add(buildYear());
      contentWidget.add(buildMonth());
      contentWidget.add(buildDate());
    }
    if(widget.isHaveTime){
      contentWidget.add(buildHour());
      contentWidget.add(buildMinute());
    }
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
    if (_dayController != null) {
      _dayController.dispose();
    }
    if (_hourController != null) {
      _hourController.dispose();
    }
    if (_minController != null) {
      _minController.dispose();
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
                        if (widget.confirm != null) {
                          widget.confirm(DateTime(int.parse(_years[_yearPos]),
                              int.parse(_months[_monthPos]),int.parse(_days[_dayPos]),int.parse(_hours[_hourPos]),int.parse(_minutes[_minPos]),),);
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
                        children: contentWidget,
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

  /// 创建分
  Widget buildMinute() {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: BouncingScrollPhysics(),
        controller: _minController,
        itemExtent: ScreenUtil().setWidth(76),
        onSelectedItemChanged: (index) {
          _minPos = index;
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${_minutes[index]}分',
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
          childCount: _minutes.length,
        ),
      ),
    );
  }

  /// 创建时
  Expanded buildHour() {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: BouncingScrollPhysics(),
        controller: _hourController,
        itemExtent: ScreenUtil().setWidth(76),
        onSelectedItemChanged: (index) {
          _hourPos = index;
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${_hours[index]}时',
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
          childCount: _hours.length,
        ),
      ),
    );
  }

  ///创建日
  Expanded buildDate() {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: BouncingScrollPhysics(),
        controller: _dayController,
        itemExtent: ScreenUtil().setWidth(76),
        onSelectedItemChanged: (index) {
          _dayPos = index;
          isLegalDay();
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${_days[index]}日',
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
          childCount: _days.length,
        ),
      ),
    );
  }

  /// 创建月
  Expanded buildMonth() {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: BouncingScrollPhysics(),
        controller: _monthController,
        itemExtent: ScreenUtil().setWidth(76),
        onSelectedItemChanged: (index) {
          _monthPos = index;
          isLegalDay();
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${_months[index]}月',
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
    );
  }

  /// 创建年
  Expanded buildYear() {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: BouncingScrollPhysics(),
        controller: _yearController,
        itemExtent: ScreenUtil().setWidth(76),
        onSelectedItemChanged: (index) {
          _yearPos = index;
          isLegalDay();
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${_years[index]}年',
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
    );
  }

  /// 中间横线
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

  /// 年月日滚动时对当前选中日期是否合法判断
  void isLegalDay() {
    int maxDay =
        dayOfMonth(int.parse(_years[_yearPos]), int.parse(_months[_monthPos]));
    if (int.parse(_days[_dayPos]) > maxDay) {
      animatedToItem(_dayController, maxDay - 1, ScreenUtil().setWidth(76));
    }
  }

  /// 每月最大天数
  int dayOfMonth(int year, int month) {
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      case 2:
        return DateUtil.isLeapYearByYear(year) ? 29 : 28;
      default:
        return 31;
    }
  }

  /// 滚动到指定item
  void animatedToItem(ScrollController controller, int pos, double itemExtent) {
    if (controller == null) {
      return;
    }

    controller.animateTo(
      pos * itemExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
