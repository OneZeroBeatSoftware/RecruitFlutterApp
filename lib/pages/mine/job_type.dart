import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/job_type_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class JobType extends StatefulWidget {
  @override
  _JobTypeState createState() => _JobTypeState();
}

class _JobTypeState extends State<JobType> {
  List<JobTypeData> _list = [];
  int _maxNum = 5;
  int _selNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _getAllJobType();
    });
  }

  @override
  Widget build(BuildContext context) {
    double wrapWidth=(ScreenUtil.screenWidthDp-ScreenUtil().setWidth(96)-ScreenUtil().setWidth(36))/3;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '岗位类型',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              '确定',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
              top: ScreenUtil().setWidth(20),
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/img_search_blue.png',
                  width: ScreenUtil().setWidth(26),
                  height: ScreenUtil().setWidth(26),
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  height: ScreenUtil().setWidth(24),
                  width: ScreenUtil().setWidth(2),
                  color: Color.fromRGBO(159, 199, 235, 1),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    scrollPadding: EdgeInsets.all(0),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    cursorColor: Color.fromRGBO(176, 181, 180, 1),
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Color.fromRGBO(95, 94, 94, 1)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                      hintText: '输入岗位名称',
                      hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Color.fromRGBO(194, 203, 202, 1),
                      ),
                    ),
                    onSubmitted: (text) {},
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Text(
                  '已选$_selNum/$_maxNum',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Color.fromRGBO(95, 94, 94, 1),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(2),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(42),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
              ),
              child: Wrap(
                spacing: ScreenUtil().setWidth(18),
                runSpacing: ScreenUtil().setWidth(20),
                children: _list.map(
                  (item) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!item.isChecked) {
                          if (_selNum < _maxNum) {
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (context, animation1, animation2) {
                                  return null;
                                },
                                barrierColor: Colors.black.withOpacity(0.4),
                                barrierDismissible: true,
                                barrierLabel: "Dismiss",
                                transitionDuration: Duration(milliseconds: 300),
                                transitionBuilder:
                                    (context, animation1, animation2, widget) {
                                  final curvedValue = Curves.easeInOut
                                          .transform(animation1.value) -
                                      1.0;
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                        0.0, curvedValue * -300, 0.0),
                                    child: Opacity(
                                      opacity: animation1.value,
                                      child: ListMenuDialog(
                                        title: item.type,
                                        cancel: () {
                                          Navigator.pop(context);
                                        },
                                        confirm: () {
                                          Navigator.pop(context);
                                        },
                                        itemSelected: (index) {
                                          setState(() {
                                            _selNum++;
                                            item.isChecked = true;
                                          });
                                          Navigator.pop(context);
                                        },
                                        lists: item.subType.map((item)=>item.subType).toList(),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            Utils.showToast('最多选择$_maxNum个岗位类别');
                          }
                        } else {
                          if (_selNum > 0) {
                            setState(() {
                              _selNum--;
                              item.isChecked = false;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: wrapWidth,
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
                            color: item.isChecked
                                ? Color.fromRGBO(68, 77, 151, 1)
                                : Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(2),
                          ),
                        ),
                        child: Text(
                          item.type,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: item.isChecked
                                ? Color.fromRGBO(68, 77, 151, 1)
                                : Color.fromRGBO(159, 199, 235, 1),
                            fontSize: ScreenUtil().setSp(28),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 获取全部工作类型
  _getAllJobType() async {
    JobTypeEntity jobTypeEntity = await NetUtils.getAllJobType(context);
    if (jobTypeEntity != null && jobTypeEntity.statusCode == 200) {
      jobTypeEntity.data.forEach((item){
        item.isChecked=false;
      });
      _list.clear();
      _list.addAll(jobTypeEntity.data);
      setState(() {
      });
    } else {
      Utils.showToast(jobTypeEntity.msg??'暂未获取到行业信息');
    }
  }
}
