import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/pages/boss/boss.dart';
import 'package:recruit_app/pages/companys/company_list.dart';
import 'package:recruit_app/pages/employe/employe_list.dart';
import 'package:recruit_app/pages/jobs/job_list.dart';
import 'package:recruit_app/pages/mine/me.dart';

class RecruitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: RecruitHomeApp(),
    );
  }
}

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
    BossMine(),
  ];

  static List<BottomNavigationBarItem> _bossBottoms = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/ic_nav_tab_geeks_unselect.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'images/ic_nav_tab_geeks_select.png',
        width: 24,
        height: 24,
      ),
      title: Text('牛人'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/ic_nav_tab_my_unselect.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'images/ic_nav_tab_my_select.png',
        width: 24,
        height: 24,
      ),
      title: Text('我的'),
    ),
  ];

  static List<Widget> _widgetOptions = <Widget>[
    JobList(),
    CompanyList(),
    Mine(),
  ];

  static List<BottomNavigationBarItem> _widgetBottoms =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/ic_nav_tab_jobs_unselect.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'images/ic_nav_tab_jobs_select.png',
        width: 24,
        height: 24,
      ),
      title: Text('职位'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/ic_nav_tab_coms_unselect.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'images/ic_nav_tab_coms_select.png',
        width: 24,
        height: 24,
      ),
      title: Text('公司'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/ic_nav_tab_my_unselect.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'images/ic_nav_tab_my_select.png',
        width: 24,
        height: 24,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IdentityModel>(builder: (context, model, child) {
        return model.identity == Identity.boss
            ? _bossWidget.elementAt(model.selectedIndex)
            : _widgetOptions.elementAt(model.selectedIndex);
      }),
      bottomNavigationBar: Consumer<IdentityModel>(
        builder: (context, model, child) {
          return BottomNavigationBar(
            items:
                model.identity == Identity.boss ? _bossBottoms : _widgetBottoms,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            currentIndex: model.selectedIndex,
            unselectedItemColor: Color.fromRGBO(67, 67, 67, 1),
            selectedItemColor: Color.fromRGBO(52, 52, 52, 1),
            selectedFontSize: 13,
            unselectedFontSize: 12,
            onTap: (index) {
              model.changeSelectTap(index);
            },
          );
        },
      ),
    );
  }
}
