import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_list.dart';

class ComunicateRowItem extends StatelessWidget {
  final Job job;
  final int index;
  final bool lastItem;

  const ComunicateRowItem({Key key, this.job, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobItem = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            clipBehavior: Clip.antiAlias,
            semanticContainer: false,
            child: Padding(
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
                        child: Text(job.jobName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(width: 8),
                      Text(
                          '${job.leastSalary}-${job.highestSalary}K•${job.count}薪',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(70, 192, 182, 1))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          child: Text('${job.companyName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 13,
                                  color: Colors.grey[600]))),
                      SizedBox(width: 8),
                      Text('${job.companyStatus}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 13,
                              color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: job.label.map((item) {
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
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[600])));
                    }).toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/avatar_${index % 16 + 1}.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Flexible(
                          child: Text(job.hr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  fontSize: 12,
                                  color: Colors.grey[600]))),
                      Text('•${job.hrPos}',
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 12,
                              color: Colors.grey[600])),
                    ],
                  ),
                  Container(
                    color: Color.fromRGBO(242, 242, 242, 1),
                    height: 1,
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                  ),
                  Text(
                    '12月16日 20:49',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(184, 186, 188, 1)),
                  ),],
              ),
            ),
          ));

//    if (lastItem) {
//      return card;
//    }
    return Column(
      children: <Widget>[
        jobItem,
        Divider(
          height: 4,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
