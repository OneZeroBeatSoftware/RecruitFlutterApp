import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/me_list.dart';
import 'package:recruit_app/pages/mine/collection.dart';
import 'package:recruit_app/pages/mine/comunicate.dart';
import 'package:recruit_app/pages/mine/focus_company_list.dart';
import 'package:recruit_app/pages/mine/job_intent.dart';
import 'package:recruit_app/pages/mine/online_resume.dart';
import 'package:recruit_app/pages/mine/send_resume.dart';

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
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '狐说',
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
                                  GestureDetector(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'images/icon_compile.png',
                                          width: 13,
                                          height: 13,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '我的在线简历',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlineResume()));
                                    },
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'images/avatar_15.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              )
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
                                              ComunicateJob()));
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
                                      '已投简历',
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
                                              SendResumeJob()));
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
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
                                              CollectionJob()));
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
                GestureDetector(
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
                              builder: (context) => FocusCompanyList()));
                    } else if (index == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobIntent()));
                    }
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
