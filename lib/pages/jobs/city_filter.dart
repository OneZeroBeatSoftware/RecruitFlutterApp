import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/city_entity.dart';
import 'package:recruit_app/model/job_filter_data.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';
import 'package:recruit_app/pages/jobs/job_filter_item.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CityFilter extends StatefulWidget {
  @override
  _CityFilterState createState() => _CityFilterState();
}

class _CityFilterState extends State<CityFilter> {
  var _cityFilterData = [];

//  var letterFilterData = List<LetterFilterData>();
  final ScrollController _scrollController = ScrollController();

//  GlobalKey stackKey = GlobalKey(debugLabel: 'stackCity');
  List<String> _area=[];

  @override
  void initState() {
//    _cityFilterData.forEach((item) {
//      letterFilterData.add(LetterFilterData(
//          key: GlobalKey(debugLabel: item.filterName),
//          letter: item.filterName));
//    });
    super.initState();
    for (int i = 0; i < 20; i++) {
      _area.add('奥兰治县');
    }
    WidgetsBinding.instance.addPostFrameCallback((call){
      getCity();
    });
  }

  @override
  void dispose() {
    if (_scrollController != null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '选择城市',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        rightAction: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(46)),
            child: Text(
              '确定',
              style: TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1),
                fontSize: ScreenUtil().setSp(32),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                vertical: ScreenUtil().setWidth(24),
                horizontal: ScreenUtil().setWidth(48)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "定位城市",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      color: Color.fromRGBO(57, 57, 57, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(12),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: ScreenUtil().setWidth(204),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/img_search_blue.png',
                          width: ScreenUtil().setWidth(26),
                          height: ScreenUtil().setWidth(26),
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                          child: Text(
                            "｜请输入城市名称",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Color.fromRGBO(159, 199, 235, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                      vertical: ScreenUtil().setWidth(10),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(2),
                        ),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(1000))),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
//              _cityFilterData.forEach((item1) {
//                item1.filterSubData.forEach((item2) {
//                  if (item2.isChecked &&
//                      item2.filterName != '洛杉矶') {
//                    setState(() {
//                      item2.isChecked = false;
//                    });
//                  }
//                });
//              });
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation1, animation2) { return null;},
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: true,
                barrierLabel: "Dismiss",
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, animation1, animation2, widget) {
                  final curvedValue =
                      Curves.easeInOut.transform(animation1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
                    child: Opacity(
                      opacity: animation1.value,
                      child: ListMenuDialog(
                        title: '洛杉矶',
                        cancel: () {
                          Navigator.pop(context);
                        },
                        confirm: () {
                          Navigator.pop(context);
                        },
                        itemSelected: (index){
                          Navigator.pop(context);
                        },
                        lists: _area,
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48)),
              width: ScreenUtil().setWidth(206),
              height: ScreenUtil().setWidth(50),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(
                  ScreenUtil().setWidth(18),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(1000),
                ),
                border: Border.all(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(2),
                ),
              ),
              child: Text(
                '洛杉矶',
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
              top: ScreenUtil().setWidth(24),
            ),
            height: ScreenUtil().setWidth(2),
            color: Color.fromRGBO(159, 199, 235, 1),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                ListView.builder(
//                  key: stackKey,
                  controller: _scrollController,
                  itemBuilder: (cxt, idx) {
                    if (idx < _cityFilterData.length) {
                      return JobFilterItem(
//                        key: letterFilterData[idx].key,
                        jobFilterData: _cityFilterData[idx],
                        index: idx,
                        lastItem: idx == _cityFilterData.length - 1,
                        onTap: (item) {
                          _cityFilterData.forEach((item1) {
                            item1.filterSubData.forEach((item2) {
                              if (item2.isChecked &&
                                  item2.filterName != item.filterName) {
                                setState(() {
                                  item2.isChecked = false;
                                });
                              }
                            });
                          });
                          setState(() {
                            item.isChecked = !item.isChecked;
                          });

                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, animation1, animation2) {return null;},
                            barrierColor: Colors.black.withOpacity(0.4),
                            barrierDismissible: true,
                            barrierLabel: "Dismiss",
                            transitionDuration: Duration(milliseconds: 300),
                            transitionBuilder:
                                (context, animation1, animation2, widget) {
                              final curvedValue =
                                  Curves.easeInOut.transform(animation1.value) -
                                      1.0;
                              return Transform(
                                transform: Matrix4.translationValues(
                                    0.0, curvedValue * -300, 0.0),
                                child: Opacity(
                                  opacity: animation1.value,
                                  child: ListMenuDialog(
                                    title: item.filterName,
                                    cancel: () {
                                      Navigator.pop(context);
                                    },
                                    confirm: () {
                                      Navigator.pop(context);
                                    },
                                    itemSelected: (index){
                                      Navigator.pop(context);
                                      Navigator.pop(context,item.filterName);
                                    },
                                    lists: _area,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return null;
                  },
                  itemCount: _cityFilterData.length,
                  physics: BouncingScrollPhysics(),
                ),
//                Align(
//                  alignment: Alignment.centerRight,
//                  child: ConstrainedBox(
//                    constraints: BoxConstraints(
//                      maxWidth: ScreenUtil().setWidth(48),
//                    ),
//                    child: ListView.builder(
//                      shrinkWrap: true,
//                      itemBuilder: (cxt, idx) {
//                        if (idx < letterFilterData.length) {
//                          return GestureDetector(
//                            behavior: HitTestBehavior.opaque,
//                            onTap: () {
//                              RenderBox box = letterFilterData[idx].key.currentContext.findRenderObject();
//                              Offset item = box.localToGlobal(Offset.zero,ancestor: stackKey.currentContext.findRenderObject());
//
//                              double offset =
//                                  _scrollController.offset + item.dy;
//                              _scrollController.animateTo(
//                                  offset >
//                                          _scrollController
//                                              .position.maxScrollExtent
//                                      ? _scrollController
//                                          .position.maxScrollExtent
//                                      : offset,
//                                  duration: Duration(milliseconds: 200),
//                                  curve: Curves.easeInOut);
//                            },
//                            child: Container(
//                              alignment: Alignment.center,
//                              width: ScreenUtil().setWidth(48),
//                              padding: EdgeInsets.symmetric(
//                                vertical: ScreenUtil().setWidth(6),
//                              ),
//                              child: Text(
//                                letterFilterData[idx].letter,
//                                style: TextStyle(
//                                  fontSize: ScreenUtil().setSp(16),
//                                  color: Color.fromRGBO(176, 181, 180, 1),
//                                ),
//                              ),
//                            ),
//                          );
//                        }
//                        return null;
//                      },
//                      itemCount: letterFilterData.length,
//                      physics: NeverScrollableScrollPhysics(),
//                    ),
//                  ),
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getCity() async {
    CityEntity cityEntity = await NetUtils.getCityList(context);
    if (cityEntity.statusCode==200&&cityEntity.data != null) {
      cityEntity.data.forEach((item){
        _cityFilterData.add(JobFilterData(
            filterName: item.initial,
            filterSubData: item.cities
                .map((subItem) => JobFilterSubData(
                filterName: subItem.cityName, isChecked: false))
                .toList()));
      });

      setState(() {
        // ignore: unnecessary_statements
        _cityFilterData;
      });
    }
  }
}

//class LetterFilterData {
//  GlobalKey key;
//  String letter;
//
//  LetterFilterData({this.key, this.letter});
//}
