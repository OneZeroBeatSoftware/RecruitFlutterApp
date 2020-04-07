import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/seeker_notice_entity.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class NotifyDetail extends StatefulWidget {
  final SeekerNoticeDataRecord notice;

  const NotifyDetail({Key key, this.notice}) : super(key: key);

  @override
  _NotifyDetailState createState() => _NotifyDetailState();
}

class _NotifyDetailState extends State<NotifyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(25),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(2),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.notice.noticeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(57, 57, 57, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Text(
                  DateUtil.formatDateMs(widget.notice.createDate,format: "MM-dd HH:mm"),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22),
                    color: Color.fromRGBO(176, 181, 180, 1),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
                vertical: ScreenUtil().setWidth(54),
              ),
              physics: BouncingScrollPhysics(),
              child: Text(
                widget.notice.content,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  height: 1.4,
                  color: Color.fromRGBO(95, 94, 94, 1),),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
