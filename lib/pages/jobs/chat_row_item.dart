import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/chat_list.dart';
import 'package:recruit_app/pages/employe/boss_chat_room_intro.dart';
import 'package:recruit_app/pages/jobs/chat_room_intro.dart';

class ChatRowItem extends StatelessWidget {
  final Chat chat;
  final int index;
  final bool isBoss;

  const ChatRowItem({
    Key key,
    this.chat,
    this.index,
    this.isBoss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {

      return isBoss?BossChatRoomIntro():ChatRoomIntro();
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
