import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/model/company_model.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';
import 'package:recruit_app/widgets/profile_divider.dart';
import 'package:recruit_app/pages/boss/company_introduction.dart';
import 'package:recruit_app/pages/boss/company_work_time.dart';
import 'package:recruit_app/pages/boss/company_base_info.dart';
import 'package:recruit_app/pages/boss/company_welfare.dart';
import 'package:recruit_app/pages/boss/company_legal_person.dart';
import 'package:recruit_app/pages/boss/company_register_capital.dart';
import 'package:recruit_app/pages/boss/company_unified_credit_code.dart';
import 'package:recruit_app/pages/boss/company_business_scope.dart';
import 'package:recruit_app/widgets/menu_list_dialog.dart';

class CompanyInfo extends StatefulWidget {
  final String companyId;

  const CompanyInfo({Key key, this.companyId=''}) : super(key: key);

  @override
  _CompanyInfoState createState() {
    // TODO: implement createState
    return _CompanyInfoState();
  }
}

class _CompanyInfoState extends State<CompanyInfo> {
//  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();
  CompanyModel _companyModel;

  /// 公司数据
  CompanyDetailData _detailData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _companyModel=Provider.of<CompanyModel>(context);
      if(widget.companyId!=null&&widget.companyId.isNotEmpty){
        getCompanyDetail(widget.companyId);
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /// 获取公司详情
  void getCompanyDetail(String companyId) async {
    CompanyDetailEntity companyDetailEntity = await _companyModel.getCompanyDetail(
        context, companyId);
    if (companyDetailEntity.data != null) {
      setState(() {
        _detailData = companyDetailEntity.data;
      });
    }
  }

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
      ),
      body: SafeArea(
        top: false,
        child: _detailData==null?Center(heightFactor: 20,child: CupertinoActivityIndicator(),):Column(
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
                              Text('${_detailData.company.companyName}',
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
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CompanyBaseInfo()
                                  ));
                                },
                              ),
                            ],),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Text('${_detailData.company.operateState} ${_detailData.scale} ${_detailData.company.scope}',
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
                          GestureDetector(
                            child: Image.asset('images/img_edit_resume_gray.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setWidth(30)),
                            onTap: () {
                              Navigator.push(context,
                                 MaterialPageRoute(
                                    builder: (context) => CompanyIntroduction()
                                 ));
                            },
                          )
                        ]
                      ),
                      SizedBox(height: ScreenUtil().setSp(40)),
                      Text(
                          '${_detailData.company.companySummary}',
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
                      Item("公司地址", '${_detailData.company.registerAddress}', canClick: true),
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
                      Item("工作时间", "${_detailData.company.startDate} - ${_detailData.company.endDate}",
                         canClick: true,
                         onClick: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CompanyWorkTime()
                            ));
                         }
                      ),
                      
                      Item("员工福利", "", canClick: true, rightIcon:
                        Image.asset('images/boss_me_post_mrg.png',
                           width:ScreenUtil().setWidth(28),
                           height: ScreenUtil().setWidth(28)
                        ),
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> CompanyWelfare()
                          ));
                        },
                      ),
                      ListView(children: _detailData.welfare.map((item){
                        return Item2(item.welfareName,item.content, onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> CompanyWelfare()
                          ));
                        });
                      }).toList(),shrinkWrap: true,padding: EdgeInsets.all(0),),
                      ProfileDivider(),
                      
                      Item("公司注册信息", ""),
                      Item2("企业法人", '${_detailData.company.legalPerson}', canClick: true, onClick: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> CompanyLegalPerson()
                        ));
                      }),
                      Item2("注册资金", '${_detailData.company.registerCapital}', canClick: true, onClick: () {
                        Navigator.push(context, MaterialPageRoute(
                           builder: (context)=> CompanyRegisterCapital()
                        ));
                      }),
                      Item2("注册时间", '${DateUtil.formatDateMs(
                          _detailData.company.registerDate, format: "yyyy-MM-dd")}', canClick: true, onClick: () {
                        adJustDate();
                      }),
                      Item2("经营状态", '${_detailData.company.operateState}', canClick: true, onClick: () {
                        chooseCompanyStatus();
                      }),
                      Item2("统一信用代码", '${_detailData.company.unifiedCreditCode}', canClick: true, onClick: () {
                        Navigator.push(context, MaterialPageRoute(
                           builder: (context)=> CompanyUnifiedCreditCode()
                        ));
                      }),
                      Item2("经营范围", "计算机软硬件的开发及销售；网络技术、网络产品的研发及销售。（依法须经批准，经相关部门批准后放可开展经营活动）", canClick: true, onClick: () {
                        Navigator.push(context, MaterialPageRoute(
                           builder: (context)=> CompanyBusinessScope()
                        ));
                      }),
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
  /// 调整时间
  void adJustDate() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftDateTimePicker(
          isHaveTime: false,
          title: '注册时间',
          initialTime: DateTime.now(),
          confirm: (datetime) {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  chooseCompanyStatus() {
    MenuListDialog.showMenu(context, DialogConfig (
          title: '经营状态',
          menus: <String> [
            '存续',
            '在业',
            '吊销',
            '注销',
            '迁入',
            '迁出',
            '停业',
            '清算'
          ]
          
      )
    );
  }
}

class Item extends StatelessWidget {
  final bool canClick;
  final VoidCallback onClick;
  final String title;
  final String value;
  final Widget rightIcon;
  final String tailValue;
  final num topPadding;
  
  Item(this.title, this.value, {this.canClick = false, this.onClick, this.rightIcon, this.tailValue = '', this.topPadding = 40});
  
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
    List<Widget> tailW = [
      Row(
        children: <Widget>[
          Text(
            tailValue,
            style: TextStyle(
               color: Color.fromRGBO(176,181,180,1),
               fontWeight: FontWeight.w500,
               fontSize: ScreenUtil().setSp(24)
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(14),
          )
        ],
      )
    ];
    
    if(this.canClick) {
      if(this.rightIcon != null) {
        tailW.add(rightIcon);
      } else {
        tailW.add(
           Image.asset('images/img_arrow_right_blue.png',
            width:ScreenUtil().setWidth(14),
              height: ScreenUtil().setHeight(22)
           )
        );
      }
    }
    widgets.add(Row(
      children: tailW,
    ));
    
    return GestureDetector(
       behavior: HitTestBehavior.opaque,
      onTap: () {
        if(this.onClick != null) {
          this.onClick();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(topPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
        ),
      )
    );
  }
}

class Item2 extends StatelessWidget {
  final String title;
  final String value;
  final bool canClick;
  final VoidCallback onClick;

  Item2(this.title, this.value, {this.canClick = false, this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> titleW = <Widget>[];
    titleW.add(Text(this.title,
      style: TextStyle(
         color: Color.fromRGBO(57,57,57,1),
         fontSize: ScreenUtil().setSp(28),
         fontWeight: FontWeight.w400,
         letterSpacing: 1
      ),
    ));
    
    if(canClick) {
      titleW.add(Image.asset('images/img_arrow_right_blue.png',
         width:ScreenUtil().setWidth(12),
         height: ScreenUtil().setHeight(20)
      ));
    }
    
    return
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if(onClick != null) {
            onClick();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(40)),
            Row(
              children: titleW,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      );

  }
}
