import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/mine_work_list.dart';

class WorkItem extends StatelessWidget {
  final MineWorkData workData;
  final int index;

  const WorkItem({Key key, this.workData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(17)),
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
                    style: TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: ScreenUtil().setSp(28),
                        color: Color.fromRGBO(95, 94, 94, 1))),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(16),
              ),
              Text(workData.during,
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: ScreenUtil().setSp(22),
                      color: Color.fromRGBO(176, 181, 180, 1))),
              SizedBox(width: ScreenUtil().setWidth(14)),
              Image.asset(
                'images/img_arrow_right_blue.png',
                width: ScreenUtil().setWidth(10),
                height: ScreenUtil().setWidth(20),
                fit: BoxFit.cover,
              )
            ],
          ),
          SizedBox(height: ScreenUtil().setWidth(5)),
          Text('${workData.pos}',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: ScreenUtil().setSp(24),
                  color: Color.fromRGBO(176, 181, 180, 1))),
        ],
      ),
    );
  }
}
