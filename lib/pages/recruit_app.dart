import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/pages/companys/company_list.dart';
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    JobList(),
    CompanyList(),
    Mine(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child:  Scaffold(
          body:_widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
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
            ],
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            currentIndex: _selectedIndex,
            unselectedItemColor: Color.fromRGBO(67, 67, 67, 1),
            selectedItemColor: Color.fromRGBO(52, 52, 52, 1),
            selectedFontSize: 13,
            unselectedFontSize: 12,
            onTap: _onItemTapped,
          ),
        ));
  }
}
