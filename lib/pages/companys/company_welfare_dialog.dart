import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyWelfareDialog extends Dialog {
  final Function() cancel;
  final List<WelfareData> welfareList;

  CompanyWelfareDialog(
    this.welfareList, {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/img_welfare_remind.png',
                                width: ScreenUtil().setWidth(35),
                                height: ScreenUtil().setWidth(35),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(8),
                              ),
                              Expanded(
                                child: Text(
                                  '福利信息由公司提供，可能根据实际岗位由所不同，具体岗位可与BOSS或HR确认。',
                                  style: TextStyle(
                                    letterSpacing: ScreenUtil().setWidth(2),
                                    wordSpacing: ScreenUtil().setWidth(2),
                                    height: 1.5,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(176, 181, 180, 1),
                                    fontSize: ScreenUtil().setSp(24),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setWidth(38),
                              bottom: ScreenUtil().setWidth(66),
                            ),
                            height: ScreenUtil().setWidth(1),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                          Text(
                            '工作时间',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(57, 57, 57, 1),
                              fontSize: ScreenUtil().setSp(36),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(25),
                          ),
                          Text(
                            'AM 09:00 - PM 06:00',
                            style: TextStyle(
                              color: Color.fromRGBO(95, 94, 94, 1),
                              fontSize: ScreenUtil().setSp(32),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setWidth(66),
                              bottom: ScreenUtil().setWidth(66),
                            ),
                            height: ScreenUtil().setWidth(1),
                            color: Color.fromRGBO(159, 199, 235, 1),
                          ),
                          Text(
                            '员工福利',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(57, 57, 57, 1),
                              fontSize: ScreenUtil().setSp(36),
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.symmetric(vertical:ScreenUtil().setWidth(33)),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (index < welfareList.length) {
                                return WelfareItem(
                                  welfareData: welfareList[index],
                                );
                              }
                              return null;
                            },
                            itemCount: welfareList.length,
                          )
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

class WelfareItem extends StatelessWidget {
  final WelfareData welfareData;

  const WelfareItem({Key key, this.welfareData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                welfareData.imgPath,
                width: ScreenUtil().setWidth(60),
                height: ScreenUtil().setWidth(60),
                fit: BoxFit.contain,
              ),
              SizedBox(width: ScreenUtil().setWidth(50),),
              Expanded(
                child:  Text(
                  welfareData.type,
                  style: TextStyle(
                    letterSpacing: ScreenUtil().setWidth(2),
                    wordSpacing: ScreenUtil().setWidth(2),
                    height: 1.5,
                    color: Color.fromRGBO(95, 94, 94, 1),
                    fontSize: ScreenUtil().setSp(32),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: ScreenUtil().setWidth(110),),
              Expanded(
                child:  Text(
                  welfareData.content,
                  style: TextStyle(
                    letterSpacing: ScreenUtil().setWidth(2),
                    wordSpacing: ScreenUtil().setWidth(2),
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(176, 181, 180, 1),
                    fontSize: ScreenUtil().setSp(28),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WelfareData {
  final String type;
  final String content;
  final String imgPath;

  WelfareData(this.type, this.content, this.imgPath);
}
