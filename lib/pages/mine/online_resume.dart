import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/mine/edu_item.dart';
import 'package:recruit_app/pages/mine/job_personal_info.dart';
import 'package:recruit_app/pages/mine/job_project_exp.dart';
import 'package:recruit_app/pages/mine/job_work_exp.dart';
import 'package:recruit_app/pages/mine/project_item.dart';
import 'package:recruit_app/pages/mine/qualify_item.dart';
import 'package:recruit_app/pages/mine/work_item.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

import 'job_edu_exp.dart';

class OnlineResume extends StatefulWidget {
  final String resumeId;

  const OnlineResume({Key key, this.resumeId=''}) : super(key: key);
  @override
  _OnlineResumeState createState() {
    // TODO: implement createState
    return _OnlineResumeState();
  }
}

class _OnlineResumeState extends State<OnlineResume> {
  bool _isLoad=false;
  ResumeDetailData _detailData;
  TextEditingController _resumeNameController;

  @override
  void initState() {
    // TODO: implement initState
    _detailData = ResumeDetailData()
      ..resume = (ResumeDetailDataResume()
        ..id = ''
        ..maxSalary = "0"
        ..minSalary = '0'
        ..sex = 1
        ..resumeName = ''
        ..realName = ''
        ..jobSeekerId = ''
        ..address = ''
        ..state = 0
        ..workDate = ''
        ..education = 0
        ..birthDate = 0
        ..defaultResume = 0
        ..educationExperienceId = ''
        ..graduationDate = 0
        ..projectExperienceId = ''
        ..workExperienceId = '')
      ..educationExperience = []
      ..projectExperience = []
      ..workExperience = [];
    _resumeNameController=TextEditingController(text: _detailData.resume.resumeName);

    _isLoad=widget.resumeId!=null&&widget.resumeId.isNotEmpty;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      if(_isLoad){
        _getResumeDetail(widget.resumeId);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_resumeNameController!=null){
      _resumeNameController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '我的在线简历',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
          child: Image.asset(
            'images/img_setting_preview.png',
            width: ScreenUtil().setWidth(30),
            height: ScreenUtil().setWidth(40),
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        top: false,
        child: _isLoad?Center(heightFactor: 20,child: CupertinoActivityIndicator(),):Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(48),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(38),
                    bottom: ScreenUtil().setWidth(40),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    '${_detailData.resume.realName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40),
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(20, 20, 20, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfo()));
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: Image.asset(
                                    'images/img_edit_resume_gray.png',
                                    width: ScreenUtil().setWidth(30),
                                    height: ScreenUtil().setWidth(30),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(12),
                            ),
                            Text(
                              '5年经验•26岁•本科',
                              style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: ScreenUtil().setSp(28),
                                color: Color.fromRGBO(95, 94, 94, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(16),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(54),
                        ),
                        child: Image.asset(
                          'images/avatar_15.png',
                          width: ScreenUtil().setWidth(108),
                          height: ScreenUtil().setWidth(108),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(30),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        '简历名称',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                      TextField(
                        controller: _resumeNameController,
                        autofocus: false,
                        scrollPadding: EdgeInsets.all(0),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        cursorColor: Color.fromRGBO(176, 181, 180, 1),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color.fromRGBO(95, 94, 94, 1)),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(34),
                            bottom: ScreenUtil().setWidth(40),
                          ),
                          border: InputBorder.none,
//                          focusedBorder: UnderlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Color.fromRGBO(159, 199, 235, 1),
//                              width: ScreenUtil().setWidth(1),
//                            ),
//                          ),
//                          enabledBorder: UnderlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Color.fromRGBO(159, 199, 235, 1),
//                              width: ScreenUtil().setWidth(1),
//                            ),
//                          ),
                          hintText: '请填写简历名称',
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color.fromRGBO(176, 181, 180, 1),
                          ),
                        ),
                        onSubmitted: (text) {},
                      ),
                    ],
                  ),
                ),
//                SizedBox(
//                  height: ScreenUtil().setWidth(40),
//                ),
//                Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        '个人优势',
//                        maxLines: 1,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                          fontSize: ScreenUtil().setSp(32),
//                          fontWeight: FontWeight.bold,
//                          color: Color.fromRGBO(57, 57, 57, 1),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      width: ScreenUtil().setWidth(16),
//                    ),
//                    GestureDetector(
//                      onTap: () {},
//                      behavior: HitTestBehavior.opaque,
//                      child: Image.asset(
//                        'images/img_edit_resume_gray.png',
//                        width: ScreenUtil().setWidth(30),
//                        height: ScreenUtil().setWidth(30),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ],
//                ),
//                SizedBox(
//                  height: ScreenUtil().setWidth(16),
//                ),
//                Text('五年产品运营经验，时刻关注行业新动态，有项目管理经验，产品设计经验。',
//                    style: TextStyle(
//                        wordSpacing: 1,
//                        letterSpacing: 1,
//                        fontSize: ScreenUtil().setSp(24),
//                        color: Color.fromRGBO(176, 181, 180, 1))),
//                Container(
//                  margin:
//                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(40)),
//                  color: Color.fromRGBO(159, 199, 235, 1),
//                  height: ScreenUtil().setWidth(1),
//                ),
                SizedBox(height: ScreenUtil().setWidth(40),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '工作经历',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobWorkExp()));
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'images/img_setting_add.png',
                        width: ScreenUtil().setWidth(30),
                        height: ScreenUtil().setWidth(30),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(17),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < _detailData.workExperience.length) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return SlideButton(
                        key: btnKey,
                        singleButtonWidth: ScreenUtil().setWidth(172),
                        child: WorkItem(
                          workData: _detailData.workExperience[index],
                          index: index,
                        ),
                        buttons: <Widget>[
                          buildAction(
                              btnKey, Colors.red, 'images/img_del_white.png',
                                  () {
                                btnKey.currentState.close();
                              }),
                        ],
                      );
                    }
                    return null;
                  },
                  shrinkWrap: true,
                  itemCount: _detailData.workExperience.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '项目经历',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobProjectExp()));
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'images/img_setting_add.png',
                        width: ScreenUtil().setWidth(30),
                        height: ScreenUtil().setWidth(30),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(17),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < _detailData.projectExperience.length) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return SlideButton(
                        key: btnKey,
                        singleButtonWidth: ScreenUtil().setWidth(172),
                        child: ProjectItem(
                          projectData: _detailData.projectExperience[index],
                          index: index,
                        ),
                        buttons: <Widget>[
                          buildAction(
                              btnKey, Colors.red, 'images/img_del_white.png',
                                  () {
                                btnKey.currentState.close();
                              }),
                        ],
                      );
                    }
                    return null;
                  },
                  shrinkWrap: true,
                  itemCount: _detailData.projectExperience.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '教育经历',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobEduExp()));
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'images/img_setting_add.png',
                        width: ScreenUtil().setWidth(30),
                        height: ScreenUtil().setWidth(30),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(17),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < _detailData.educationExperience.length) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return SlideButton(
                        key: btnKey,
                        singleButtonWidth: ScreenUtil().setWidth(172),
                        child: EduItem(
                          eduData: _detailData.educationExperience[index],
                          index: index,
                        ),
                        buttons: <Widget>[
                          buildAction(
                              btnKey, Colors.red, 'images/img_del_white.png',
                                  () {
                                btnKey.currentState.close();
                              }),
                        ],
                      );
                    }
                    return null;
                  },
                  shrinkWrap: true,
                  itemCount: _detailData.educationExperience.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '资格证书',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'images/img_setting_add.png',
                        width: ScreenUtil().setWidth(30),
                        height: ScreenUtil().setWidth(30),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(17),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < 1) {
                      var btnKey = GlobalKey<SlideButtonState>();
                      return SlideButton(
                        key: btnKey,
                        singleButtonWidth: ScreenUtil().setWidth(172),
                        child: QualifyItem(),
                        buttons: <Widget>[
                          buildAction(
                              btnKey, Colors.red, 'images/img_del_white.png',
                                  () {
                                btnKey.currentState.close();
                              }),
                        ],
                      );
                    }
                    return null;
                  },
                  shrinkWrap: true,
                  itemCount: 1,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                Text(
                  '社交主页',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  autofocus: false,
                  scrollPadding: EdgeInsets.all(0),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  cursorColor: Color.fromRGBO(176, 181, 180, 1),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(95, 94, 94, 1)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(34),
                      bottom: ScreenUtil().setWidth(34),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    hintText: '请输入网址',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(80),
                ),
                MaterialButton(
                  elevation: 0,
                  color: Colors.white,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  textColor: Color.fromRGBO(159, 199, 235, 1),
                  child: Text(
                    "设为默认",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(30),
                    vertical: ScreenUtil().setWidth(20),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(1000))),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildAction(GlobalKey<SlideButtonState> key, Color color,
      String imgPath, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          imgPath,
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(30),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// 获取简历详情
  _getResumeDetail(String id){
    MineModel.instance.getResumeDetail(context, id).then((detail){
      if(detail!=null){
        _resumeNameController.text=detail.resume.resumeName;
        setState(() {
          _isLoad=false;
          _detailData=detail;
        });
      }else {
        Utils.showToast('简历详情有误，请重试！');
        setState(() {
          _isLoad=false;
        });
      }
    });
  }
}
