import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/resume_detail_entity.dart';

class QualifyItem extends StatelessWidget {
  final ResumeDetailDataCertificate resumeDetailDataCertificate;
  const QualifyItem({Key key, this.resumeDetailDataCertificate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(17)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text('${resumeDetailDataCertificate.certificateName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    wordSpacing: 1,
                    letterSpacing: 1,
                    fontSize: ScreenUtil().setSp(28),
                    color: Color.fromRGBO(95, 94, 94, 1))),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(16),
          ),
          Image.asset(
            'images/img_arrow_right_blue.png',
            width: ScreenUtil().setWidth(10),
            height: ScreenUtil().setWidth(20),
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
