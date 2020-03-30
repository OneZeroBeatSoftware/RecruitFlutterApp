import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyInfoDialog extends Dialog {
  final Function() cancel;

  CompanyInfoDialog({
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
                            child: Image.asset(
                              'images/timg1.png',
                              width: ScreenUtil().setWidth(124),
                              height: ScreenUtil().setWidth(124),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(44),
                          ),
                          Text(
                            '福建艾乐科技有限公司',
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
                              CompanyInfoItem(type: '企业法人　　', content: '小明同学'),
                              CompanyInfoItem(type: '注册资金　　', content: '100亿美金'),
                              CompanyInfoItem(
                                  type: '注册时间　　', content: '2020-01-01'),
                              CompanyInfoItem(
                                  type: '经营状态　　', content: '存续（在营业、开业、在册）'),
                              CompanyInfoItem(
                                  type: '注册地址　　', content: '美国洛杉矶唐人街2020号0118室'),
                              CompanyInfoItem(
                                  type: '统一信用代码', content: '123456789ABCDEFG'),
                              CompanyInfoItem(
                                  type: '经营范围　　',
                                  content:
                                      '计算机软硬件的开发及销售；网络技术、网络产品的研发及销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）'),
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
