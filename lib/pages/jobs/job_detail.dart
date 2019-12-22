import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/jobs/chat_room.dart';

class JobDetail extends StatefulWidget {
  @override
  _JobDetailState createState() {
    // TODO: implement createState
    return _JobDetailState();
  }
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset(
                'images/ic_back_arrow.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  'images/ic_action_favor_off_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'images/ic_action_share_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'images/ic_action_report_black.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 18, bottom: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text('apm高级产品经理',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 38, 39, 1))),
                          ),
                          SizedBox(width: 8),
                          Text('20-30K•14薪',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(70, 192, 182, 1))),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('上海',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(46, 47, 48, 1))),
                          SizedBox(width: 8),
                          Text('5-10年',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(46, 47, 48, 1))),
                          SizedBox(width: 8),
                          Text('本科',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(46, 47, 48, 1))),
                        ],
                      ),
                      Container(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        height: 1,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Image.asset('images/avatar_1.png',
                                width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text('胡京茹',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(37, 38, 39, 1))),
                                  ),
                                  SizedBox(width: 8),
                                  Text('今日活跃',
                                      style: const TextStyle(
                                          wordSpacing: 1,
                                          letterSpacing: 1,
                                          fontSize: 14,
                                          color: Color.fromRGBO(
                                              181, 182, 183, 1))),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text('腾讯•招聘者',
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      letterSpacing: 1,
                                      fontSize: 14,
                                      color: Color.fromRGBO(46, 47, 48, 1))),
                            ],
                          )),
                        ],
                      ),
                      Container(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        height: 1,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                      ),
                      Text('职位详情',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(37, 38, 39, 1))),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          '岗位要求：\n1、产品行业动态研究，竞品分析，挖掘产品价值，规划产品方向；\n2、规划产品的迭代方向、迭代计划并形成可执行的产品路线图；\n3、负责产品功能原型设计、PRD文档编写，进行需求管理、研发进度管理；\n4、产品运营数据追踪并优化，形成迭代闭环；\n5、产品定价及交付流程设计、优化；\n6、重点客户拜访、需求对接、功能验证、客户培训。',
                          style: const TextStyle(
                              wordSpacing: 2,
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Color.fromRGBO(108, 109, 110, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '任职要求：\n1、五年及以上工作经，3年及以上产品经验；\n2、有全局观，具备较强的产品规划能力；\n3、对数据敏感，有数据分析经验；\n4、了解APM、性能调优原理，具备性能管理监控类产品，有项目管理或研发或测试经验优先。',
                          style: const TextStyle(
                              wordSpacing: 2,
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Color.fromRGBO(108, 109, 110, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(spacing: 6, runSpacing: 6, children: <Widget>[
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('策略产品',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('大数据产品',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('性能管理',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('性能监控',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('性能测试',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            child: Text('客户端测试',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]))),
                      ]),
                      Container(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        height: 1,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: Image.asset(
                                  'images/ic_ask_resume_action.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('腾讯科技（上海有限公司）',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(37, 38, 39, 1))),
                                SizedBox(height: 5),
                                Text('已上市•10000人以上•互联网',
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 14,
                                        color: Color.fromRGBO(46, 47, 48, 1))),
                              ],
                            )),
                            SizedBox(width: 15),
                            Image.asset('images/ic_arrow_gray.png',
                                width: 10, height: 10, fit: BoxFit.cover)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompanyDetail()));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset('images/img_location_example.png',
                            height: 200, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: MaterialButton(
                    color: Color.fromRGBO(70, 192, 182, 1),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatRoom()));
                    },
                    textColor: Colors.white,
                    child: Text("立即沟通"),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  )),
            ),
          ],
        ));
  }
}
