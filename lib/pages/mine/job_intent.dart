import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/job_intent_list.dart';
import 'package:recruit_app/pages/mine/job_intent_item.dart';

class JobIntent extends StatefulWidget {
  @override
  _JobIntentState createState() {
    // TODO: implement createState
    return _JobIntentState();
  }
}

class _JobIntentState extends State<JobIntent> {
  List<IntentData> _intentList = JobIntentList.loadJobIntent();

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
          centerTitle: true,
          title: Text('求职期望',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 38, 39, 1))),
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
                            child: Text('想找什么工作？',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 38, 39, 1))),
                          ),
                          SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: '${_intentList.length}',
                                    style: const TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(70, 192, 182, 1))),
                                TextSpan(
                                    text: '/3',
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(37, 38, 39, 1))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('添加多个求职期望，可获得更多精准高薪工作机会',
                          style: const TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 14,
                            color: Color.fromRGBO(164, 165, 166, 1),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          if (index < _intentList.length) {
                            return JobIntentItem(
                              intentData: _intentList[index],
                              index: index,
                            );
                          }
                          return null;
                        },
                        shrinkWrap: true,
                        itemCount: _intentList.length,
                        physics:const NeverScrollableScrollPhysics(),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '求职状态',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(37, 38, 39, 1),
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '在职-暂不考虑',
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
                        onTap: () {},
                      ),
                      Container(
                        color: Color.fromRGBO(242, 243, 244, 1),
                        height: 1,
                      )
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
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
                    },
                    textColor: Colors.white,
                    child: Text("添加期望"),
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
