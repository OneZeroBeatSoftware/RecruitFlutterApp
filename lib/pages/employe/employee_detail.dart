import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/pages/employe/boss_chat_room.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/list_menu_dialog.dart';
import 'package:recruit_app/pages/employe/employee_experience.dart';
import 'package:recruit_app/pages/employe/employee_experience2.dart';

class EmployeeDetail extends StatefulWidget {
  @override
  _EmployeeDetailState createState() {
    // TODO: implement createState
    return _EmployeeDetailState();
  }
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  bool _isCollected=false;
  List<String> _reports=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    List<Experience> workExperiences = [];
    for(int i = 0; i < 2; i++)  {
        workExperiences.add(Experience('星网锐捷', '2018.10-至今', <String>['地产设计', '插画师', '设计部门']));
    }
    
    List<Experience> projectExperiences = [];
    for(int i = 0; i < 1; i++)  {
      projectExperiences.add(Experience('ERP系统', '2020年7月30日', <String>['地产设计', '现场执行', '策划']));
    }
    
    List<Experience2> educationExperiences = [];
    for(int i = 0; i < 3; i++)  {
      educationExperiences.add(Experience2('杜克大学(研究生，设计学)', '2012-2016'));
    }
    
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
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(7),
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset('images/avatar_14.png', width: ScreenUtil().setWidth(44), height: ScreenUtil().setWidth(44)),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(24),
                  ),
                  Align(
                     alignment: Alignment.centerRight,
                     child: Text("哈登",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                           fontSize: ScreenUtil().setSp(36),
                           fontWeight: FontWeight.bold,
                           color: Color.fromRGBO(20, 20, 20, 1)))),
                ],),
              SizedBox(
                height: 3,
              ),
              Text('在线',
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
            ],
          )),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          rightAction: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _isCollected=!_isCollected;
                  });
                },
                child: Image.asset(
                  _isCollected?'images/img_heart_focus.png':'images/img_heart_unfocus.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
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
                            title: '举报',
                            cancel: () {
                              Navigator.pop(context);
                            },
                            confirm: () {
                              Navigator.pop(context);
                            },
                            itemSelected: (){
                              Navigator.pop(context);
                      
                            },
                            lists: _reports,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset(
                  'images/img_report.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Image.asset(
                  'images/img_share.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(48),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
               color: Color.fromRGBO(245, 245, 245, 1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(48)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bingo',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          ),
                          Row(children: <Widget>[
                            Text(
                              '期望薪资',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(22),
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(176,181,180,1),
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(12)),
                            Text(
                              '5.5-7k',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(36),
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(68,77,151,1),
                              ),
                            ),
                          ])
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("福州 仓山",
                            style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("男",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
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
                              Text("10年经验",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
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
                              Text("研究生",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                              ),
                              
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(48), bottom: ScreenUtil().setHeight(29)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("个人信息",
                             style: TextStyle(color: Color.fromRGBO(57,57,57,1), fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w500)
                          ),
                          Text("离职-随时到岗",
                             style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.w300)
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text("工作经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: workExperiences,
                        
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(38), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("项目经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: projectExperiences,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(44), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("教育经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: educationExperiences,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(44), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("个人主页",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(12)),
                      Text("wwww.onezerobeat.com",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40), bottom: ScreenUtil().setHeight(59)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(14)),
                  child: MaterialButton(
                    minWidth: ScreenUtil().setWidth(652),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BossChatRoom()));
                    },
                    textColor: Color.fromRGBO(159,199,235,1),
                    child: Text("立即沟通"),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                       side: const BorderSide(
                         color: Color.fromRGBO(159, 199, 235, 1),
                         width: 1
                       )
                    ),
                  )),
            ),
          ],
        ));
  }
}
