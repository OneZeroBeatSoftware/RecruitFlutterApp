import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/boss_apply_list_entity.dart';
import 'package:recruit_app/widgets/network_image.dart';

class BossCommunicateItem extends StatelessWidget {
  final BossApplyListDataRecord resume;
  final int index;
  final bool lastItem;

  const BossCommunicateItem({Key key, this.resume, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resumeItem = Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(48),
        right: ScreenUtil().setWidth(48),
        top: ScreenUtil().setWidth(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(22)),
                        child: NetImage(img: '${resume.avatar}',placeholder: 'images/avatar_${index % 16 + 1}.png',error: 'images/avatar_${index % 16 + 1}.png',size: ScreenUtil().setWidth(44),),
                      ),
                      SizedBox.fromSize(size: Size(ScreenUtil().setWidth(12), ScreenUtil().setHeight(12))),
                      Container(
                        child:Text(
                          resume.realName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(36),
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(20,20,20,1)),
                        ),
                        constraints: BoxConstraints(minWidth: ScreenUtil().setWidth(50), maxWidth: ScreenUtil().setWidth(350)),

                      ),
                      SizedBox.fromSize(size: Size(ScreenUtil().setWidth(12), ScreenUtil().setHeight(12))),
                      Text(
                        "在线",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(176,181,180,1)),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(16), left: ScreenUtil().setWidth(56)),
                    child:Text(
                      '${resume.resumeName}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(57,57,57,1)),
                    ),
                    constraints: BoxConstraints(minWidth: ScreenUtil().setWidth(150), maxWidth: ScreenUtil().setWidth(350)),

                  ),
                  SizedBox.fromSize(size: Size(ScreenUtil().setWidth(1), ScreenUtil().setWidth(10))),
                  Container(height: ScreenUtil().setHeight(36), child:
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      ),
                      Text(
                        1==resume.sex?'男':'女',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(95,94,94,1)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                      ),
                      Container(color: Color.fromRGBO(127, 127, 127, 1),
                          height: ScreenUtil().setHeight(20),
                          width: ScreenUtil().setWidth(1)
                      )
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                      ),
                      Text(
                        '${resume.workDateName}',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(95,94,94,1)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                      ),
                      Container(color: Color.fromRGBO(127, 127, 127, 1),
                          height: ScreenUtil().setHeight(20),
                          width: ScreenUtil().setWidth(1)
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                      ),
                      Text(
                        '${resume.educationName}',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(95,94,94,1)),
                      ),
                    ],
                  )
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${resume.minSalary}-${resume.maxSalary}K',
                    style: TextStyle(
                      color: Color.fromRGBO(68,77,151,1),
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],

          ),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setWidth(34),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(1),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(15)),
            child: Text(
              '${DateUtil.formatDateMs(resume.applyDate,format:"yyyy年MM月dd日HH:mm")}由您发起沟通',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(176, 181, 180, 1),
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        resumeItem,
        Container(
          height: ScreenUtil().setWidth(6),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
      ],
    );
  }
}
