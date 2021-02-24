import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/boss_info_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/me_list.dart';
import 'package:recruit_app/model/msg_type.dart';
import 'package:recruit_app/pages/boss/boss_base_info.dart';
import 'package:recruit_app/pages/boss/boss_collection.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/job_manage.dart';
import 'package:recruit_app/pages/mine/about_soft.dart';
import 'package:recruit_app/pages/mine/feedback.dart';
import 'package:recruit_app/pages/setting/setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/mine/communicate.dart';
import 'package:recruit_app/pages/mine/mine_interview.dart';
import 'package:recruit_app/pages/boss/company_post_recruit.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/network_image.dart';

class BossMine extends StatefulWidget {
  @override
  _BossMineState createState() {
    // TODO: implement createState
    return _BossMineState();
  }
}

class _BossMineState extends State<BossMine> {
  List<Me> options = MeOptions.loadBossOptions();
  BossInfoData _mineInfoData;
  String _userName='';
  String _avatar='';

  @override
  void initState() {
    // TODO: implement initState
    _userName=Application.sp.getString('recruiterName')??'';
    _avatar=Application.sp.getString('recruiterAvatar')??'';
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _getMainInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          IconButton(
             icon: Image.asset(
               'images/img_setting_white.png',
               width: 24,
               height: 24,
             ),
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Setting(),
                 ),
               );
             }),
        ],
        backgroundColor: Color.fromRGBO(68, 77, 151, 1),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                     left: ScreenUtil().setWidth(48),
                     right: ScreenUtil().setWidth(48),
                     bottom: ScreenUtil().setWidth(48),
                     top: ScreenUtil().setWidth(30)),
                  color: Color.fromRGBO(68, 77, 151, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(onTap: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push<BossBaseInfoResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BossBaseInfo(
                                  id: _mineInfoData != null ? _mineInfoData
                                      .recruiter.id : '',
                                  avatar: _avatar,
                                  userName: _userName,),),).then((value) {
                          if (value != null && _mineInfoData != null) {
                            setState(() {
                              _avatar=value.avatar;
                              _userName=value.userName;
                            });
                          }
                        });
                      },child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _userName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(48),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(15),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(70),
                            ),
                            child: NetImage(img: _avatar,placeholder: 'images/img_icon_harden.png',error: 'images/img_icon_harden.png',size: ScreenUtil().setWidth(140),),
                          )
                        ],
                      ),behavior: HitTestBehavior.opaque,),
                      SizedBox(
                        height: ScreenUtil().setWidth(56),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '沟通过',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                  Flexible(child: Text(
                                    '(${_mineInfoData!=null?_mineInfoData.applyCount3:0})',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => CommunicateJob(),
                                   )
                                );
                              },
                            ),
                          ),
                         // Container(
                         //   margin: EdgeInsets.symmetric(
                         //     horizontal: ScreenUtil().setWidth(10),
                         //   ),
                         //   width: ScreenUtil().setWidth(1),
                         //   height: ScreenUtil().setHeight(28),
                         //   color: Colors.white,
                         // ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '面试',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),
                                  Flexible(child: Text(
                                    '(${_mineInfoData!=null?_mineInfoData.applyCount1:0})',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color.fromRGBO(227, 226, 226, 1),
                                      fontSize: ScreenUtil().setSp(28),
                                    ),
                                  ),),
                                ],
                              ),
                              onTap: () {
//                                Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                      builder: (context) => MineInterView()));
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => MineInterView(msgType: MsgType.recruiter,)));
                              },
                            ),
                          ),
                        Expanded(flex: 1,
                          child: Text(""))
//                          Container(
//                            margin: EdgeInsets.symmetric(
//                              horizontal: ScreenUtil().setWidth(10),
//                            ),
//                            width: ScreenUtil().setWidth(1),
//                            height: ScreenUtil().setHeight(28),
//                            color: Colors.white,
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: GestureDetector(
//                              behavior: HitTestBehavior.opaque,
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
//                                children: <Widget>[
//                                  Text(
//                                    '待面试',
//                                    maxLines: 1,
//                                    overflow: TextOverflow.ellipsis,
//                                    style: TextStyle(
//                                      color: Color.fromRGBO(227, 226, 226, 1),
//                                      fontSize: ScreenUtil().setSp(28),
//                                    ),
//                                  ),
//                                  Text(
//                                    '(13)',
//                                    maxLines: 1,
//                                    overflow: TextOverflow.ellipsis,
//                                    style: TextStyle(
//                                      color: Color.fromRGBO(227, 226, 226, 1),
//                                      fontSize: ScreenUtil().setSp(28),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              onTap: () {
//                                Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                      builder: (context) => MineInterView()));
//                              },
//                            ),
//                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
              ],
            ),
          ),
          SliverList(
             delegate: SliverChildBuilderDelegate((context, index) {
               return Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   GestureDetector(
                     behavior: HitTestBehavior.opaque,
                     child: Padding(
                       padding: EdgeInsets.symmetric(
                         horizontal: ScreenUtil().setWidth(48),
                         vertical: ScreenUtil().setHeight(20),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Image.asset(
                             options[index].imgPath,
                             width: ScreenUtil().setWidth(40),
                             height: ScreenUtil().setWidth(40),
                             fit: BoxFit.cover,
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
                           ),
                           Expanded(
                             child: Text(
                               options[index].itemName,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 1,
                               style: TextStyle(
                                   color: Color.fromRGBO(57, 57, 57, 1),
                                   fontSize: ScreenUtil().setSp(32)),
                             ),
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
                           ),
                           Text(
                             options[index].itemStatus,
                             overflow: TextOverflow.ellipsis,
                             maxLines: 1,
                             style: TextStyle(
                               color: Color.fromRGBO(194, 203, 202, 1),
                               fontSize: ScreenUtil().setSp(24),
                             ),
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(20),
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
                       if (index == 0) {
                         if(_mineInfoData==null||_mineInfoData.recruiter==null||_mineInfoData.recruiter.companyId==null||_mineInfoData.recruiter.companyId.isEmpty) {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => CompanyInfo())).then((value){
                                     _getMainInfo();
                           });
                           return;
                         }
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => CompanyInfo(companyId:_mineInfoData.recruiter.companyId)));
                       } else if (index == 1) {
                         if(_mineInfoData==null||_mineInfoData.recruiter==null) {
                           Utils.showToast('正在获取个人信息，请稍后再试');
                           return;
                         }
                         if(_mineInfoData.recruiter.companyId==null||_mineInfoData.recruiter.companyId.isEmpty) {
                           Utils.showToast('请先完善公司信息');
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => CompanyInfo())).then((value){
                             _getMainInfo();
                           });
                           return;
                         }
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => CompanyPostRecruit(companyId: _mineInfoData.recruiter.companyId,recruitName: _mineInfoData.recruiter.realName,)));
                       } else if (index == 2) {
                         if(_mineInfoData==null||_mineInfoData.recruiter==null) {
                           Utils.showToast('正在获取个人信息，请稍后再试');
                           return;
                         }
                         if(_mineInfoData.recruiter.companyId==null||_mineInfoData.recruiter.companyId.isEmpty) {
                           Utils.showToast('请先完善公司信息');
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => CompanyInfo())).then((value){
                             _getMainInfo();
                           });
                           return;
                         }
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => JobManage(companyId: _mineInfoData.recruiter.companyId,recruitName: _mineInfoData.recruiter.realName,)));
                       } else if (index == 3) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => BossCollectionJob(title: '收藏夹',type: BossCollectionType.star,)));
                       } else if (index == 4) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => BossCollectionJob(title: '黑名单',type: BossCollectionType.shield,)));
                       }
                       else if (index == 5) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => CraftFeedback()));
                       } else if (index == 6) {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => AboutSoft()));
                       }
                     },
                   ),
                   Container(
                     color: Color.fromRGBO(159, 199, 235, 1),
                     height: (index == 5 || index == options.length - 1)
                        ? ScreenUtil().setWidth(1)
                        : 0,
                     width: ScreenUtil().setWidth(654),
                     margin: EdgeInsets.only(top: ScreenUtil().setHeight((index == 5 || index == options.length - 1)
                        ? 20 : 0),
                     bottom: ScreenUtil().setHeight((index == 5 || index == options.length - 1)
                        ? 19 : 0)),
                   
                   )
                 ],
               );
             }, childCount: options.length)),
          SliverToBoxAdapter(
            child: Container(
              margin:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48)),
              height: ScreenUtil().setHeight(20)
            ),
          ),
        ],
      ),
    );
  }

  /// 获取招聘者主页信息
  _getMainInfo() async{
    BossInfoData mineInfoData=await BossMineModel.instance.getRecruiterInfo(context, Application.sp.get('recruiterId'));
    if(mineInfoData!=null){
      Application.sp.setString('recruiterName', mineInfoData.recruiter.realName);
      Application.sp.setString('recruiterAvatar', mineInfoData.recruiter.avatar);
      setState(() {
        _avatar=mineInfoData.recruiter.avatar;
        _userName=mineInfoData.recruiter.realName;
        _mineInfoData=mineInfoData;
      });
    }
  }
}