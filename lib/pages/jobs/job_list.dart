import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() {
    // TODO: implement createState
    return _JobListState();
  }
}

class _JobListState extends State<JobList> {
  List<Job> _jobList = JobData.loadJobs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        appBar: AppBar(
          title: Text("职位"),
          backgroundColor: Color.fromRGBO(70, 192, 182, 1),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (index < _jobList.length) {
              return GestureDetector(child: JobRowItem(
                  job: _jobList[index],
                  index: index,
                  lastItem: index == _jobList.length - 1),
              onTap: (){
                Navigator.push(context,  MaterialPageRoute(builder: (context)=>JobDetail(),));
              });
            }
            return null;
          },
          itemCount: _jobList.length,
          shrinkWrap: true,
          physics:const BouncingScrollPhysics(),
        ),
      );
  }
}
