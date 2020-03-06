import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_list.dart';

class CompanyRowItem extends StatelessWidget {
  final Company company;
  final int index;
  final bool lastItem;

  const CompanyRowItem({Key key, this.company, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final companyItem = Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(32),
        left: ScreenUtil().setWidth(48),
        right: ScreenUtil().setWidth(48),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().setWidth(50))),
                child: Image.asset('images/ic_ask_resume_action.png',
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setWidth(100),
                    fit: BoxFit.cover),
              ),
              SizedBox(width: ScreenUtil().setWidth(32)),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          company.name,
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
                        '在线',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(176, 181, 180, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setWidth(10)),
                  Text(
                    '福州 仓山区 金山',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setWidth(20)),
                  Wrap(
                    spacing: ScreenUtil().setWidth(12),
                    runSpacing: ScreenUtil().setWidth(12),
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(138),
                        height: ScreenUtil().setWidth(40),
                        padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(10)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(1000),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(1),
                          ),
                        ),
                        child: Text(
                          '${company.status}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),

                      Container(
                        width: ScreenUtil().setWidth(138),
                        height: ScreenUtil().setWidth(40),
                        padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(10)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(1000),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(1),
                          ),
                        ),
                        child: Text(
                          '${company.scale}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),

                      Container(
                        width: ScreenUtil().setWidth(138),
                        height: ScreenUtil().setWidth(40),
                        padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(10)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(1000),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(159, 199, 235, 1),
                            width: ScreenUtil().setWidth(1),
                          ),
                        ),
                        child: Text(
                          '${company.type}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setWidth(38)),
                ],
              ))
            ],
          ),
          Container(
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(159, 199, 235, 1),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(32),top: ScreenUtil().setWidth(20),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '招聘岗位: ',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          color: Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '平面设计师/美术指导',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                        ),
                      ),
                      Text(
                        '等7个岗位',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          color: Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(22),
                ),
                Image.asset('images/img_arrow_right_blue.png',
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setWidth(20),
                    fit: BoxFit.cover)
              ],
            ),
          ),
        ],
      ),
    );

//    if (lastItem) {
//      return card;
//    }
//    if (lastItem) {
//      return companyItem;
//    }
    return Column(
      children: <Widget>[
        companyItem,
        Container(
          height: ScreenUtil().setWidth(4),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
      ],
    );
  }
}
