import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';
import 'package:recruit_app/pages/companys/company_row_item.dart';

class FocusCompanyList extends StatefulWidget {
  @override
  _FocusCompanyListState createState() {
    // TODO: implement createState
    return _FocusCompanyListState();
  }
}

class _FocusCompanyListState extends State<FocusCompanyList> {
  List<Company> _companyList = CompanyData.loadCompany();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text('我关注的公司',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 38, 39, 1))),
        leading: IconButton(
            icon: Image.asset(
              'images/ic_back_arrow.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _companyList.length) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: CompanyRowItem(
                  company: _companyList[index],
                  index: index,
                  lastItem: index == _companyList.length - 1),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyDetail(),
                    ));
              },
            );
          }
          return null;
        },
        itemCount: _companyList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
