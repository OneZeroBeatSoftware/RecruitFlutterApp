import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_pic_list.dart';
import 'package:recruit_app/model/company_welfare_list.dart';
import 'package:recruit_app/pages/companys/company_pic_item.dart';
import 'package:recruit_app/pages/companys/company_welfare_item.dart';

class CompanyDetail extends StatefulWidget {
  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  List<WelfareData> _welfareList = WelfareList.loadWelfareList();
  List<CompanyPicData> _picList = CompanyPicList.loadCompanyPicList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/bg_wjd_share_init.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 30,
              sigmaX: 30,
            ),
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          AppBar(
            leading: IconButton(
                icon: Image.asset(
                  'images/ic_action_back_white.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            automaticallyImplyLeading: false,
            centerTitle: true,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            title: Text(
              '公司详情',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Image.asset(
                    'images/ic_action_settings.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {}),
            ],
          ),
          SafeArea(
            top: true,
            child: Container(
              margin: EdgeInsets.only(top: kToolbarHeight),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('腾讯',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('已上市•10000人以上•互联网',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(181, 182, 183, 1))),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            child: Image.asset(
                                'images/ic_ask_resume_action.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Wrap(
                                spacing: 20,
                                runSpacing: 10,
                                children: <Widget>[
                                  Text('上午10:00-下午07:00',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                  Text('双休',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                  Text('弹性工作',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                ]),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('更多福利',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(181, 182, 183, 1))),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            'images/f3_right_arrow_white.png',
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _welfareList.length,
                            itemBuilder: (context, index) {
                              if (index < _welfareList.length) {
                                return CompanyWelfareItem(
                                  welfareData: _welfareList[index],
                                  index: index,
                                  isLastItem: index == _welfareList.length - 1,
                                );
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('公司介绍',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          '深圳市腾讯计算机系统有限公司成立于1998年11月，由马化腾、张志东、许晨晔、陈一丹、曾李青五位创始人共同创立。是中国最大的互联网综合服务提供商之一，也是中国服务用户最多的互联网企业之一。\n腾讯多元化的服务包括：社交和通信服务QQ及微信/WeChat、社交网络平台QQ空间、腾讯游戏旗下QQ游戏平台、门户网站腾讯网、腾讯新闻客户端和网络视频服务腾讯视频等。\n2004年腾讯公司在香港联交所主板公开上市（股票代号00700），董事会主席兼首席执行官是马化腾。',
                          style: const TextStyle(
                              wordSpacing: 2,
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('公司照片',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _picList.length,
                            itemBuilder: (context, index) {
                              if (index < _picList.length) {
                                return CompanyPicItem(
                                  picData: _picList[index],
                                  index: index,
                                  isLastItem: index == _picList.length - 1,
                                );
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('公司地址',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset('images/img_location_example.png',
                            height: 200, fit: BoxFit.cover),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text('公司还有9个其他办公地址',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('查看全部',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: Color.fromRGBO(181, 182, 183, 1))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('公司官网',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text('http://www.tencent.com',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'images/f3_right_arrow_white.png',
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('工商信息',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('公司全称',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color:  Colors.white)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text('腾讯科技（深圳）有限公司',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                        ],


                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('企业法人',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color:  Colors.white)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text('马化腾',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                        ],


                      ),


                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('注册时间',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color:  Colors.white)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text('2000-02-24',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                        ],


                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('注册资本',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color:  Colors.white)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text('200万美元',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                        ],


                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Text('查看全部',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Color.fromRGBO(181, 182, 183, 1))),

                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
