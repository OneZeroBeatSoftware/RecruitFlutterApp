import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/me_list.dart';
import 'package:recruit_app/pages/boss/boss_collection.dart';
import 'package:recruit_app/pages/boss/boss_comunicate.dart';
import 'package:recruit_app/pages/boss/company_info.dart';
import 'package:recruit_app/pages/boss/job_manage.dart';

class BossMine extends StatefulWidget {
  @override
  _BossMineState createState() {
    // TODO: implement createState
    return _BossMineState();
  }
}

class _BossMineState extends State<BossMine> {
  List<Me> options = MeOptions.loadBossOptions();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Color.fromRGBO(70, 192, 182, 1),
              child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'images/avatar_2.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '黄小姐',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '零一跳动•招聘者',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '8',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '沟通过',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BossCommunicateJob()));
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '0',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '面试',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '8',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '收藏',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BossCollectionJob()));
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '0',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '影响力',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                                onTap: () {

                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
//            SliverAppBar(
//              pinned: true,
//              floating: false,
//              snap: false,
//              expandedHeight: 250.0,
//              title: Text('狐说'),
//              flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.parallax,
//                  background: SafeArea(
//                    top: true,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          color: Color.fromRGBO(0, 0, 0, 1),
//                          height: 56,
//                        )
//                      ],
//                    ),
//                  )),
//              backgroundColor: Color.fromRGBO(70, 192, 182, 1),
//              elevation: 2.0,
//              forceElevated: true,
//            ),
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              options[index].imgPath,
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                options[index].itemName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color.fromRGBO(39, 40, 41, 1),
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              options[index].itemStatus,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Color.fromRGBO(164, 165, 166, 1),
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'images/ic_arrow_gray.png',
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompanyInfo()));
                        } else if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobManage()));
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
                  color: Color.fromRGBO(245, 246, 246, 1),
                  height: (index == 1 ||
                          index == 3 ||
                          index == 4 ||
                          index == options.length - 1)
                      ? 1
                      : 0,
                )
              ],
            );
          }, childCount: options.length)),
          SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                '客服电话 400-666-6666 工作时间9:30-18:30',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromRGBO(188, 188, 188, 1), fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
