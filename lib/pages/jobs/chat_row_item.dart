import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/chat_list.dart';

class ChatRowItem extends StatelessWidget {
  final Chat chat;
  final int index;

  const ChatRowItem({
    Key key,
    this.chat,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
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
                          textAlign: TextAlign.center,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                  fontSize: 13,
                                  color: Colors.grey[600]))),
                      SizedBox(width: 8),
                      Text('已上市',
                          textAlign: TextAlign.center,
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
                        fontSize: 14, color: Color.fromRGBO(184, 186, 188, 1)),
                  ),
                ],
              ),
            ),
          ));
    } else if ((index - 1) % 2 == 0) {
      return Padding(
        padding: EdgeInsets.only(left: 50, bottom: 15, top: 15, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 188, 173, 1),
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  chat.content,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                chat.sender,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(right: 50, bottom: 15, top: 15, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                chat.sender,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  chat.content,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(0, 188, 173, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
