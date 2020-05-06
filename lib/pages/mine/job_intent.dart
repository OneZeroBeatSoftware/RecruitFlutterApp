import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/pages/mine/job_intent_edit.dart';
import 'package:recruit_app/pages/mine/job_intent_item.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class JobIntent extends StatefulWidget {
  final int intentNum;
  final int maxIntent;
  const JobIntent({Key key, this.intentNum=0, this.maxIntent=0}) : super(key: key);
  @override
  _JobIntentState createState() {
    // TODO: implement createState
    return _JobIntentState();
  }
}

class _JobIntentState extends State<JobIntent> {
  int _intentNum = 0;
  int _maxIntent = 0;
  String _jobState='';
  int _selStatePos=0;
  String _selStateId='';
  @override
  void initState() {
    // TODO: implement initState
    _intentNum=widget.intentNum;
    _maxIntent=widget.maxIntent;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _getIntentList();
      _getJobState();
      _getJobStateList();
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
                                child: Text('添加求职岗位',
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
                                        text: '$_intentNum',
                                        style: TextStyle(
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                            fontSize: ScreenUtil().setSp(32),
                                            color:
                                                Color.fromRGBO(95, 94, 94, 1))),
                                    TextSpan(
                                        text: '/$_maxIntent',
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
                            '添加多个求职岗位，更快速获得就业机会',
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
                                child: Text('求职期望',
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
                                behavior: HitTestBehavior.opaque, onTap: () {
                                if (_intentNum < _maxIntent) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => JobIntentEdit(limit: '$_intentNum/$_maxIntent',))).then((value){
                                        if(value!=null&&value=='success'){
                                          _getIntentList();
                                        }
                                  });
                                  return;
                                }
                                Utils.showToast('最多添加$_maxIntent个求职期望！');
                              },
                                child: Image.asset(
                                  'images/img_setting_add.png',
                                  width: ScreenUtil().setWidth(30),
                                  height: ScreenUtil().setWidth(30),
                                  fit: BoxFit.cover,
                                ),),
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
                        if (index < MineModel.instance.intentList.length) {
                          var key = GlobalKey<SlideButtonState>();
                          return GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    JobIntentEdit(
                                      limit: '$_intentNum/$_maxIntent',
                                      intentData: MineModel.instance
                                          .intentList[index],
                                      isModify: true,))).then((value) {
                              if (value != null && value == 'success') {
                                _getIntentList();
                              }
                            });
                          },behavior: HitTestBehavior.opaque,child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(20),
                                horizontal: ScreenUtil().setWidth(48)),
                            child: JobIntentItem(
                              deleteIntent: (index){
                                _deleteIntent(MineModel.instance.intentList[index].id, index);
                              },
                              intentData: MineModel.instance.intentList[index],
                              index: index,
                              btnKey: key,
                            ),),);
                        }
                        return null;
                      },
                      childCount: MineModel.instance.intentList.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(40)),
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(48),
                                right: ScreenUtil().setWidth(48),
                                top: ScreenUtil().setWidth(20),
                                bottom: ScreenUtil().setWidth(48)),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromRGBO(159, 199, 235, 1),
                                  width: ScreenUtil().setWidth(1),),
                                bottom: BorderSide(
                                  color: Color.fromRGBO(159, 199, 235, 1),
                                  width: ScreenUtil().setWidth(1),),),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '求职状态',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(57, 57, 57, 1),
                                        fontSize: ScreenUtil().setSp(32)),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  '$_jobState',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Color.fromRGBO(176, 181, 180, 1),
                                      fontSize: ScreenUtil().setSp(24),),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(16),
                                ),
                                Image.asset(
                                  'images/img_arrow_right_blue.png',
                                  width: ScreenUtil().setWidth(10),
                                  height: ScreenUtil().setWidth(20),
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _setJobState();
                          },
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),);
  }

  /// 设置求职状态
  _setJobState() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftPicker(
          confirm: (selPos) {
            Navigator.pop(context);
            setState(() {
              _selStatePos = selPos;
              _selStateId = MineModel.instance.jobStateList[selPos].id;
              _jobState = MineModel.instance.jobStateList[selPos].name;
            });
          },
          title: '求职状态',
          pickList: MineModel.instance.jobStateList.map((item)=>item.name).toList(),
          selIdx: _selStatePos,
        );
      },
    );
  }

  /// 获取求职状态
  _getJobState(){
    MineModel.instance.getJobState(context, Application.sp.get('jobSeekerId')).then((model){
      if(model!=null){
        setState(() {
          _jobState=model;
        });
      }
    });
  }

  /// 获取求职期望
  _getIntentList(){
    MineModel.instance.getIntentList(context, Application.sp.get('jobSeekerId')).then((model){
      if(model!=null){
        setState(() {
          _intentNum=model.intentList.length;
        });
      }
    });
  }

  /// 获取全部求职状态
  _getJobStateList(){
    MineModel.instance.getJobStateList(context).then((model){
      if(model!=null){
        setState(() {
        });
      }
    });
  }

  /// 删除求职期望
  _deleteIntent(String id,int index) async {
    BaseRespEntity _baseEntity = await MineModel.instance
        .deleteIntent(context,id);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??'删除成功');
      MineModel.instance.intentList.removeAt(index);
      setState(() {
        _intentNum=MineModel.instance.intentList.length;
      });
    }
  }
}
