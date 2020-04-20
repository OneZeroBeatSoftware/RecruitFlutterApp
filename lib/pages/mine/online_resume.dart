import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/mine/edu_item.dart';
import 'package:recruit_app/pages/mine/job_personal_info.dart';
import 'package:recruit_app/pages/mine/job_project_exp.dart';
import 'package:recruit_app/pages/mine/job_work_exp.dart';
import 'package:recruit_app/pages/mine/project_item.dart';
import 'package:recruit_app/pages/mine/qualify_item.dart';
import 'package:recruit_app/pages/mine/resume_certificates.dart';
import 'package:recruit_app/pages/mine/resume_social_web.dart';
import 'package:recruit_app/pages/mine/social_web_item.dart';
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
  TextEditingController _minSalaryController;
  TextEditingController _maxSalaryController;

  @override
  void initState() {
    // TODO: implement initState
    _detailData = ResumeDetailData()
      ..resume = (ResumeDetailDataResume()
        ..workDateId = ''
        ..educationId = ''
        ..workDateName = ''
        ..educationName = ''
        ..age = ''
        ..id = ''
        ..maxSalary = "0"
        ..minSalary = '0'
        ..sex = -1
        ..resumeName = ''
        ..realName = ''
        ..jobSeekerId = ''
        ..minSalary=''
        ..maxSalary=''
        ..address = ''
        ..state = 0
        ..birthDate = DateUtil.getNowDateMs()
        ..workExp = DateUtil.getNowDateMs()
        ..defaultResume = 0
        ..educationExperienceId = ''
        ..graduationDate= DateUtil.getNowDateMs()
        ..projectExperienceId = ''
        ..workExperienceId = ''
        ..socialHomepage=''
      )
      ..educationExperience = []
      ..projectExperience = []
      ..workExperience = []
      ..certificates = []
      ..socialHomepage = [];
    _resumeNameController=TextEditingController(text: _detailData.resume.resumeName);
    _minSalaryController=TextEditingController(text: _detailData.resume.minSalary);
    _maxSalaryController=TextEditingController(text: _detailData.resume.maxSalary);

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
    if(_minSalaryController!=null){
      _minSalaryController.dispose();
    }
    if(_maxSalaryController!=null){
      _maxSalaryController.dispose();
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
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pop(context);
        },
        center: Text(
          '我的在线简历',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          if(_detailData.resume.realName==null||_detailData.resume.realName.isEmpty){
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_detailData.resume.sex==-1) {
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_detailData.resume.address==null||_detailData.resume.address.isEmpty){
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_detailData.resume.educationId==null||_detailData.resume.educationId.isEmpty){
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_detailData.resume.workDateId==null||_detailData.resume.workDateId.isEmpty){
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_detailData.resume.age==null||_detailData.resume.age.isEmpty){
            Utils.showToast('请先完善个人信息');
            return;
          }
          if(_resumeNameController.text.isEmpty){
            Utils.showToast('请填写简历名称');
            return;
          }
          if(_minSalaryController.text.isEmpty){
            Utils.showToast('请填写期望最低薪资');
            return;
          }
          if(_maxSalaryController.text.isEmpty){
            Utils.showToast('请填写期望最高薪资');
            return;
          }
          _saveResume();
        },child: Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
          child: Image.asset(
            'images/img_setting_preview.png',
            width: ScreenUtil().setWidth(30),
            height: ScreenUtil().setWidth(40),
            fit: BoxFit.contain,
          ),
        ),behavior: HitTestBehavior.opaque,),
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
                                    FocusScope.of(context).requestFocus(
                                        FocusNode());
                                    Navigator.push<PersonalInfoResult>(
                                        context, MaterialPageRoute(
                                        builder: (context) =>
                                            PersonalInfo(
                                                detailData: _detailData.resume))).then(personalInfoResult);
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
                              '${_detailData.resume.workDateName}•${_detailData.resume.age}•${_detailData.resume.educationName}',
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
                        onChanged: (text){
                          _detailData.resume.resumeName=text;
                        },
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
                SizedBox(height: ScreenUtil().setWidth(23),),
                buildTypeView(
                  '工作经历',
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < _detailData.workExperience.length) {
                        var btnKey = GlobalKey<SlideButtonState>();
                        return SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(172),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push<WorkExpResult>(context, MaterialPageRoute(
                                  builder: (context) => JobWorkExp(detailData: _detailData.workExperience[index],index: index,))).then(workExpResult);
                            },
                            behavior: HitTestBehavior.opaque,
                            child: WorkItem(
                              workData: _detailData.workExperience[index],
                              index: index,
                            ),
                          ),
                          buttons: <Widget>[
                            buildAction(
                                btnKey, Colors.red, 'images/img_del_white.png',
                                    () {
                                  btnKey.currentState.close();
                                  setState(() {
                                    _detailData.workExperience.removeAt(index);
                                  });
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
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<WorkExpResult>(context, MaterialPageRoute(
                        builder: (context) => JobWorkExp())).then(workExpResult);
                  },),
                buildTypeView(
                  '项目经历',
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < _detailData.projectExperience.length) {
                        var btnKey = GlobalKey<SlideButtonState>();
                        return SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(172),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push<ProjectExpResult>(context, MaterialPageRoute(
                                  builder: (context) => JobProjectExp(detailData: _detailData.projectExperience[index],index: index,))).then(projectExpResult);
                            },
                            behavior: HitTestBehavior.opaque,
                            child: ProjectItem(
                              projectData: _detailData.projectExperience[index],
                              index: index,
                            ),
                          ),
                          buttons: <Widget>[
                            buildAction(
                                btnKey, Colors.red, 'images/img_del_white.png',
                                    () {
                                  btnKey.currentState.close();
                                  setState(() {
                                    _detailData.projectExperience.removeAt(
                                        index);
                                  });
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
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<ProjectExpResult>(context, MaterialPageRoute(
                        builder: (context) => JobProjectExp())).then(projectExpResult);
                  },),
                buildTypeView(
                  '教育经历',
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < _detailData.educationExperience.length) {
                        var btnKey = GlobalKey<SlideButtonState>();
                        return SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(172),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push<EduExpResult>(context,
                                  MaterialPageRoute(builder: (context) =>
                                      JobEduExp(
                                        detailData: _detailData
                                            .educationExperience[index],
                                        index: index,))).then(eduExpResult);
                            },
                            behavior: HitTestBehavior.opaque,
                            child: EduItem(
                              eduData: _detailData.educationExperience[index],
                              index: index,
                            ),
                          ),
                          buttons: <Widget>[
                            buildAction(
                                btnKey, Colors.red, 'images/img_del_white.png',
                                    () {
                                  btnKey.currentState.close();
                                  setState(() {
                                    _detailData.educationExperience.removeAt(
                                        index);
                                  });
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
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<EduExpResult>(context,
                        MaterialPageRoute(builder: (context) => JobEduExp())).then(eduExpResult);
                  },),
                buildTypeView(
                  '资格证书',
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < _detailData.certificates.length) {
                        var btnKey = GlobalKey<SlideButtonState>();
                        return SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(172),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push<CertResult>(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ResumeCertificate(
                                        index: index,
                                        certificate: _detailData
                                            .certificates[index]
                                            .certificateName,
                                        certificateId: _detailData
                                            .certificates[index].id,))).then(
                                  certOperateResult);
                            },
                            behavior: HitTestBehavior.opaque,
                            child: QualifyItem(
                                resumeDetailDataCertificate: _detailData
                                    .certificates[index]),
                          ),
                          buttons: <Widget>[
                            buildAction(
                                btnKey, Colors.red, 'images/img_del_white.png',
                                    () {
                                  btnKey.currentState.close();
                                  setState(() {
                                    _detailData.certificates.removeAt(index);
                                  });
                                }),
                          ],
                        );
                      }
                      return null;
                    },
                    shrinkWrap: true,
                    itemCount: _detailData.certificates.length,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<CertResult>(context, MaterialPageRoute(
                        builder: (context) => ResumeCertificate())).then(
                        certOperateResult);
                  },),
                buildTypeView(
                  '社交主页',
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < _detailData.socialHomepage.length) {
                        var btnKey = GlobalKey<SlideButtonState>();
                        return SlideButton(
                          key: btnKey,
                          singleButtonWidth: ScreenUtil().setWidth(172),
                          child: GestureDetector(onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.push<SocialWebResult>(
                                context, MaterialPageRoute(
                                builder: (context) =>
                                    ResumeSocialWeb(
                                      web: _detailData.socialHomepage[index],
                                      index: index,))).then(socialWebResult);
                          },
                            child: SocialWebItem(
                                web: _detailData.socialHomepage[index]),
                            behavior: HitTestBehavior.opaque,),
                          buttons: <Widget>[
                            buildAction(
                                btnKey, Colors.red, 'images/img_del_white.png',
                                    () {
                                  btnKey.currentState.close();
                                  setState(() {
                                    _detailData.socialHomepage.removeAt(index);
                                  });
                                }),
                          ],
                        );
                      }
                      return null;
                    },
                    shrinkWrap: true,
                    itemCount: _detailData.socialHomepage.length,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<SocialWebResult>(
                        context, MaterialPageRoute(
                        builder: (context) =>
                            ResumeSocialWeb())).then(socialWebResult);
                  },),
                Text(
                  '薪资要求',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(100),
                      child: CupertinoTextField(
                        controller: _minSalaryController,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromRGBO(176, 181, 180, 1),
                        textAlign: TextAlign.center,
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          right: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setWidth(24),
                        ),
                        autofocus: false,
                        decoration: BoxDecoration(
                          border: Border(),
                        ),
                        style: TextStyle(
                          color: Color.fromRGBO(176, 181, 180, 1),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                        onChanged: (text){
                          _detailData.resume.minSalary=text;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(24),),
                      child: Text(
                        'K  —  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(95, 94, 94, 1),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(100),
                      child: CupertinoTextField(
                        controller: _maxSalaryController,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromRGBO(176, 181, 180, 1),
                        textAlign: TextAlign.center,
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          right: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setWidth(24),
                        ),
                        autofocus: false,
                        decoration: BoxDecoration(
                          border: Border(),
                        ),
                        style: TextStyle(
                          color: Color.fromRGBO(176, 181, 180, 1),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                        onChanged: (text){
                          _detailData.resume.maxSalary=text;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(24),),
                      child: Text(
                        'K之间',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(95, 94, 94, 1),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: ScreenUtil().setWidth(1),
                ),
                SizedBox(height: ScreenUtil().setWidth(34),),
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

  /// 简历内容类别
  Widget buildTypeView(String resumeItem,{@required Widget child,Function() onTap,}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                resumeItem,
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
                if(onTap!=null){
                  onTap();
                }
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
        child,
        Container(
          margin:
          EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(23)),
          color: Color.fromRGBO(159, 199, 235, 1),
          height: ScreenUtil().setWidth(1),
        ),
      ],
    );
  }

  /// 侧滑删除button
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

  /// 个人信息填写回调
  void personalInfoResult(PersonalInfoResult value) {
    if (value != null) {
      int workDate=(DateUtil.getNowDateMs()-value.workDate.millisecondsSinceEpoch)~/31536000000;
      int age=(DateUtil.getNowDateMs()-value.birthDate.millisecondsSinceEpoch)~/31536000000;
      setState(() {
        _detailData.resume.workDateId=value.workExpId;
        _detailData.resume.workDateName=value.workExp;
        _detailData.resume.age='$age岁';
        _detailData.resume.realName=value.name;
        _detailData.resume.sex=value.sex;
        _detailData.resume.birthDate=value.birthDate.millisecondsSinceEpoch;
        _detailData.resume.address=value.address;
        _detailData.resume.graduationDate=value.graduateDate.millisecondsSinceEpoch;
        _detailData.resume.educationId=value.eduId;
        _detailData.resume.educationName=value.eduName;
        _detailData.resume.workExp=value.workDate.millisecondsSinceEpoch;
      });
    }
  }

  /// 工作经历填写回调
  void workExpResult(WorkExpResult value) {
    if (value != null) {
      setState(() {
        if(value.index==-1){
          ResumeDetailDataWorkExperience workData=ResumeDetailDataWorkExperience();
          workData.id='';
          workData.resumeId=widget.resumeId;
          workData.department=value.section;
          workData.companyName=value.company;
          workData.positionId=value.positionId;
          workData.positionName=value.positionName;
          workData.industryId=value.industryId;
          workData.industryName=value.industryType;
          workData.startDate=value.startDate.millisecondsSinceEpoch;
          workData.endDate=value.endDate.millisecondsSinceEpoch;
          workData.state=1;
          _detailData.workExperience.add(workData);
        }else {
          _detailData.workExperience[value.index].department=value.section;
          _detailData.workExperience[value.index].companyName=value.company;
          _detailData.workExperience[value.index].industryId=value.industryId;
          _detailData.workExperience[value.index].industryName=value.industryType;
          _detailData.workExperience[value.index].positionId=value.positionId;
          _detailData.workExperience[value.index].positionName=value.positionName;
          _detailData.workExperience[value.index].startDate=value.startDate.millisecondsSinceEpoch;
          _detailData.workExperience[value.index].endDate=value.endDate.millisecondsSinceEpoch;
        }
      });
    }
  }

  /// 项目经历填写回调
  void projectExpResult(ProjectExpResult value){
    if (value != null) {
      setState(() {
        if(value.index==-1){
          ResumeDetailDataProjectExperience projectData=ResumeDetailDataProjectExperience();
          projectData.id='';
          projectData.resumeId=widget.resumeId;
          projectData.projectName=value.projectName;
          projectData.projectContent=value.content;
          projectData.industryId=value.industryId;
          projectData.industryName=value.industryType;
          projectData.startDate=value.startDate.millisecondsSinceEpoch;
          projectData.endDate=value.endDate.millisecondsSinceEpoch;
          projectData.state=1;
          _detailData.projectExperience.add(projectData);
        }else {
          _detailData.projectExperience[value.index].projectName=value.projectName;
          _detailData.projectExperience[value.index].projectContent=value.content;
          _detailData.projectExperience[value.index].industryId=value.industryId;
          _detailData.projectExperience[value.index].industryName=value.industryType;
          _detailData.projectExperience[value.index].startDate=value.startDate.millisecondsSinceEpoch;
          _detailData.projectExperience[value.index].endDate=value.endDate.millisecondsSinceEpoch;
        }
      });
    }
  }

  /// 教育经历填写回调
  void eduExpResult(EduExpResult value){
    if (value != null) {
      setState(() {
        if(value.index==-1){
          ResumeDetailDataEducationExperience eduData=ResumeDetailDataEducationExperience();
          eduData.id='';
          eduData.resumeId=widget.resumeId;
          eduData.school=value.school;
          eduData.educationId=value.eduId;
          eduData.educationName=value.eduLevel;
          eduData.specialty=value.profession;
          eduData.startDate=value.startDate.millisecondsSinceEpoch;
          eduData.endDate=value.endDate.millisecondsSinceEpoch;
          eduData.state=1;
          _detailData.educationExperience.add(eduData);
        }else {
          _detailData.educationExperience[value.index].school=value.school;
          _detailData.educationExperience[value.index].educationId=value.eduId;
          _detailData.educationExperience[value.index].educationName=value.eduLevel;
          _detailData.educationExperience[value.index].specialty=value.profession;
          _detailData.educationExperience[value.index].startDate=value.startDate.millisecondsSinceEpoch;
          _detailData.educationExperience[value.index].endDate=value.endDate.millisecondsSinceEpoch;
        }
      });
    }
  }

  /// 证书填写回调
  void certOperateResult(CertResult value){
    if (value != null) {
      setState(() {
        if(value.index==-1){
          ResumeDetailDataCertificate certData=ResumeDetailDataCertificate();
          certData.id='';
          certData.certificateName=value.certificate;
          certData.resumeId=_detailData.resume.id;
          certData.state=1;
          _detailData.certificates.add(certData);
        }else {
          _detailData.certificates[value.index].certificateName=value.certificate;
        }
      });
    }
  }

  /// 社交主页回调
  void socialWebResult(SocialWebResult value){
    if (value != null) {
      setState(() {
        if(value.index==-1){
          _detailData.socialHomepage.add(value.web);
        }else {
          _detailData.socialHomepage[value.index]=value.web;
        }
      });
    }
  }

  /// 获取简历详情
  _getResumeDetail(String id){
    MineModel.instance.getResumeDetail(context, id).then((detail){
      if(detail!=null){
        _minSalaryController.text=detail.resume.minSalary;
        _maxSalaryController.text=detail.resume.maxSalary;
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

  /// 保存更新简历
  _saveResume() async {
    BaseRespEntity _baseEntity = await MineModel.instance.saveResume(context,widget?.resumeId,_detailData);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??((widget.resumeId!=null&&widget.resumeId.isNotEmpty)?'修改成功':'添加成功'));
      Navigator.pop(context,'success');
    }
  }
}
