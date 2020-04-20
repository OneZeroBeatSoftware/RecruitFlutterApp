import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/mine/online_resume.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

import '../../application.dart';
import 'job_resume_item.dart';

class ResumeList extends StatefulWidget {
  final int resumeNum;
  final int maxResume;
  const ResumeList({Key key, this.resumeNum=0, this.maxResume=0}) : super(key: key);
  @override
  _ResumeListState createState() {
    // TODO: implement createState
    return _ResumeListState();
  }
}

class _ResumeListState extends State<ResumeList> {
  int _resumeNum = 0;
  int _maxResume = 0;
  @override
  void initState() {
    // TODO: implement initState
    _resumeNum=widget.resumeNum;
    _maxResume=widget.maxResume;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _getResumeList();
    });
  }
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
            '简历列表',
            style: TextStyle(
                color: Color.fromRGBO(68, 77, 151, 1),
                fontSize: ScreenUtil().setSp(36),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
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
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(48),
                        right: ScreenUtil().setWidth(48),
                        top: ScreenUtil().setWidth(54),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text('添加求职简历',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        wordSpacing: 2,
                                        letterSpacing: 2,
                                        fontSize: ScreenUtil().setSp(40),
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(20, 20, 20, 1))),
                              ),
                              SizedBox(width: ScreenUtil().setWidth(16)),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '$_resumeNum',
                                        style: TextStyle(
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                            fontSize: ScreenUtil().setSp(32),
                                            color:
                                                Color.fromRGBO(95, 94, 94, 1))),
                                    TextSpan(
                                        text: '/$_maxResume',
                                        style: TextStyle(
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                            fontSize: ScreenUtil().setSp(32),
                                            color:
                                                Color.fromRGBO(95, 94, 94, 1))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(14),
                          ),
                          Text(
                            '完善简历，有助于您更快找到工作',
                            style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                              fontSize: ScreenUtil().setSp(28),
                              color: Color.fromRGBO(176, 181, 180, 1),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(56),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text('新增简历',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        wordSpacing: 2,
                                        letterSpacing: 2,
                                        fontSize: ScreenUtil().setSp(32),
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(57, 57, 57, 1))),
                              ),
                              SizedBox(width: ScreenUtil().setWidth(30)),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (_resumeNum < _maxResume) {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => OnlineResume()))
                                        .then((value) {
                                      if (value != null && value == 'success') {
                                        _getResumeList();
                                      }
                                    });
                                    return;
                                  }
                                  Utils.showToast('最多添加$_maxResume份简历！');
                                },
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
                            height: ScreenUtil().setWidth(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < MineModel.instance.resumeList.length) {
                          var key = GlobalKey<SlideButtonState>();
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OnlineResume(
                                        resumeId: MineModel.instance
                                            .resumeList[index].id,),),).then((
                                  value) {
                                if (value != null && value == 'success') {
                                  _getResumeList();
                                }
                              });
                            },
                            child: JobResumeItem(
                              resumeData: MineModel.instance.resumeList[index],
                              index: index,
                              btnKey: key,
                              deleteResume: (index){
                                _deleteResume(MineModel.instance.resumeList[index].id, index);
                              },
                            ),
                          );
                        }
                        return null;
                      },
                      childCount: MineModel.instance.resumeList.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(48),
                          right: ScreenUtil().setWidth(48),
                          top: ScreenUtil().setWidth(20),
                          bottom: ScreenUtil().setWidth(48)),
                      height: ScreenUtil().setWidth(1),
                      color: Color.fromRGBO(159, 199, 235, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  /// 获取简历列表
  _getResumeList(){
    MineModel.instance.getResumeList(context, Application.sp.get('jobSeekerId')).then((model){
      if(model!=null){
        setState(() {
          _resumeNum=model.resumeList.length;
        });
      }
    });
  }

  /// 删除简历
  _deleteResume(String id,int index) async {
    BaseRespEntity _baseEntity = await MineModel.instance
        .deleteResume(context,id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??'删除成功');
      MineModel.instance.resumeList.removeAt(index);
      setState(() {
        _resumeNum=MineModel.instance.resumeList.length;
      });
    }
  }
}
