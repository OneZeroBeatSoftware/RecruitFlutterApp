import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';

import 'boss_comunicate_item.dart';

class BossCollectionJob extends StatefulWidget {
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
        title: Text('我收藏的牛人',
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _employeeList.length) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: BossCommunicateItem(
                    employee: _employeeList[index],
                    index: index,),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeDetail(),
                      ));
                });
          }
          return null;
        },
        itemCount: _employeeList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
