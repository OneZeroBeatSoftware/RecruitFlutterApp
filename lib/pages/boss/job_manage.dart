import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_manage_list.dart';
import 'package:recruit_app/pages/boss/job_manage_detail.dart';
import 'package:recruit_app/pages/boss/job_manage_item.dart';

class JobManage extends StatefulWidget {
  @override
  _JobManageState createState() {
    // TODO: implement createState
    return _JobManageState();
  }
}

class _JobManageState extends State<JobManage> {
  List<JobManageData> _jobList = JobManageList.loadJobList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
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
          centerTitle: true,
          title: Text('职位管理',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 38, 39, 1))),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index < _jobList.length) {
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: JobManageItem(
                            jobManageData: _jobList[index],
                            index: index),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobManageDetail(),
                              ));
                        });
                  }
                  return null;
                },
                itemCount: _jobList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: MaterialButton(
                    color: Color.fromRGBO(70, 192, 182, 1),
                    onPressed: () {
                    },
                    textColor: Colors.white,
                    child: Text("发布新职位"),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  )),
            ),
          ],
        ));
  }
}
