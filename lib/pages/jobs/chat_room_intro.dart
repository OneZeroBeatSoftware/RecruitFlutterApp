import 'package:flutter/material.dart';

class ChatRoomIntro extends StatelessWidget {
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
                    Expanded(
                      child: Text('apm高级产品经理',
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
                    Text('20-30K•14薪',
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
                        child: Text('腾讯科技',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 13,
                                color: Colors.grey[600]))),
                    SizedBox(width: 8),
                    Text('已上市',
                        style: TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 13,
                            color: Colors.grey[600])),
                  ],
                ),
                SizedBox(
                  height: 8,
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
                              fontSize: 10, color: Colors.grey[600]))),
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
                              fontSize: 10, color: Colors.grey[600]))),
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
                              fontSize: 10, color: Colors.grey[600]))),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'images/avatar_1.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Flexible(
                        child: Text('胡京茹',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                letterSpacing: 1,
                                wordSpacing: 1,
                                fontSize: 12,
                                color: Colors.grey[600]))),
                    Text('•招聘者',
                        style: TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 12,
                            color: Colors.grey[600])),
                  ],
                ),
                Container(
                  color: Color.fromRGBO(232, 234, 235, 1),
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  '12月16日 20:49 由你发起沟通',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(184, 186, 188, 1)),
                ),
              ],
            ),
          ),
        ));
  }
}
