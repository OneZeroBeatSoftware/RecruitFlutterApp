import 'package:flutter/material.dart';

class BossChatRoomIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          clipBehavior: Clip.antiAlias,
          semanticContainer: false,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        'images/avatar_14.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text('Bingo',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              SizedBox(width: 8),
                              Text('20-30K',
                                  style: const TextStyle(
                                      wordSpacing: 1,
                                      letterSpacing: 1,
                                      fontSize: 14,
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
                              Flexible(
                                  child: Text('求职期望',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          wordSpacing: 1,
                                          letterSpacing: 1,
                                          fontSize: 13,
                                          color: Colors.grey[600]))),
                              SizedBox(width: 8),
                              Text('全栈工程师',
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      letterSpacing: 1,
                                      fontSize: 13,
                                      color: Colors.grey[600])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Text('6年 本科 28岁',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 13,
                          color: Colors.grey[600])),),
                  SizedBox(
                    width: 8,
                  ),

                  Text('在职-暂不考虑',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 13,
                          color: Color.fromRGBO(189, 190, 192, 1))),
                ],),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'PC、H5、Nodejs、小程序、移动端，掌握大前端所有技术栈；能够实现类Element-ui组件库，设计Vue组件；掌握Vue/React源码，MVVM库原理；了解Koa2源码，定制MVC开发框架；前端监控、性能优化、安全；自动化测试、发布、运维。',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    wordSpacing: 2,
                    letterSpacing: 1,
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                Container(
                  color: Color.fromRGBO(232, 234, 235, 1),
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                Text(
                  '12月16日 20:49 由你发起沟通',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(184, 186, 188, 1)),
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text('全栈工程师',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(width: 8),
                    Text('20-30K',
                        style: const TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(70, 192, 182, 1))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
