import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/me_list.dart';
import 'package:recruit_app/pages/mine/black_list.dart';
import 'package:recruit_app/pages/mine/collection.dart';
import 'package:recruit_app/pages/mine/communicate.dart';
import 'package:recruit_app/pages/mine/focus_company_list.dart';
import 'package:recruit_app/pages/mine/job_intent.dart';
import 'package:recruit_app/pages/mine/mine_interview.dart';
import 'package:recruit_app/pages/mine/online_resume.dart';
import 'package:recruit_app/pages/mine/send_resume.dart';
import 'package:recruit_app/pages/setting/setting.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<Mine> {
  List<Me> options = MeOptions.loadOptions();

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
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '哈哈哈哈哈登',
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
                        child: Image.asset(
                          'images/img_icon_harden.png',
                          width: ScreenUtil().setWidth(140),
                          height: ScreenUtil().setWidth(140),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
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
                                '已投递',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(227, 226, 226, 1),
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                              Text(
                                '(18)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(227, 226, 226, 1),
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendResumeJob()));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(28),
                        color: Colors.white,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '待面试',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(227, 226, 226, 1),
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                              Text(
                                '(15)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(227, 226, 226, 1),
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MineInterView()));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(28),
                        color: Colors.white,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                              Text(
                                '(13)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(227, 226, 226, 1),
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommunicateJob()));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer<IdentityModel>(
                  builder: (context, model, child) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(48),
                          vertical: ScreenUtil().setWidth(40),
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
                        if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Collection()));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobIntent()));
                        } else if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnlineResume()));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlackList()));
                        } else if (index == 4) {
                          model.changeIdentity(
                              model.identity == Identity.employee
                                  ? Identity.boss
                                  : Identity.employee);
                        }
                      },
                    );
                  },
                ),
                Container(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  height: (index == 3 || index == options.length - 1)
                      ? ScreenUtil().setWidth(1)
                      : 0,
                )
              ],
            );
          }, childCount: options.length)),
          SliverToBoxAdapter(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(48)),
              height: ScreenUtil().setWidth(50),
            ),
          ),
        ],
      ),
    );
  }
}
