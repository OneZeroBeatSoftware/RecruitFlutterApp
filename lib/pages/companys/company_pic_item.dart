import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_pic_list.dart';

class CompanyPicItem extends StatelessWidget {
  final CompanyPicData picData;
  final int index;
  final bool isLastItem;

  const CompanyPicItem({Key key, this.picData, this.index, this.isLastItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picItem = ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
      child: Image.asset(picData.picPath,width: ScreenUtil().setWidth(300),height: ScreenUtil().setWidth(200),fit: BoxFit.cover,),
    );

    if(isLastItem){
      return picItem;
    }

    return Row(
      children: <Widget>[
        picItem,
        SizedBox(
          width: ScreenUtil().setWidth(12),
        ),
      ],
    );
  }
}
