import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';

class EmployeeRowItem extends StatelessWidget {
  final Employee employee;
  final int index;
  final bool lastItem;

  const EmployeeRowItem({Key key, this.employee, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeItem = Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${employee.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(37, 38, 39, 1),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        '${employee.exp} ${employee.degree} ${employee.salary}',
                        style: const TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 14,
                          color: Color.fromRGBO(53, 54, 55, 1),
                        )),
                  ],
                ),
              ),
              SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'images/avatar_${index % 16 + 1}.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'images/ic_card_work_exp_icon.png',
                width: 17,
                height: 18,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text('${employee.company}•${employee.pos}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 54, 55, 1),
                      ))),
              SizedBox(width: 10),
              Text('${employee.during}',
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(180, 181, 182, 1))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: employee.label.map((item) {
              return new Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: new BorderRadius.circular(4.0),
                  ),
                  child: Text(item,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.grey[600])));
            }).toList(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(employee.resume,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  letterSpacing: 1,
                  wordSpacing: 2,
                  fontSize: 14,
                  color: Color.fromRGBO(93, 94, 95, 1))),
        ],
      ),
    );
    return Column(
      children: <Widget>[
        employeeItem,
        Container(
          height: 10,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
