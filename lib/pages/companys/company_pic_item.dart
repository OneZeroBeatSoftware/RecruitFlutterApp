import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';

class CompanyPicItem extends StatelessWidget {
  final CompanyImage picData;
  final int index;
  final bool isLastItem;

  const CompanyPicItem({Key key, this.picData, this.index, this.isLastItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picItem = ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
      child: CachedNetworkImage(
          imageUrl: picData.companyImage,
          fit: BoxFit.cover,
          width: ScreenUtil().setWidth(300),
          height: ScreenUtil().setWidth(200),
          errorWidget: (context, url, error) {
            return Image.asset('images/img_job_ad.png',
                fit: BoxFit.cover,
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setWidth(200),);
          },
          placeholder: (context, url) {
            return Image.asset('images/img_job_ad.png',
                fit: BoxFit.cover,
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setWidth(200),);
          }),
    );

    if(isLastItem){
      return picItem;
    }

    return Row(
      children: <Widget>[
        picItem,
        SizedBox(
          width: ScreenUtil().setWidth(20),
        ),
      ],
    );
  }
}
