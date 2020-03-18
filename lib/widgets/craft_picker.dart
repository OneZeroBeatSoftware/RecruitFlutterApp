import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftPicker extends StatefulWidget {
  final String title;
  final List<String> pickList;
  final Function(int) confirm;
  final int selIdx;

  const CraftPicker(
      {Key key,
      this.title = '',
      @required this.pickList,
      @required this.confirm,
      this.selIdx = 0})
      : super(key: key);

  @override
  _CraftPickerState createState() => _CraftPickerState();
}

class _CraftPickerState extends State<CraftPicker> {
  ScrollController _controller;
  int _selPos=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FixedExtentScrollController(initialItem: widget.selIdx);
    _selPos=widget.selIdx;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
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
                          widget.confirm(_selPos);
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
                      child: ListWheelScrollView.useDelegate(
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        itemExtent: ScreenUtil().setWidth(76),
                        onSelectedItemChanged: (index) {
                          _selPos=index;
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                widget.pickList[index],
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
                          childCount: widget.pickList.length,
                        ),
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
