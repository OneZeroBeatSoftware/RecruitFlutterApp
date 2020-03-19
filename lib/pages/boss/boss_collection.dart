import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
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
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 38, 39, 1))),
        leading: IconButton(
            icon: Image.asset(
              'images/ic_back_arrow.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
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
