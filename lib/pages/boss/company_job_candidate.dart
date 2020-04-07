import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employe_row_item.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class CompanyJobCandidate extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return _CandidateState();
  }
}

class _CandidateState extends State<CompanyJobCandidate> {
    List<Employee> _employeeList = EmployeeData.loadEmployees();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
       appBar: CommonAppBar(
         leading: 'images/img_arrow_left_black.png',
         leftListener: () {
           Navigator.pop(context);
         },
         center: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(7),
                ),
                Text('候选人',
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                      fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 3,
                ),
              ],
            )),
         backgroundColor: Color.fromRGBO(255, 255, 255, 1),
         rightAction: Container(
           margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
           child: GestureDetector(
             onTap: () {
               Navigator.pop(context);
             },
             child: Text("",
               style: TextStyle(
                  color: Color.fromRGBO(57,57,57,1),
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.bold
               ),
             ),
           ),
         
         ),
       ),
       body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
               Container(
                   height: ScreenUtil().setWidth(1),
                   color: Color.fromRGBO(245, 245, 245, 1),
               ),
               Expanded(
                   child: CustomScrollView(
                       physics: BouncingScrollPhysics(),
                       slivers: <Widget>[
                           SliverList(
                              delegate:
                              SliverChildBuilderDelegate((context, index) {
                                  if (index < _employeeList.length) {
                                      var key = GlobalKey<SlideButtonState>();
                                      return GestureDetector(
                                         behavior: HitTestBehavior.opaque,
                                         child:   SlideButton(
                                             key: key,
                                             singleButtonWidth: ScreenUtil().setWidth(116),
                                             child: Container(
                                                 color: Colors.white,
                                                 child: Candidate( _employeeList[index],index,index == _employeeList.length - 1),
                                             ),
                                             buttons: <Widget>[
                                                 buildAction(key, Colors.red, () {
                                                     key.currentState.close();
                                                 }),
                                             ],
                                         ),
                                         onTap: () {
                                             Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => EmployeeDetail(),
                                                ));
                                         }
                                         );
                                  }
                                  return null;
                              },
                                 childCount: _employeeList.length)),
                       ],
                   ),
               ),
           ],
       ));
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

class Candidate extends StatelessWidget {
    final Employee employee;
    final int index;
    final bool isLast;
    
    Candidate(this.employee, this.index, this.isLast);

    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
            EmployeeRowItem(
               employee: employee,
               index: index,
               lastItem: isLast,
               onCommunicateClick: () {
                   showDialog(
                      context: context,
                       child: AlertDialog(
                           content: Text('进行沟通'),
                       )
                   );
               }),
            Padding(
                padding: EdgeInsets.only(
                   left: ScreenUtil().setWidth(48),
                   top: ScreenUtil().setHeight(18),
                   bottom: ScreenUtil().setHeight(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            '2020年1月2好11:28完成面试',
                            style: TextStyle(
                               color: Color.fromRGBO(194,203,202,1),
                               fontSize: ScreenUtil().setHeight(22),
                               fontWeight: FontWeight.w300,
                               letterSpacing: 1
                            ),
                        ),
                    ],
                ),
            ),
            Container(
                color: Color.fromRGBO(245,245,245,1),
                height: ScreenUtil().setHeight(6)
            )
        ],
    );
  }
  
  
  
}


