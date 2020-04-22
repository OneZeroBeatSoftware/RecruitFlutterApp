import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/candidate_entity.dart';
import 'package:recruit_app/entity/main_resume_list_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/pages/employe/employe_row_item.dart';
import 'package:recruit_app/pages/employe/employee_detail.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class CompanyJobCandidate extends StatefulWidget {
  final String jobId;

  const CompanyJobCandidate({Key key, this.jobId=''}) : super(key: key);

  @override
  State createState() {
    // TODO: implement createState
    return _CandidateState();
  }
}

class _CandidateState extends State<CompanyJobCandidate> {
  int _pageIndex = 1;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_refreshController!=null){
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
       appBar: CommonAppBar(
         leading: 'images/img_arrow_left_black.png',
         leftListener: () {
           Navigator.pop(context,BossMineModel.instance.candidateList.length);
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
                Text('候选人',
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
//         rightAction: Container(
//           margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Text("",
//               style: TextStyle(
//                  color: Color.fromRGBO(57,57,57,1),
//                  fontSize: ScreenUtil().setSp(36),
//                  fontWeight: FontWeight.bold
//               ),
//             ),
//           ),
//
//         ),
       ),
       body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
               Container(
                   height: ScreenUtil().setWidth(1),
                   color: Color.fromRGBO(245, 245, 245, 1),
               ),
               Expanded(
                 child: EasyRefresh.custom(
                   controller: _refreshController,
                   firstRefresh: true,
                   header: MaterialHeader(),
                   footer:
                   ClassicalFooter(infoColor: Color.fromRGBO(159, 199, 235, 1)),
                   onRefresh: () async {
                     _pageIndex = 1;
                     _getCandidateList();
                     _refreshController.resetLoadState();
                   },
                   onLoad: () async {
                     _getCandidateList();
                     _refreshController.resetLoadState();
                   },
                   slivers: <Widget>[
                     SliverList(
                         delegate:
                         SliverChildBuilderDelegate((context, index) {
                           if (index < BossMineModel.instance.candidateList.length) {
                             var key = GlobalKey<SlideButtonState>();
                             return GestureDetector(
                                 behavior: HitTestBehavior.opaque,
                                 child:   SlideButton(
                                   key: key,
                                   singleButtonWidth: ScreenUtil().setWidth(116),
                                   child: Container(
                                     color: Colors.white,
                                     child: Candidate(BossMineModel.instance.candidateList[index],index,index == BossMineModel.instance.candidateList.length - 1),
                                   ),
                                   buttons: <Widget>[
                                     buildAction(key, Colors.red, () {
                                       key.currentState.close();
                                       _deleteCandidate(BossMineModel.instance.candidateList[index].id, index);
                                     }),
                                   ],
                                 ),
                                 onTap: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => EmployeeDetail(
                                           resumeDetailType: ResumeDetailType
                                               .resume,
                                           resumeId: BossMineModel.instance.candidateList[index].resumeId,),
                                       ));
                                 }
                             );
                           }
                           return null;
                         },
                             childCount: BossMineModel.instance.candidateList.length)),
                   ]
                 ),
               ),
           ],
       ));
  }

  InkWell buildAction(GlobalKey<SlideButtonState> key, Color color,
      GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          'images/img_del_white.png',
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(38),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// 获取候选人列表
  _getCandidateList() {
    BossMineModel.instance.getCandidateList(context, widget.jobId,_pageIndex).then((model){
      if (model != null) {
        _pageIndex++;
      }
      setState(() {});
    });
  }

  /// 删除候选人
  _deleteCandidate(String id,int index) async {
    BaseRespEntity _baseEntity = await BossMineModel.instance
        .deleteCandidate(context,id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??'删除成功');
      BossMineModel.instance.candidateList.removeAt(index);
      setState(() {
      });
    }
  }
}

class Candidate extends StatelessWidget {
  final CandidateDataRecord candidateDataRecord;
  final int index;
  final bool isLast;

  Candidate(this.candidateDataRecord, this.index, this.isLast);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MainResumeListDataRecord employee = MainResumeListDataRecord()
      ..id = candidateDataRecord.resumeId
      ..jobSeekerId = candidateDataRecord.jobSeekerId
      ..realName = candidateDataRecord.realName
      ..resumeName = candidateDataRecord.resumeName
      ..sex = candidateDataRecord.sex
      ..workDateName = candidateDataRecord.workDateName
      ..educationName = candidateDataRecord.educationName
      ..minSalary = candidateDataRecord.minSalary
      ..maxSalary = candidateDataRecord.maxSalary;
    return Column(
        children: <Widget>[
            EmployeeRowItem(
               employee: employee,
               index: index,
               lastItem: isLast,
               onCommunicateClick: () {
                   showDialog(
                      context: context,
                       child: AlertDialog(
                           content: Text('进行沟通'),
                       )
                   );
               }),
            Padding(
                padding: EdgeInsets.only(
                   left: ScreenUtil().setWidth(48),
                   top: ScreenUtil().setHeight(18),
                   bottom: ScreenUtil().setHeight(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        Text(
                          '${DateUtil.formatDateMs(candidateDataRecord.completeDate,format:"yyyy年MM月dd日HH:mm")}完成面试',
                            style: TextStyle(
                               color: Color.fromRGBO(194,203,202,1),
                               fontSize: ScreenUtil().setHeight(22),
                               fontWeight: FontWeight.w300,
                               letterSpacing: 1
                            ),
                        ),
                    ],
                ),
            ),
            Container(
                color: Color.fromRGBO(245,245,245,1),
                height: ScreenUtil().setHeight(6)
            )
        ],
    );
  }
}


