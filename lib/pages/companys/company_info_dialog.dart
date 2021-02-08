import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/widgets/network_image.dart';

class CompanyInfoDialog extends Dialog {
  final CompanyDetailData detailData;
  final Function() cancel;

  CompanyInfoDialog(this.detailData, {
    @required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets + EdgeInsets.only(top: 56),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil().setWidth(30)),
                  topRight: Radius.circular(ScreenUtil().setWidth(30)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(48),
                      right: ScreenUtil().setWidth(48),
                      top: ScreenUtil().setWidth(48),
                      bottom: ScreenUtil().setWidth(56),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: cancel,
                      child: Image.asset(
                        'images/img_cancel_gray.png',
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setWidth(24),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(48)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil().setWidth(50),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                ScreenUtil().setWidth(15),
                              ),
                            ),
                            child:NetImage(img: '${detailData.company.avatar}',placeholder:'images/ic_ask_resume_action.png',error: 'images/ic_ask_resume_action.png',size: ScreenUtil().setWidth(124),),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(44),
                          ),
                          Text(
                            '${detailData.company.companyName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(20, 20, 20, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(36)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setWidth(70),
                              bottom: ScreenUtil().setWidth(48),
                            ),
                            height: ScreenUtil().setWidth(1),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                          ListView(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              // CompanyInfoItem(type: '企业法人　　', content: '${detailData.company.legalPerson}'),
                              // CompanyInfoItem(type: '注册资金　　', content: '${detailData.company.registerCapital}'),
                              // CompanyInfoItem(
                              //     type: '注册时间　　', content: '${DateUtil.formatDateStr(detailData.company.registerDate,format: 'yyyy-MM-dd')}'),
                              CompanyInfoItem(
                                  type: '经营状态　　', content: '${detailData.company.managementName}'),
                              // CompanyInfoItem(
                              //     type: '注册地址　　', content: '${detailData.company.registerAddress}'),
                              // CompanyInfoItem(
                              //     type: '统一信用代码', content: '${detailData.company.unifiedCreditCode}'),
                              // CompanyInfoItem(
                              //     type: '经营范围　　',
                              //     content:'${detailData.company.scope}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyInfoItem extends StatelessWidget {
  final String type;
  final String content;

  const CompanyInfoItem({Key key, this.type, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            type,
            style: TextStyle(
              letterSpacing: ScreenUtil().setWidth(2),
              wordSpacing: ScreenUtil().setWidth(2),
              height: 1.5,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(176, 181, 180, 1),
              fontSize: ScreenUtil().setSp(26),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(36),
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                letterSpacing: ScreenUtil().setWidth(2),
                wordSpacing: ScreenUtil().setWidth(2),
                height: 1.5,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(176, 181, 180, 1),
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
