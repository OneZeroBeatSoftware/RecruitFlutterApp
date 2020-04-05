import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/me_list.dart';
import 'package:recruit_app/pages/boss/boss_collection.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/job_manage.dart';
import 'package:recruit_app/pages/mine/about_soft.dart';
import 'package:recruit_app/pages/mine/help_feedback.dart';
import 'package:recruit_app/pages/setting/setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/mine/communicate.dart';
import 'package:recruit_app/pages/mine/mine_interview.dart';
import 'package:recruit_app/pages/boss/company_post_recruit.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';

class BossMine extends StatefulWidget {
  @override
  _BossMineState createState() {
    // TODO: implement createState
    return _BossMineState();
  }
}

class _BossMineState extends State<BossMine> {
  List<Me> options = MeOptions.loadBossOptions();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          IconButton(
             icon: Image.asset(
               'images/img_setting_white.png',
               width: 24,
               height: 24,
             ),
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Setting(),
                 ),
               );
             }),
        ],
        backgroundColor: Color.fromRGBO(68, 77, 151, 1),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                     left: ScreenUtil().setWidth(48),
                     right: ScreenUtil().setWidth(48),
                     bottom: ScreenUtil().setWidth(48),
                     top: ScreenUtil().setWidth(30)),
                  color: Color.fromRGBO(68, 77, 151, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '一零跳动软件有限公司',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                 color: Colors.white,
                                 fontSize: ScreenUtil().setSp(48),
                                 fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(15),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(70),
                            ),
                            child: Image.asset(
                              'images/img_icon_harden.png',
                              width: ScreenUtil().setWidth(140),
                              height: ScreenUtil().setWidth(140),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(56),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '沟通过',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                  Text(
                                    '(18)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => CommunicateJob(
                                        onItemClicked: ()=>
                                          Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                               builder: (context) => EmployeeDetail(),
                                             ))
                                        ,
                                      )
                                   )
                                );
                              },
                            ),
                          ),
//                          Container(
//                            margin: EdgeInsets.symmetric(
//                              horizontal: ScreenUtil().setWidth(10),
//                            ),
//                            width: ScreenUtil().setWidth(1),
//                            height: ScreenUtil().setHeight(28),
//                            color: Colors.white,
//                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '面试',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                  Text(
                                    '(15)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
//                                Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                      builder: (context) => MineInterView()));
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => MineInterView(onItemClicked: () {
                                        Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                             builder: (context) => EmployeeDetail(),
                                           ));
                                      },)));
                              },
                            ),
                          ),
                        Expanded(flex: 1,
                          child: Text(""))
//                          Container(
//                            margin: EdgeInsets.symmetric(
//                              horizontal: ScreenUtil().setWidth(10),
//                            ),
//                            width: ScreenUtil().setWidth(1),
//                            height: ScreenUtil().setHeight(28),
//                            color: Colors.white,
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: GestureDetector(
//                              behavior: HitTestBehavior.opaque,
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
//                                children: <Widget>[
//                                  Text(
//                                    '待面试',
//                                    maxLines: 1,
//                                    overflow: TextOverflow.ellipsis,
//                                    style: TextStyle(
//                                      color: Color.fromRGBO(227, 226, 226, 1),
//                                      fontSize: ScreenUtil().setSp(28),
//                                    ),
//                                  ),
//                                  Text(
//                                    '(13)',
//                                    maxLines: 1,
//                                    overflow: TextOverflow.ellipsis,
//                                    style: TextStyle(
//                                      color: Color.fromRGBO(227, 226, 226, 1),
//                                      fontSize: ScreenUtil().setSp(28),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              onTap: () {
//                                Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                      builder: (context) => MineInterView()));
//                              },
//                            ),
//                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
              ],
            ),
          ),
          SliverList(
             delegate: SliverChildBuilderDelegate((context, index) {
               return Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   GestureDetector(
                     behavior: HitTestBehavior.opaque,
                     child: Padding(
                       padding: EdgeInsets.symmetric(
                         horizontal: ScreenUtil().setWidth(48),
                         vertical: ScreenUtil().setHeight(20),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Image.asset(
                             options[index].imgPath,
                             width: ScreenUtil().setWidth(40),
                             height: ScreenUtil().setWidth(40),
                             fit: BoxFit.cover,
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
                           ),
                           Expanded(
                             child: Text(
                               options[index].itemName,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 1,
                               style: TextStyle(
                                   color: Color.fromRGBO(57, 57, 57, 1),
                                   fontSize: ScreenUtil().setSp(32)),
                             ),
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
                           ),
                           Text(
                             options[index].itemStatus,
                             overflow: TextOverflow.ellipsis,
                             maxLines: 1,
                             style: TextStyle(
                               color: Color.fromRGBO(194, 203, 202, 1),
                               fontSize: ScreenUtil().setSp(24),
                             ),
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
                           ),
                           Image.asset(
                             'images/img_arrow_right_blue.png',
                             width: ScreenUtil().setWidth(10),
                             height: ScreenUtil().setWidth(20),
                             fit: BoxFit.cover,
                           )
                         ],
                       ),
                     ),
                     onTap: () {
                       if (index == 0) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => CompanyInfo()));
                       } else if (index == 1) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => CompanyPostRecruit()));
                       } else if (index == 2) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => JobManage()));
                       } else if (index == 3) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => BossCollectionJob()));
                       } else if (index == 4) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => BossCollectionJob(title: '黑名单')));
                       }
                       else if (index == 5) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => HelpFeedback()));
                       } else if (index == 6) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => AboutSoft()));
                       }
                     },
                   ),
                   Container(
                     color: Color.fromRGBO(159, 199, 235, 1),
                     height: (index == 5 || index == options.length - 1)
                        ? ScreenUtil().setWidth(1)
                        : 0,
                     width: ScreenUtil().setWidth(654),
                     margin: EdgeInsets.only(top: ScreenUtil().setHeight((index == 5 || index == options.length - 1)
                        ? 20 : 0),
                     bottom: ScreenUtil().setHeight((index == 5 || index == options.length - 1)
                        ? 19 : 0)),
                   
                   )
                 ],
               );
             }, childCount: options.length)),
          SliverToBoxAdapter(
            child: Container(
              margin:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48)),
              height: ScreenUtil().setHeight(20)
            ),
          ),
        ],
      ),
    );
  }
}