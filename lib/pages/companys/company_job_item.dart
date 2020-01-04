import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_list.dart';

class CompanyJobItem extends StatelessWidget {
  final Job job;
  final int index;
  final bool lastItem;

  const CompanyJobItem({Key key, this.job, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobItem = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15,),
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
            Text('${job.leastSalary}-${job.highestSalary}K•${job.count}薪',
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
                    style: TextStyle(fontSize: 10, color: Colors.grey[600])));
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
        SizedBox(height: 15,),
      ],
    );
    return Column(
      children: <Widget>[
        jobItem,
        Container(
          color: Color.fromRGBO(248, 248, 248, 1),
          height: 2,
        ),
      ],
    );
  }
}
