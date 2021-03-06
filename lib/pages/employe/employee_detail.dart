import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/boss_job_manage_entity.dart';
import 'package:recruit_app/entity/candidate_update_entity.dart';
import 'package:recruit_app/entity/collection_entity.dart';
import 'package:recruit_app/entity/main_resume_detail_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/model/recruit_resume_model.dart';
import 'package:recruit_app/pages/employe/candidate_boss_room.dart';
import 'package:recruit_app/pages/jobs/report.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/employe/employee_experience.dart';
import 'package:recruit_app/pages/employe/employee_experience2.dart';
import 'package:recruit_app/widgets/craft_share_board.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';
import 'package:recruit_app/widgets/network_image.dart';
import 'package:recruit_app/widgets/remind_column_dialog.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

enum ResumeDetailType {resume, interview,readOnly}

class EmployeeDetail extends StatefulWidget {
  final String resumeId;
  final ResumeDetailType resumeDetailType;

  const EmployeeDetail({Key key, this.resumeId='1', this.resumeDetailType=ResumeDetailType.resume}) : super(key: key);

  @override
  _EmployeeDetailState createState() {
    // TODO: implement createState
    return _EmployeeDetailState();
  }
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  bool _isCollected=false;
  String _starId;
  List<String> _menuItem = [];
  List<String> _reports=[];
  String _jobState='';

  MainResumeDetailData _resumeDetailData;

  @override
  void initState() {
    // TODO: implement initState
    _menuItem.clear();
    _menuItem.add('举报人才');
    _menuItem.add('屏蔽人才');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((i) {
      getResumeDetail(widget.resumeId);
      if(Application.sp.get('recruiterId')!=null){
        _getJobList(true);
      }
    });
  }

  /// 分享
  void shareJob(){
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ShareBoard(
          title: '分享',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Experience> workExperiences = [];
    List<Experience> projectExperiences = [];
    List<Experience2> educationExperiences = [];

    List<Widget> _bottomOperateView=[];
//    if(widget.resumeDetailType==ResumeDetailType.interview){
//      _bottomOperateView.add(FlexButton(btnTitle: '取消面试',));
//      _bottomOperateView.add(FlexButton(flex: 2, btnTitle: '申请调整时间',));
//    }else {
    _bottomOperateView.add(FlexButton(
      btnTitle: '立即沟通',
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        NetUtils.validateLogin(context,
            isLogin: Application.sp.get('recruiterId') != null, callback: () {
          if (BossMineModel.instance.jobList.length < 1) {
            _getJobList(false);
            return;
          }
          _showJobList();
        });
      },
    ));
//    }

    if(_resumeDetailData!=null){
      _resumeDetailData.workExperience.forEach((item){
        workExperiences.add(Experience('${item.companyName}',
            '${DateUtil.formatDateMs(
                item.startDate, format: 'yyyy-MM-dd')}-${DateUtil.formatDateMs(
                item.endDate, format: 'yyyy-MM-dd')}',
            '${item.department} ${item.positionName}'));
      });

      _resumeDetailData.projectExperience.forEach((item){
        projectExperiences.add(Experience('${item.projectName}',
            '${DateUtil.formatDateMs(
                item.startDate, format: 'yyyy-MM-dd')}-${DateUtil.formatDateMs(
                item.endDate, format: 'yyyy-MM-dd')}',
            '${item.projectContent}'));
      });

      _resumeDetailData.educationExperience.forEach((item){
        educationExperiences.add(Experience2('${item.educationName}(${item.specialty})',
            '${DateUtil.formatDateMs(
                item.startDate, format: 'yyyy-MM-dd')}-${DateUtil.formatDateMs(
                item.endDate, format: 'yyyy-MM-dd')}'));
      });
    }
    
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
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(7),
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: NetImage(img:_resumeDetailData==null?'images/avatar_14.png':'${_resumeDetailData.resume.avatar}',placeholder: 'images/avatar_14.png',error: 'images/avatar_14.png',size: ScreenUtil().setWidth(44),),
                  ),
//                  SizedBox(
//                    width: ScreenUtil().setWidth(24),
//                  ),
//                  Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(_resumeDetailData==null?'':_resumeDetailData.resume.realName,
//                        maxLines: 1,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                           fontSize: ScreenUtil().setSp(36),
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(20, 20, 20, 1)))),
                ],),
              SizedBox(
                height: 3,
              ),
              Text('在线',
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(159, 199, 235, 1))),
            ],
          )),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          rightAction: Offstage(child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if(_resumeDetailData!=null){
                    NetUtils.validateLogin(context,
                        isLogin: Application.sp.get('recruiterId') != null, callback: () {
                          _operateStar(_resumeDetailData.resume.jobSeekerId, _starId);
                        });
                  }else {
                    Utils.showToast('简历信息有误');
                  }
                },
                child: Image.asset(
                  _isCollected?'images/img_heart_focus.png':'images/img_heart_unfocus.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _menuOperate,
                child: Image.asset(
                  'images/img_report.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(24),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  NetUtils.validateLogin(context,
                      isLogin: Application.sp.get('recruiterId') != null, callback: () {
                        shareJob();
                      });
                },
                child: Image.asset(
                  'images/img_share.png',
                  width: ScreenUtil().setWidth(36),
                  height: ScreenUtil().setWidth(36),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(48),
              ),
            ],
          ),offstage: widget.resumeDetailType==ResumeDetailType.readOnly,)
        ),
        body: _resumeDetailData == null
            ? Container(
          height: ScreenUtil().setWidth(400),
          alignment: Alignment.center,
          child: CupertinoActivityIndicator(),
        ) :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
               color: Color.fromRGBO(245, 245, 245, 1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(48)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child: Text(
                            '${_resumeDetailData.resume.realName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          ),),
                          Row(children: <Widget>[
                            Text(
                              '期望薪资',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(22),
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(176,181,180,1),
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(12)),
                            Text(
                              '${_resumeDetailData.resume.minSalary}-${_resumeDetailData.resume.maxSalary}K',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(36),
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(68,77,151,1),
                              ),
                            ),
                          ])
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(14)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Text("${_resumeDetailData.resume.address}",
                              style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(1==_resumeDetailData.resume.sex?"男":"女",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                              ),
                              Container(color: Color.fromRGBO(127, 127, 127, 1),
                                 height: ScreenUtil().setHeight(20),
                                 width: ScreenUtil().setWidth(1)
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                              ),
                              Text("${_resumeDetailData.resume.workDateName}",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                              ),
                              Container(color: Color.fromRGBO(127, 127, 127, 1),
                                 height: ScreenUtil().setHeight(20),
                                 width: ScreenUtil().setWidth(1)
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                              ),
                              Text("${_resumeDetailData.resume.educationName}",
                                 style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24))
                              ),
                              
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(48), bottom: ScreenUtil().setHeight(29)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("个人信息",
                             style: TextStyle(color: Color.fromRGBO(57,57,57,1), fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w500)
                          ),
                          Expanded(child: Text("$_jobState",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.w300)
                          ),),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text("工作经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: workExperiences,
                        
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(38), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("项目经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: projectExperiences,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(44), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("教育经历",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: educationExperiences,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(44), bottom: ScreenUtil().setHeight(41)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                      Text("个人主页",
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(12)),
                      Text(_resumeDetailData.resume.socialHomepage.replaceAll(',', '\n'),
                        style: TextStyle(color: Color.fromRGBO(95,94,94,1), fontSize: ScreenUtil().setSp(28)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40), bottom: ScreenUtil().setHeight(59)),
                        color: Color.fromRGBO(159,199,235,1),
                        height: ScreenUtil().setHeight(1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Offstage(child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(48),
                    right: ScreenUtil().setWidth(48),
                  ),
                  child: Row(
                    //2020 0403 下面的按钮不一定都存在，要根据跳转界面的功能进行隐藏、显示下面的按钮
                    children: _bottomOperateView,
                  ),
                )
            ),offstage: widget.resumeDetailType==ResumeDetailType.readOnly,),
          ],
        ));
  }

  /// 获取人才简历
  void getResumeDetail(String resumeId) async {
    MainResumeModel.instance.getResumeDetail(context, resumeId).then((resume){
      if (resume.data != null) {
        _getJobState(resume.data.resume.jobSeekerId);
        _starId=resume.data.starId;
        setState(() {
          _isCollected=(_starId!=null&&_starId.isNotEmpty);
          _resumeDetailData=resume.data;
        });
      }
    });
  }

  /// 获取求职状态
  _getJobState(String id) {
    MineModel.instance
        .getJobState(context, id)
        .then((model) {
      if (model != null) {
        setState(() {
          _jobState = model;
        });
      }
    });
  }

  /// 收藏夹操作
  _operateStar(String id,String starId) async {
    CollectionEntity _baseEntity = await BossMineModel.instance.starSeeker(
        context,id,Application.sp.getString('recruiterId'),starId:(_isCollected?starId:''));
    if (_baseEntity != null) {
//      Utils.showToast(_baseEntity.msg ?? (_isCollected?'取消收藏':'已收藏'));
      setState(() {
        _starId=_baseEntity.data;
        _isCollected=!_isCollected;
      });
    }
  }

  /// 获取岗位列表
  _getJobList(bool isFirstLoad) {
    BossMineModel.instance.getJobList(context, Application.sp.getString('recruiterId'),1,pageSize: 100).then((model){
      if(model!=null&&!isFirstLoad){
        _showJobList();
      }
    });
  }

  _menuOperate(){
    NetUtils.validateLogin(context,
        isLogin: Application.sp.get('recruiterId') != null, callback: () {
          showDialog(
            context: context,
            builder: (context) {
              return RemindColDialog(
                items: _menuItem,
                itemColor: Color.fromRGBO(
                    57, 57, 57, 1),
                cancelText: '取消',
                cancelColor: Color.fromRGBO(
                    159, 199, 235, 1),
                cancel: () {
                  Navigator.pop(context);
                },
                itemClick: (index) {
                  Navigator.pop(context);
                  switch (index) {
                    case 0:
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Report(reportType: ReportType.resume,reportId: widget.resumeId,)));
                      break;
                    case 1:
                      showDialog(
                          context: context,
                          builder: (context) {
                            return RemindDialog(
                              title: '确定屏蔽该人才吗？',
                              titleColor: Color.fromRGBO(57, 57, 57, 1),
                              content: '系统将不会再向您推荐该人才',
                              contentColor: Color.fromRGBO(57, 57, 57, 1),
                              cancelText: '取消',
                              cancelColor: Color.fromRGBO(
                                  142, 190, 245, 1),
                              confirmText: '确定',
                              confirmColor: Color.fromRGBO(
                                  142, 190, 245, 1),
                              cancel: () {
                                Navigator.pop(context);
                              },
                              confirm: () {
                                Navigator.pop(context);
                                _shieldResume(_resumeDetailData.resume.jobSeekerId);
                              },
                            );
                          });
                      break;
                  }
                },
              );
            },);
        });
  }

  /// 屏蔽人才
  _shieldResume(String id) async {
    BaseRespEntity _baseEntity = await BossMineModel.instance.shieldSeeker(
        context, id,Application.sp.getString('recruiterId'));
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '已屏蔽');
    }
  }

  /// 显示工作列表
  _showJobList() {
    if(BossMineModel.instance.jobList.length<1){
      Utils.showToast("您还未发布岗位，请先发布岗位");
      return;
    }
    if(BossMineModel.instance.jobList.length==1){
      _saveCandidate(BossMineModel.instance.jobList[0], _resumeDetailData.resume.jobSeekerId, _resumeDetailData.resume.id);
      return;
    }
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return null;
      },
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, widget) {
        final curvedValue =
            Curves.easeInOut.transform(animation1.value) - 1.0;
        return Transform(
          transform:
          Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: ListMenuDialog(
              title: '选择岗位',
              cancel: () {
                Navigator.pop(context);
              },
              confirm: () {
                Navigator.pop(context);
              },
              itemSelected: (index) {
                Navigator.pop(context);
                _saveCandidate(BossMineModel.instance.jobList[index], _resumeDetailData.resume.jobSeekerId, _resumeDetailData.resume.id);
              },
              lists: BossMineModel.instance.jobList.map((e) => e.jobName).toList(),
            ),
          ),
        );
      },
    );
  }
  /// 添加、更新候选人信息
  _saveCandidate(BossJobManageDataRecord job,String jobSeekerId,String resumeId) async {
    CandidateUpdateData _baseEntity = await BossMineModel.instance
        .saveCandidate(context,job.id,jobSeekerId,resumeId,1);
    if (_baseEntity != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CandidateBossRoom(jobData: job,candidateData: _baseEntity,resumeData: _resumeDetailData,)));
    }
  }
}

class FlexButton extends StatelessWidget {
  
  final int flex;
  final String btnTitle;
  final Function onPressed;
  
  FlexButton({this.flex = 1, this.btnTitle, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: flex,
      child: Container(
         alignment: Alignment.center,
         margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(14),
            left: ScreenUtil().setHeight(10),
            right: ScreenUtil().setHeight(10),
         ),
         child: MaterialButton(
           minWidth: ScreenUtil().setWidth(652),
           onPressed: () {
             if(onPressed!=null){
               onPressed();
             }
           },
           textColor: Color.fromRGBO(159,199,235,1),
           child: Text(btnTitle),
           padding: EdgeInsets.symmetric(horizontal: 7, vertical: 12),
           shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              side: const BorderSide(
                 color: Color.fromRGBO(159, 199, 235, 1),
                 width: 1
              )
           ),
         )),
    );
  }


}
