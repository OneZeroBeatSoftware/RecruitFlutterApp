import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';
import 'package:recruit_app/pages/employe/employe_row_item.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() {
    // TODO: implement createState
    return _EmployeeListState();
  }
}

class _EmployeeListState extends State<EmployeeList> {
  List<Employee> _employeeList = EmployeeData.loadEmployees();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        title: Text("牛人"),
        backgroundColor: Color.fromRGBO(70, 192, 182, 1),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _employeeList.length) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: EmployeeRowItem(
                    employee: _employeeList[index],
                    index: index,
                    lastItem: index == _employeeList.length - 1),
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
