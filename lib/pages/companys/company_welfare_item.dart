import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_welfare_list.dart';

class CompanyWelfareItem extends StatelessWidget {
  final WelfareData welfareData;
  final int index;
  final bool isLastItem;

  const CompanyWelfareItem({Key key, this.welfareData, this.index,this.isLastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welfareItem = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(32),vertical: ScreenUtil().setWidth(26)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
          border: Border.all(
              width: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(255, 255, 255, 1),
              style: BorderStyle.solid)),
      child: Row(
        children: <Widget>[
          Image.asset(welfareData.imgPath,width: ScreenUtil().setWidth(40),height: ScreenUtil().setWidth(40),fit: BoxFit.contain,),
          SizedBox(width: ScreenUtil().setWidth(14),),
          Text(
            '${welfareData.welfare}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.white),
          ),
        ],
      ),
    );

    if(isLastItem){
      return welfareItem;
    }

    return Row(
      children: <Widget>[
        welfareItem,
        SizedBox(
          width: ScreenUtil().setWidth(16),
        ),
      ],
    );
  }
}
