import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/entity/management_entity.dart';
import 'package:recruit_app/model/boss_mine_model.dart';
import 'package:recruit_app/model/company_model.dart';
import 'package:recruit_app/pages/boss/company_address.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_date_time_picker.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/widgets/profile_divider.dart';
import 'package:recruit_app/pages/boss/company_introduction.dart';
import 'package:recruit_app/pages/boss/company_work_time.dart';
import 'package:recruit_app/pages/boss/company_base_info.dart';
import 'package:recruit_app/pages/boss/company_welfare.dart';
import 'package:recruit_app/pages/boss/company_legal_person.dart';
import 'package:recruit_app/pages/boss/company_register_capital.dart';
import 'package:recruit_app/pages/boss/company_unified_credit_code.dart';
import 'package:recruit_app/pages/boss/company_business_scope.dart';
import 'package:recruit_app/widgets/slide_button.dart';

import '../../application.dart';

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
  bool _isLoad=false;

//  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();
  CompanyModel _companyModel;

  /// 公司数据
  CompanyDetailData _detailData;

  List<ManagementData> _manageList = [];
  String _manage = '';
  String _manageId = '';
  int _managePos = 0;

  String _companySummary='';
  String _companyName='';
  String _scaleId='';
  String _scaleName='';
  String _industryId='';
  String _industry='';

  String _cityId='';
  String _cityName='';
  String _address='';

  String _startDate='';
  String _endDate='';
  String _legalPerson='';
  String _registerCapital='';
  String _registerDate='';
  String _unifiedCreditCode='';
  String _scope='';

  List<CompanyDetailDataWelfare> _welfareList = [];

  @override
  void initState() {
    // TODO: implement initState
    _isLoad = (widget.companyId != null && widget.companyId.isNotEmpty);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      getManagementList();
      _companyModel=Provider.of<CompanyModel>(context);
      if (_isLoad) {
        getCompanyDetail(widget.companyId);
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
        center: Text('公司信息',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
        rightAction: Container(
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if(_companyName==null||_companyName.isEmpty){
                Utils.showToast('请先编辑公司信息');
                return;
              }
              if(_scaleId==null||_scaleId.isEmpty){
                Utils.showToast('请先编辑公司信息');
                return;
              }
              if(_industryId==null||_industryId.isEmpty){
                Utils.showToast('请先编辑公司信息');
                return;
              }
              if(_companySummary==null||_companySummary.isEmpty){
                Utils.showToast('请先编辑公司简介');
                return;
              }
              if(_cityId==null||_cityId.isEmpty||_address==null||_address.isEmpty){
                Utils.showToast('请先编辑公司地址');
                return;
              }
              if(_startDate==null||_startDate.isEmpty||_endDate==null||_endDate.isEmpty){
                Utils.showToast('请先编辑工作时间');
                return;
              }
              if(_welfareList.length<=0){
                Utils.showToast('请至少编辑一种员工福利');
                return;
              }
              if(_legalPerson==null||_legalPerson.isEmpty){
                Utils.showToast('请先填写企业法人');
                return;
              }
              if(_registerCapital==null||_registerCapital.isEmpty){
                Utils.showToast('请先填写注册资金');
                return;
              }
              if(_registerDate==null||_registerDate.isEmpty){
                Utils.showToast('请先选择注册时间');
                return;
              }
              if(_manageId==null||_manageId.isEmpty){
                Utils.showToast('请先选择运营状态');
                return;
              }
              if(_unifiedCreditCode==null||_unifiedCreditCode.isEmpty){
                Utils.showToast('请先填写统一信用代码');
                return;
              }
              if(_unifiedCreditCode==null||_unifiedCreditCode.isEmpty){
                Utils.showToast('请先填写经营范围');
                return;
              }
              _editCompany();
            },
            child: Text((widget.companyId==null||widget.companyId.isEmpty) ? '保存' : '修改',
              style: TextStyle(
                  color: Color.fromRGBO(57, 57, 57, 1),
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SafeArea(
        top: false,
        child: _isLoad?Center(heightFactor: 20,child: CupertinoActivityIndicator(),):Column(
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
                              Text(_companyName,
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
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  if(widget.companyId!=null&&widget.companyId.isNotEmpty&&_detailData!=null){
                                    Navigator.push<CompanyInfoResult>(context, MaterialPageRoute(
                                        builder: (context) => CompanyBaseInfo(company:_detailData.company)
                                    )).then((value){
                                      if(value!=null){
                                        _industryId=value.industryId;
                                        _scaleId=value.scaleId;
                                        setState(() {
                                          _industry=value.industryName;
                                          _scaleName=value.scaleName;
                                          _companyName=value.companyName;
                                        });
                                      }
                                    });
                                  }else{
                                    Navigator.push<CompanyInfoResult>(context, MaterialPageRoute(
                                        builder: (context) => CompanyBaseInfo()
                                    )).then((value){
                                      if(value!=null){
                                        _industryId=value.industryId;
                                        _scaleId=value.scaleId;
                                        setState(() {
                                          _industry=value.industryName;
                                          _scaleName=value.scaleName;
                                          _companyName=value.companyName;
                                        });
                                      }
                                    });
                                  }
                                },
                              ),
                            ],),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Text('$_manage$_scaleName$_industry'.isNotEmpty?'$_manage $_scaleName $_industry':'请编辑公司信息',
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
                              Navigator.push<String>(context,
                                 MaterialPageRoute(
                                    builder: (context) => CompanyIntroduction(introduce: _companySummary,)
                                 )).then((value){
                                   if(value!=null){
                                     setState(() {
                                       _companySummary=value;
                                     });
                                   }
                              });
                            },
                          )
                        ]
                      ),
                      SizedBox(height: ScreenUtil().setSp(40)),
                      Text(
                          _companySummary.isEmpty?'请填写公司简介':_companySummary,
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
                      Item("公司地址", '$_cityName$_address', canClick: true,onClick: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.push<AddressResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CompanyAddress(
                                  cityId: _cityId,
                                  cityName: _cityName,
                                  detailAddress: _address,),
                          ),
                        ).then((value) {
                          if (value != null) {
                            _cityId=value.cityId;
                            setState(() {
                              _cityName=value.cityName;
                              _address=value.detailAddress;
                            });
                          }
                        });
                      },),
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
                      Item("工作时间", (_startDate.isEmpty&&_endDate.isEmpty)?'请选择工作时间':'$_startDate - $_endDate',
                         canClick: true,
                         onClick: () {
                            Navigator.push<WorkTimeResult>(context, MaterialPageRoute(
                              builder: (context) => CompanyWorkTime(startTime: _startDate,endTime: _endDate,)
                            )).then((value){
                              if(value!=null){
                                _startDate=value.startTime;
                                _endDate=value.endTime;
                              }
                            });
                         }
                      ),
                      
                      Item("员工福利", "", canClick: true, rightIcon:
                        Image.asset('images/boss_me_post_mrg.png',
                           width:ScreenUtil().setWidth(28),
                           height: ScreenUtil().setWidth(28)
                        ),
                        onClick: () {
                          Navigator.push<WelfareResult>(context, MaterialPageRoute(
                            builder: (context)=> CompanyWelfare()
                          )).then(welfareResult);
                        },
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          if (index < _welfareList.length) {
                            var btnKey = GlobalKey<SlideButtonState>();
                            return SlideButton(
                              key: btnKey,
                              singleButtonWidth: ScreenUtil().setWidth(172),
                              child: Item2(_welfareList[index].welfareName,_welfareList[index].content, onClick: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.push<WelfareResult>(context, MaterialPageRoute(
                                    builder: (context)=> CompanyWelfare(welfare: _welfareList[index],index:index)
                                )).then(welfareResult);
                              }),
                              buttons: <Widget>[
                                buildAction(
                                    btnKey, Colors.red, 'images/img_del_white.png',
                                        () {
                                      btnKey.currentState.close();
                                      setState(() {
                                        _welfareList.removeAt(index);
                                      });
                                    }),
                              ],
                            );
                          }
                          return null;
                        },
                        shrinkWrap: true,
                        itemCount: _welfareList.length,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      ProfileDivider(),
                      
                      Item("公司注册信息", ""),
                      Item2("企业法人", _legalPerson.isEmpty?'请填写企业法人':_legalPerson, canClick: true, onClick: () {
                        Navigator.push<String>(context, MaterialPageRoute(
                          builder: (context)=> CompanyLegalPerson(legalPerson:_legalPerson)
                        )).then((value){
                          if(value!=null){
                            setState(() {
                              _legalPerson=value;
                            });
                          }
                        });
                      }),
                      Item2("注册资金", _registerCapital.isEmpty?'请填写注册资金':_registerCapital, canClick: true, onClick: () {
                        Navigator.push<String>(context, MaterialPageRoute(
                           builder: (context)=> CompanyRegisterCapital(capital:_registerCapital)
                        )).then((value){
                          if(value!=null){
                            setState(() {
                              _registerCapital=value;
                            });
                          }
                        });
                      }),
                      Item2("注册时间",_registerDate.isEmpty?'请选择注册时间':'${DateUtil.formatDateStr(
                          _registerDate, format: "yyyy-MM-dd")}', canClick: true, onClick: () {
                        adJustDate();
                      }),
                      Item2("经营状态", _manage.isEmpty?'请选择经营状态':_manage, canClick: true, onClick: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        chooseCompanyStatus();
                      }),
                      Item2("统一信用代码", _unifiedCreditCode.isEmpty
                          ? '请填写统一信用代码'
                          : _unifiedCreditCode, canClick: true, onClick: () {
                        Navigator.push<String>(context, MaterialPageRoute(
                            builder: (context) => CompanyUnifiedCreditCode(code:_unifiedCreditCode)
                        )).then((value) {
                          if (value != null) {
                            setState(() {
                              _unifiedCreditCode = value;
                            });
                          }
                        });
                      }),
                      Item2("经营范围", _scope.isEmpty ? '请填写经营范围' : _scope,
                          canClick: true, onClick: () {
                            Navigator.push<String>(context, MaterialPageRoute(
                                builder: (context) =>
                                    CompanyBusinessScope(scope: _scope,)
                            )).then((value) {
                              if (value != null) {
                                setState(() {
                                  _scope = value;
                                });
                              }
                            });
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

  /// 福利信息回调
  void welfareResult(WelfareResult value) {
    if(value!=null){
      if(value.index==-1){
        CompanyDetailDataWelfare welfare = CompanyDetailDataWelfare()
          ..state = 1
          ..welfareName = value.title
          ..content = value.content;
        welfare.companyId = widget.companyId;
        welfare.id='';
        _welfareList.add(welfare);
      }else {
        setState(() {
          _welfareList[value.index].welfareName=value.title;
          _welfareList[value.index].content=value.content;
        });
      }
    }
  }

  /// 侧滑删除button
  InkWell buildAction(GlobalKey<SlideButtonState> key, Color color,
      String imgPath, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          imgPath,
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(30),
          fit: BoxFit.contain,
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
          initialTime: _registerDate.isEmpty?DateTime.now():DateTime.parse(_registerDate),
          confirm: (datetime) {
            Navigator.pop(context);
            setState(() {
              _registerDate=datetime.toIso8601String();
            });
          },
        );
      },
    );
  }

  /// 经营状态
  chooseCompanyStatus() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftPicker(
          confirm: (selPos) {
            Navigator.pop(context);
            setState(() {
              _managePos = selPos;
              _manageId = _manageList[selPos].id;
              _manage = _manageList[selPos].managementName;
            });
          },
          title: '经营状态',
          pickList: _manageList.map((item)=>item.managementName).toList(),
          selIdx: _managePos,
        );
      },
    );
  }

  /// 获取运营状态
  void getManagementList() async {
    ManagementEntity manageEntity = await NetUtils.getManagementList(context);
    if(manageEntity.statusCode==200&&manageEntity.data!=null){
      _manageList.clear();
      _manageList.addAll(manageEntity.data);
      setState(() {
      });
    }
  }

  /// 获取公司详情
  void getCompanyDetail(String companyId) async {
    CompanyDetailEntity detailEntity = await _companyModel.getCompanyDetail(
        context, companyId);
    if (detailEntity.data != null) {
      _isLoad=false;
      _scope=detailEntity.data.company.scope;
      _unifiedCreditCode=detailEntity.data.company.unifiedCreditCode;
      _registerDate=detailEntity.data.company.registerDate;
      _registerCapital=detailEntity.data.company.registerCapital;
      _legalPerson=detailEntity.data.company.legalPerson;
      _startDate=detailEntity.data.company.startDate;
      _endDate=detailEntity.data.company.endDate;
      _cityId=detailEntity.data.company.cityId;
      _cityName=detailEntity.data.company.cityName;
      _address=detailEntity.data.company.registerAddress;
      _scaleId=detailEntity.data.company.scaleId;
      _scaleName=detailEntity.data.company.scaleName;
      _industryId=detailEntity.data.company.industryId;
      _industry=detailEntity.data.company.industryName;
      _companyName=detailEntity.data.company.companyName;
      _companySummary=detailEntity.data.company.companySummary;
      _manage=detailEntity.data.company.managementName;
      _manageId=detailEntity.data.company.managementId;
      _welfareList.clear();
      _welfareList.addAll(detailEntity.data.welfare);
      setState(() {
        _detailData = detailEntity.data;
      });
    }else {
      Utils.showToast('公司详情有误，请重试！');
      setState(() {
        _isLoad=false;
      });
    }
  }

  /// 更新公司信息
  _editCompany() async {
    Map<String,dynamic> params={};
    List welfare=[];
    Map<String,dynamic> company={};

    if(widget.companyId!=null&&widget.companyId.isNotEmpty){
      company['id']=widget.companyId;
    }
    company['recruiterId']=Application.sp.get('recruiterId');
//    company['AmericanState']=AmericanState;
//    company['americanState']=_jobNameController.text;
//    company['avatar']=avatar;
    company['city']=_cityId;
    company['companyName']=_companyName;
    company['companySummary']=_companySummary;
    company['endDate']=_endDate;
    company['industry']=_industryId;
    company['legalPerson']=_legalPerson;
//		job['longitude']=longitude;
//		job['latitude']=latitude;
    company['management']=_manageId;
    company['registerAddress']=_address;
    company['registerCapital']=_registerCapital;
    company['registerDate']=DateUtil.getDateMsByTimeStr(_registerDate);
    company['scale']=_scaleId;
    company['scope']=_scope;
    company['startDate']=_startDate;
//    company['state']=1;
    company['unifiedCreditCode']=_unifiedCreditCode;

    _welfareList.forEach((item){
      Map<String,dynamic> params={};
      params['welfareName']=item.welfareName;
      params['content']=item.content;
      params['state']='1';
      if(item.id!=null&&item.id.isNotEmpty){
        params['id']=item.id;
      }
      if(widget.companyId!=null&&widget.companyId.isNotEmpty){
        params['companyId']=widget.companyId;
      }
      welfare.add(params);
    });

    params['welfare']=welfare;
    params['company']=company;

    print(json.encode(params));
    BaseRespEntity _baseEntity = await BossMineModel.instance.editCompany(context,params);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg??((widget.companyId!=null&&widget.companyId.isNotEmpty)?'修改成功':'添加成功'));
      Navigator.pop(context,'success');
    }
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
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
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
        ),
      );

  }
}
