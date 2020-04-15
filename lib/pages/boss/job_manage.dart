import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _getJobList();
    });
  }

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
                  if (index < BossMineModel.instance.jobList.length) {
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: JobManageItem(
                            jobManageData:  BossMineModel.instance.jobList[index],
                            index: index),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompanyPostRecruit(isADDMode: false,jobId: BossMineModel.instance.jobList[index].id,),
                              ));
                        });
                  }
                  return null;
                },
                itemCount:  BossMineModel.instance.jobList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ));
  }

  /// 获取岗位列表
  _getJobList() {
    BossMineModel.instance.getJobList(context, Application.sp.getString('recruiterId')).then((model){
      setState(() {});
    });
  }
}
