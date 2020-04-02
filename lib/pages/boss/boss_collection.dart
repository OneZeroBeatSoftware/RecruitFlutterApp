import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';
import 'package:recruit_app/pages/boss/employee_star_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BossCollectionJob extends StatefulWidget {
    String title;
    
    BossCollectionJob({this.title = '收藏夹'});
    
  @override
  _BossCollectionJobSate createState() {
    // TODO: implement createState
    return _BossCollectionJobSate();
  }
}

class _BossCollectionJobSate extends State<BossCollectionJob> {
  List<Employee> _employeeList = EmployeeData.loadEmployees();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          widget.title,
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(children: <Widget>[
          Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                  if (index < _employeeList.length) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return   SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(116),
                          child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: EmployeeStarItem(
                                 employee: _employeeList[index],
                                 index: index,
                                 lastItem: index == _employeeList.length - 1),
                              onTap: () {
                                  Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => EmployeeDetail(),
                                     ));
                              },
                          ),
                          buttons: <Widget>[
                              buildAction(btnKey, Colors.red, () {
                                  btnKey.currentState.close();
                              }),
                          ],
                      );
                  }
                  return null;
              },
              itemCount: _employeeList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
          ),)
          
      ],),
    );
  }


  InkWell buildAction(
     GlobalKey<SlideButtonState> key, Color color, GestureTapCallback tap) {
      return InkWell(
          onTap: tap,
          child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(116),
              color: color,
              child: Image.asset(
                  'images/img_del_white.png',
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setWidth(38),
                  fit: BoxFit.contain,
              ),
          ),
      );
  }
  
}
