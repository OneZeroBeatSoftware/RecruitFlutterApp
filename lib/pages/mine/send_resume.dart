import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/mine/comunicate_row_item.dart';

class SendResumeJob extends StatefulWidget {
  @override
  _SendResumeJobState createState() {
    // TODO: implement createState
    return _SendResumeJobState();
  }
}

class _SendResumeJobState extends State<SendResumeJob> {
  List<Job> _jobList = JobData.loadJobs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text('已投简历的职位',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 38, 39, 1))),
        leading: IconButton(
            icon: Image.asset(
              'images/ic_back_arrow.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _jobList.length) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: ComunicateRowItem(
                    job: _jobList[index],
                    index: index,
                    lastItem: index == _jobList.length - 1),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetail(),
                      ));
                });
          }
          return null;
        },
        itemCount: _jobList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
