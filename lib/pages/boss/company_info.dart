import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/me_divider.dart';

class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() {
    // TODO: implement createState
    return _CompanyInfoState();
  }
}

class _CompanyInfoState extends State<CompanyInfo> {
  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Container(
           alignment: Alignment.center,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               SizedBox(
                 height: ScreenUtil().setHeight(7),
               ),
               Text('公司信息',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                     fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
               SizedBox(
                 height: 3,
               ),
             ],
           )),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        rightAction: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
              },
              child: Image.asset(
                'images/img_heart_focus.png',
                width: ScreenUtil().setWidth(36),
                height: ScreenUtil().setWidth(36),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
               color: Color.fromRGBO(245, 245, 245, 1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(48), right: ScreenUtil().setWidth(48), top: ScreenUtil().setWidth(54), bottom: ScreenUtil().setWidth(18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Row(children: <Widget>[
                              Text('一零跳动软件111111',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 2,
                                    fontSize: ScreenUtil().setSp(40),
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 38, 39, 1))
                              ),
                              SizedBox(width: ScreenUtil().setWidth(12)),
                              GestureDetector(
                                child: Image.asset('images/img_edit_resume_gray.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setWidth(30)),
                                onTap: () {print("dsd");},
                              ),
                            ],),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Text("已上线 1000人以上 o2o",
                               style: TextStyle(color: Color.fromRGBO(100,100,100,1),
                                  fontSize: ScreenUtil().setSp(28),
                                  fontWeight: FontWeight.w300,
                               ),
                            )
                          ],),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset('images/avatar_14.png', width: ScreenUtil().setWidth(140), height: ScreenUtil().setWidth(140)),
                          ),
                        ],
                      ),
                      Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(40), bottom: ScreenUtil().setHeight(40)),
                         color: Color.fromRGBO(159,199,235,1), constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("公司简介", 
                            style: TextStyle(
                              color: Color.fromRGBO(57,57,57,1),
                              fontSize: ScreenUtil().setSp(32),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),),
                          Image.asset('images/img_edit_resume_gray.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setWidth(30))
                        ]
                      ),
                      SizedBox(height: ScreenUtil().setSp(40)),
                      Text(
                         '公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设。公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: ScreenUtil().setSp(24),
                            color: Color.fromRGBO(95,94,94,1),
                          )),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      Item("公司地址", "福建省福州市仓山区博艺堂", canClick: true),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(400),
                        child: Text("地图"),
                        decoration: BoxDecoration(
                           border: Border.all(
                              color: Colors.blueGrey,
                              width: ScreenUtil().setWidth(1),
                              style: BorderStyle.solid,
                             
                           ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                         color: Color.fromRGBO(159,199,235,1),
                         constraints: BoxConstraints.expand(height: ScreenUtil().setHeight(1))),
                      Item("工作时间", "AM 09:00 -m 06:00", canClick: true),
                      
                      Item("员工福利", "", canClick: true, rightIcon:
                        Image.asset('images/boss_me_post_mrg.png',
                           width:ScreenUtil().setWidth(28),
                           height: ScreenUtil().setWidth(28)
                        )
                      ),
                      Item2("定期体检", "阶段性职业健康检查"),
                      Item2("加班补助", "正常工作时间之外的工资报酬"),
                      Item2("年终奖金", "年末给予员工奖励"),
                      ProfileDivider(),
                      
                      Item("公司注册信息", "", canClick: true),
                      Item2("企业法人", "小茗同学"),
                      Item2("注册资金", "100亿美金"),
                      Item2("注册时间", "2020-01-01"),
                      Item2("经营状态", "存续（在营业、开业、在册）"),
                      Item2("统一信用代码", "189887D9ADD12ND23"),
                      Item2("经营范围", "计算机软硬件的开发及销售；网络技术、网络产品的研发及销售。（依法须经批准，经相关部门批准后放可开展经营活动）"),
                      ProfileDivider(marginBottom: 78)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  bool canClick = false;
  VoidCallback onClick;
  String title;
  String value;
  Widget rightIcon;
  
  Item(this.title, this.value, {this.canClick, this.onClick, this.rightIcon});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> widgets = [];
    
    widgets.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(this.title,
           style: TextStyle(color: Color.fromRGBO(57,57,57,1),
              fontSize: ScreenUtil().setSp(32),
              fontWeight: FontWeight.bold,
              letterSpacing: 1
           ),
           
        ),
        SizedBox(width: ScreenUtil().setWidth(18)),
        Text(this.value,
           style: TextStyle(color: Color.fromRGBO(100,100,100,1),
              fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.w300)
        ),
      ],
    ));
    
    if(this.canClick) {
      if(this.rightIcon != null) {
        widgets.add(rightIcon);
      } else {
        widgets.add(
           Image.asset('images/img_arrow_right_blue.png',
            width:ScreenUtil().setWidth(12),
              height: ScreenUtil().setHeight(20)
           )
        );
      }
    }
    
    return GestureDetector(
      onTap: () {
        if(this.onClick != null) {
          this.onClick();
        }
      } ,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: widgets,
       ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  String title;
  String value;
  
  Item2(this.title, this.value);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(40)),
        Text(this.title,
          style: TextStyle(
             color: Color.fromRGBO(57,57,57,1),
              fontSize: ScreenUtil().setSp(28),
             fontWeight: FontWeight.w400,
            letterSpacing: 1
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(2)),
        Text(this.value,
          style: TextStyle(
             color: Color.fromRGBO(94,94,94,1),
             fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w300,
             letterSpacing: 1
          ),
        ),
      ],
    );
  }
}
