import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/model/job_list.dart';
import 'package:recruit_app/model/job_model.dart';
import 'package:recruit_app/pages/companys/company_row_item.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/jobs/job_row_item.dart';
import 'package:recruit_app/pages/mine/communicate_row_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionSate createState() {
    // TODO: implement createState
    return _CollectionSate();
  }
}

class _CollectionSate extends State<Collection> {
  List<Company> _companyList = CompanyData.loadCompany();
  int _selectFilterType = 0;
  JobModel _jobModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _jobModel = Provider.of<JobModel>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          leading: 'images/img_arrow_left_black.png',
          leftListener: () {
            Navigator.pop(context);
          },
          center: Text(
            '收藏夹',
            style: TextStyle(
                color: Color.fromRGBO(68, 77, 151, 1),
                fontSize: ScreenUtil().setSp(36),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(48),
              ),
              height: ScreenUtil().setWidth(88),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        "企业",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: _selectFilterType == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _selectFilterType == 0
                              ? Color.fromRGBO(68, 77, 151, 1)
                              : Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectFilterType = 0;
                        });
                      },
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(32),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        "岗位",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: _selectFilterType == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _selectFilterType == 1
                              ? Color.fromRGBO(68, 77, 151, 1)
                              : Color.fromRGBO(57, 57, 57, 1),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectFilterType = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
              ),
              height: ScreenUtil().setWidth(1),
              color: Color.fromRGBO(159, 199, 235, 1),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index <
                      (_selectFilterType == 0
                          ? _companyList.length
                          : _jobModel.jobList.length)) {
                    var btnKey = GlobalKey<SlideButtonState>();

                    return   SlideButton(
                      key: btnKey,
                      singleButtonWidth: ScreenUtil().setWidth(116),
                      child: _selectFilterType == 0
                          ? CompanyRowItem(
                          company: _companyList[index],
                          index: index,
                          lastItem: index == _companyList.length - 1)
                          : JobRowItem(
                          job: _jobModel.jobList[index],
                          index: index,
                          lastItem: index == _jobModel.jobList.length - 1),
                      buttons: <Widget>[
                        buildAction(btnKey, Colors.red, () {
                          btnKey.currentState.close();
                        }),
                      ],
                    );
                  }
                  return null;
                },
                itemCount: _selectFilterType == 0
                    ? _companyList.length
                    : _jobModel.jobList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ));
  }

  InkWell buildAction(
      GlobalKey<SlideButtonState> key, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(116),
        color: color,
        child: Image.asset(
          'images/img_del_white.png',
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setWidth(38),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
