import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_list.dart';
import 'package:recruit_app/pages/companys/company_detail.dart';

import 'company_row_item.dart';

class CompanyList extends StatefulWidget {
  @override
  _CompanyListState createState() {
    // TODO: implement createState
    return _CompanyListState();
  }
}

class _CompanyListState extends State<CompanyList> {
  List<Company> _companyList = CompanyData.loadCompany();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        title: Text("公司"),
        backgroundColor: Color.fromRGBO(70, 192, 182, 1),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _companyList.length) {
            return GestureDetector(
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
