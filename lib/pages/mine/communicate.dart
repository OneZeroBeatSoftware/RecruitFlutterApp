import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/mine/communicate_row_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CommunicateJob extends StatefulWidget {
  VoidCallback onItemClicked;
  CommunicateJob({this.onItemClicked});
  
  @override
  _CommunicateJobState createState() {
    // TODO: implement createState
    return _CommunicateJobState();
  }
}

class _CommunicateJobState extends State<CommunicateJob> {
  List<Job> _jobList = JobData.loadJobs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '沟通过',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setWidth(1),
          color: Color.fromRGBO(159, 199, 235, 1),
        ),
        Expanded(child: ListView.builder(
          itemBuilder: (context, index) {
            if (index < _jobList.length) {
              return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: CommunicateRowItem(
                      job: _jobList[index],
                      index: index,
                      lastItem: index == _jobList.length - 1),
                  onTap: () {
                    if(widget.onItemClicked != null) {
                      widget.onItemClicked();
                    } else {
                      //默认跳转行为
                      Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => JobDetail(),
                      ));
                    }
                  });
            }
            return null;
          },
          itemCount: _jobList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
        ),),
      ],),
    );
  }
}
