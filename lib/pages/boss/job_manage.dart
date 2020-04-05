import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_manage_list.dart';
import 'package:recruit_app/pages/boss/job_manage_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/pages/boss/company_post_recruit.dart';


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
        appBar: CommonAppBar(
            leading: 'images/img_arrow_left_black.png',
            leftListener: () {
                Navigator.pop(context);
            },
            center: Container(
               alignment: Alignment.center,
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                       SizedBox(
                           height: ScreenUtil().setHeight(7),
                       ),
                       Text('岗位管理',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                             fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
                       SizedBox(
                           height: 3,
                       ),
                   ],
               )),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                 color: Color.fromRGBO(245, 245, 245, 1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
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
                                builder: (context) => CompanyPostRecruit(isADDMode: false),
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
          ],
        ));
  }
}
