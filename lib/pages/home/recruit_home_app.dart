
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/msg_type.dart';
import 'package:recruit_app/pages/boss/boss.dart';
import 'package:recruit_app/pages/companys/company_list.dart';
import 'package:recruit_app/pages/employe/employe_list.dart';
import 'package:recruit_app/pages/jobs/job_list.dart';
import 'package:recruit_app/pages/mine/me.dart';
import 'package:recruit_app/pages/msg/msg_list.dart';
import 'package:recruit_app/utils/net_utils.dart';
class RecruitHomeApp extends StatefulWidget {
  @override
  _RecruitHomeState createState() {
    // TODO: implement createState
    return _RecruitHomeState();
  }
}

class _RecruitHomeState extends State<RecruitHomeApp> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _bossWidget = <Widget>[
    EmployeeList(),
    MsgList(msgType: MsgType.recruiter,),
    BossMine(),
  ];

  static List<BottomNavigationBarItem> _bossBottoms = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_geeks_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_geeks_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('人才'),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_msg_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_msg_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('消息'),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_my_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_my_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('我的'),
    ),
  ];

  static List<Widget> _widgetOptions = <Widget>[
    JobList(),
    CompanyList(),
    MsgList(msgType: MsgType.seeker,),
    Mine(),
  ];

  static List<BottomNavigationBarItem> _widgetBottoms =
  <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_jobs_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_jobs_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('职位'),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_coms_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_coms_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('公司'),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_msg_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_msg_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('消息'),
    ),

    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_my_unselect.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'images/ic_nav_tab_my_select.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('我的'),
    ),
  ];

//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IdentityModel identityModel=Provider.of<IdentityModel>(context);
    return Scaffold(
      body: identityModel.identity == Identity.boss
          ? _bossWidget.elementAt(identityModel.selectedIndex)
          : _widgetOptions.elementAt(identityModel.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:
        identityModel.identity == Identity.boss ? _bossBottoms : _widgetBottoms,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        currentIndex: identityModel.selectedIndex,
        unselectedItemColor: Color.fromRGBO(67, 67, 67, 1),
        selectedItemColor: Color.fromRGBO(52, 52, 52, 1),
        selectedFontSize: 13,
        unselectedFontSize: 12,
        onTap: (index) {
          if(identityModel.identity == Identity.boss&&(index==1||index==2)){
            NetUtils.validateLogin(context,isLogin: Application.sp.get('recruiterId')!=null,callback: (){
              identityModel.changeSelectTap(index);
            });
            return;
          }
          if(identityModel.identity == Identity.employee&&(index==2||index==3)&&Application.sp.get('jobSeekerId')==null){
            NetUtils.validateLogin(context,isLogin: Application.sp.get('jobSeekerId')!=null,callback: (){
              identityModel.changeSelectTap(index);
            });
            return;
          }
          identityModel.changeSelectTap(index);
        },
      ),
    );
  }
}