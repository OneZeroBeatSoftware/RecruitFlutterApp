import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/intent_list_entity.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class JobIntentItem extends StatelessWidget {
  final GlobalKey<SlideButtonState> btnKey;

  final IntentListData intentData;
  final int index;
  final Function(int) deleteIntent;

  const JobIntentItem({Key key, this.intentData, this.index, this.btnKey, this.deleteIntent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideButton(
      key: btnKey,
      singleButtonWidth: ScreenUtil().setWidth(100),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('[${intentData.cityName}]${intentData.positionName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(28),
                          color: Color.fromRGBO(95, 94, 94, 1))),
                  SizedBox(height: ScreenUtil().setWidth(5)),
                  Text('${intentData.minSalary}-${intentData.maxSalary}K ${intentData.industryName}',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1))),
                ],
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(30)),
            Image.asset(
              'images/img_arrow_right_blue.png',
              width: ScreenUtil().setWidth(10),
              height: ScreenUtil().setWidth(20),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      buttons: <Widget>[
        buildAction(btnKey, Colors.red, 'images/img_setting_hide.png', () {
          btnKey.currentState.close();
        }),
        buildAction(btnKey, Colors.red, 'images/img_del_white.png', () {
          btnKey.currentState.close();
          if(deleteIntent!=null){
            deleteIntent(index);
          }
        }),
      ],
    );
  }

  InkWell buildAction(GlobalKey<SlideButtonState> key, Color color,
      String imgPath, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(87),
        color: color,
        child: Image.asset(
          imgPath,
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(30),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
