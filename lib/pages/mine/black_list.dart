import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/mine/black_list_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class BlackList extends StatefulWidget {
  @override
  _BlackListSate createState() {
    // TODO: implement createState
    return _BlackListSate();
  }
}

class _BlackListSate extends State<BlackList> {
  List<Company> _companyList = CompanyData.loadCompany();

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
            '黑名单',
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index < _companyList.length) {
                    var btnKey = GlobalKey<SlideButtonState>();
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque, child: BlackListItem(
                        btnKey: btnKey,
                        company: _companyList[index],
                        index: index,
                        lastItem: index == _companyList.length - 1), onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyDetail(),
                          ));
                    },);
                  }
                  return null;
                },
                itemCount: _companyList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ));
  }
}
