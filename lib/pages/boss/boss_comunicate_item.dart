import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/employe_list.dart';

class BossCommunicateItem extends StatelessWidget {
  final Employee employee;
  final int index;

  const BossCommunicateItem({
    Key key,
    this.employee,
    this.index,
  }) : super(key: key);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'images/avatar_${index % 16 + 1}.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            '${employee.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(37, 38, 39, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                            '${employee.exp}•${employee.degree}•${employee.salary}',
                            style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 13,
                              color: Color.fromRGBO(82, 82, 82, 1),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${employee.company}•${employee.pos}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 38, 39, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            employee.resume,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              letterSpacing: 1,
              wordSpacing: 2,
              fontSize: 14,
              color: Color.fromRGBO(96, 96, 96, 1),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 1,
            color: Color.fromRGBO(244, 244, 244, 1),
          ),
          Text(
            '12月16日 21：50',
            style: const TextStyle(
              wordSpacing: 1,
              letterSpacing: 1,
              fontSize: 12,
              color: Color.fromRGBO(184, 184, 184, 1),
            ),
          ),
        ],
      ),
    );
    return Column(
      children: <Widget>[
        employeeItem,
        Container(
          height: 10,
          color: Color.fromRGBO(244, 244, 244, 1),
        ),
      ],
    );
  }
}
