import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/model/msg_type.dart';
import 'package:recruit_app/widgets/network_image.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MsgInterviewItem extends StatefulWidget {
  final GlobalKey<SlideButtonState> btnKey;
  final SeekerInterviewDataRecord interview;
  final int index;
  final Function(int) deleteItem;
  final MsgType msgType;

  const MsgInterviewItem({Key key, @required this.btnKey,@required this.interview, this.deleteItem,@required this.index, this.msgType=MsgType.seeker}) : super(key: key);

  @override
  _MsgInterviewItemState createState() => _MsgInterviewItemState();
}

class _MsgInterviewItemState extends State<MsgInterviewItem> {
  @override
  Widget build(BuildContext context) {
    String status='';
    switch (widget.interview.state) {
      case "0":
        status='已删除';
        break;
      case "1":
        status=widget.msgType==MsgType.recruiter?'已收到':'已投递';
        break;
      case "2":
        status=widget.msgType==MsgType.recruiter?'邀请':'收到的邀请';
        break;
      case "3":
        status='待面试';
        break;
      case "4":
        status='已面试';
        break;
      case "5":
        status=widget.msgType==MsgType.recruiter?'拒绝':'被拒绝';
        break;
      case "6":
        status='通过';
        break;
      case "7":
        status='沟通过';
        break;
      case "8":
        status='候选';
        break;
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[SlideButton(
      key: widget.btnKey,
      singleButtonWidth: ScreenUtil().setWidth(116),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(38),
          left: ScreenUtil().setWidth(48),
          right: ScreenUtil().setWidth(48),
          bottom: ScreenUtil().setWidth(38),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(ScreenUtil().setWidth(44))),
              child: NetImage(img:'${widget.interview.avatar}',placeholder:'images/ic_ask_resume_action.png',error:'images/ic_ask_resume_action.png',size:ScreenUtil().setWidth(88)),
            ),
            SizedBox(width: ScreenUtil().setWidth(32)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${widget.interview.jobName}(${widget.interview.minSalary}-${widget.interview.maxSalary}K)',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(36),
                              color: Color.fromRGBO(20, 20, 20, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Text(
                          '$status',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setWidth(10)),
                    Text(
                      '${widget.interview.companyName}邀请您参与面试',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_time_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${DateUtil.formatDateMs(
                                          widget.interview.interviewDate,
                                          format: "yyyy-MM-dd HH:mm")}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(16),
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_call_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${widget.interview.phone}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(16),
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/img_location_gray.png',
                                    width: ScreenUtil().setWidth(26),
                                    height: ScreenUtil().setWidth(26),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${widget.interview.address}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color.fromRGBO(95, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      buttons: <Widget>[
        buildAction(widget.btnKey, Colors.red, () {
          widget.btnKey.currentState.close();
          if(widget.deleteItem!=null){
            widget.deleteItem(widget.index);
          }
        }),
      ],
    ),  Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        height: ScreenUtil().setWidth(6)),],);
  }

  InkWell buildAction(
      GlobalKey<SlideButtonState> key, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          'images/img_del_white.png',
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(38),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
