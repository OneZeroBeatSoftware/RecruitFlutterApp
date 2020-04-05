import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeRowItem extends StatelessWidget {
  final Employee employee;
  final int index;
  final bool lastItem;
  final VoidCallback onCommunicateClick;

  const EmployeeRowItem({Key key, this.employee, this.index, this.lastItem, this.onCommunicateClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeItem = Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48), vertical: ScreenUtil().setWidth(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(22)),
                    child: Image.asset(
                      'images/avatar_${index % 16 + 1}.png',
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setWidth(44),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox.fromSize(size: Size(ScreenUtil().setWidth(12), ScreenUtil().setHeight(12))),
                  Container(
                    child:Text(
                      employee.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                         fontSize: ScreenUtil().setSp(36),
                         fontWeight: FontWeight.w500,
                         color: Color.fromRGBO(20,20,20,1)),
                    ),
                    constraints: BoxConstraints(minWidth: ScreenUtil().setWidth(50), maxWidth: ScreenUtil().setWidth(350)),
                    
                  ),
                  SizedBox.fromSize(size: Size(ScreenUtil().setWidth(12), ScreenUtil().setHeight(12))),
                  Text(
                    "在线",
                    style: TextStyle(
                       fontSize: ScreenUtil().setSp(24),
                       fontWeight: FontWeight.w300,
                       color: Color.fromRGBO(176,181,180,1)),
                  ),
                
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(16), left: ScreenUtil().setWidth(56)),
                child:Text(
                  employee.pos,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                     fontSize: ScreenUtil().setSp(32),
                     fontWeight: FontWeight.w500,
                     color: Color.fromRGBO(57,57,57,1)),
                ),
                constraints: BoxConstraints(minWidth: ScreenUtil().setWidth(150), maxWidth: ScreenUtil().setWidth(350)),
              
              ),
              SizedBox.fromSize(size: Size(ScreenUtil().setWidth(1), ScreenUtil().setWidth(10))),
              Container(height: ScreenUtil().setHeight(36), child:
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                    ),
                    Text(
                      '男',
                      style: TextStyle(
                         fontSize: ScreenUtil().setSp(26),
                         fontWeight: FontWeight.w300,
                         color: Color.fromRGBO(95,94,94,1)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                    ),
                    Container(color: Color.fromRGBO(127, 127, 127, 1),
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(1)
                    )
                    ,
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                    ),
                    Text(
                      '5年经验',
                      style: TextStyle(
                         fontSize: ScreenUtil().setSp(26),
                         fontWeight: FontWeight.w300,
                         color: Color.fromRGBO(95,94,94,1)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                    ),
                    Container(color: Color.fromRGBO(127, 127, 127, 1),
                       height: ScreenUtil().setHeight(20),
                       width: ScreenUtil().setWidth(1)
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                    ),
                    Text(
                      '研究生',
                      style: TextStyle(
                         fontSize: ScreenUtil().setSp(26),
                         fontWeight: FontWeight.w300,
                         color: Color.fromRGBO(95,94,94,1)),
                    ),
                  ],
                )
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "5.5-7K",
                style: TextStyle(
                  color: Color.fromRGBO(68,77,151,1),
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox.fromSize(size: Size(1, ScreenUtil().setHeight(54))),
              GestureDetector(
                onTap: () {
                  if(onCommunicateClick != null) {
                    onCommunicateClick();
                  }
                },
                child: Container(
                  constraints: BoxConstraints.tight(Size(ScreenUtil().setWidth(160), ScreenUtil().setHeight(46))),
                  alignment: Alignment.center,
                  child: Text(
                    "立即沟通",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      color: Color.fromRGBO(159, 199, 235, 1),
                    ),
                  ),
                  decoration: BoxDecoration(
                     border: Border.all(
                       color: Color.fromRGBO(159, 199, 235, 1),
                       width: ScreenUtil().setWidth(2),
                     ),
                     borderRadius: BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
              ),
            ],
          ),
        ],
      
      ),
    );
    return Column(
      children: <Widget>[
        employeeItem,
        Container(
          width: ScreenUtil().setWidth(654),
          height: ScreenUtil().setHeight(1),
          color: Color.fromRGBO(159,199,235,1),
        ),
      ],
    );
  }
}
