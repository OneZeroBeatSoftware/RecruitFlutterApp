import 'package:flutter/material.dart';
import 'package:recruit_app/model/mine_work_list.dart';

class WorkItem extends StatelessWidget {
  final MineWorkData workData;
  final int index;

  const WorkItem({Key key, this.workData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(workData.companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(37, 38, 39, 1))),
              ),
              SizedBox(
                width: 8,
              ),
              Text(workData.during,
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(159, 160, 161, 1))),
              SizedBox(width: 15),
              Image.asset('images/ic_arrow_gray.png',
                  width: 10, height: 10, fit: BoxFit.cover)
            ],
          ),
          SizedBox(height: 5),
          Text('${workData.pos}',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(136, 138, 138, 1))),
          SizedBox(height: 8),
          Text('${workData.content}',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(136, 138, 138, 1))),
          SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: workData.label.map((item) {
              return new Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: new BorderRadius.circular(3.0),
                  ),
                  child: Text(item,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.grey[600])));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
