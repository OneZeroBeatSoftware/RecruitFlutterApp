import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_manage_list.dart';

class JobManageItem extends StatelessWidget {
  final JobManageData jobManageData;
  final int index;

  const JobManageItem({Key key, this.jobManageData, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '${jobManageData.jobName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(38, 38, 38, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${jobManageData.salary}',
                        style: const TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 14,
                          color: Color.fromRGBO(67, 67, 67, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${jobManageData.address}  ${jobManageData.degree}  ${jobManageData.exp}',
                    style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(154, 154, 154, 1),
                    ),
                  ),
                ],
              )),
              SizedBox(width: 15),
              Image.asset('images/ic_arrow_gray.png',
                  width: 10, height: 10, fit: BoxFit.cover)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 1,
            color: Color.fromRGBO(242, 242, 242, 1),
          ),
        ],
      ),
    );
  }
}
