import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_intent_list.dart';

class JobIntentItem extends StatelessWidget {
  final IntentData intentData;
  final int index;

  const JobIntentItem({Key key, this.intentData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('[${intentData.city}]${intentData.jobName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(37, 38, 39, 1))),
              SizedBox(height: 8),
              Text('${intentData.salary} ${intentData.industry}',
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(136, 138, 138, 1))),
            ],
          )),
          SizedBox(width: 15),
          Image.asset('images/ic_arrow_gray.png',
              width: 10, height: 10, fit: BoxFit.cover)
        ],
      ),
    );
  }
}
