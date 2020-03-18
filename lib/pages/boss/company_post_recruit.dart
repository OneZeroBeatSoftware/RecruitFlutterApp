import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';
import 'package:recruit_app/pages/boss/company_info_item.dart';

class CompanyPostRecruit extends StatefulWidget {
  @override
  _CompanyPostRecruitState createState() {
    // TODO: implement createState
    return _CompanyPostRecruitState();
  }
}

class _CompanyPostRecruitState extends State<CompanyPostRecruit> {
  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();

  @override
  Widget build(BuildContext context) {
    return Text('发布招聘');
  }
}
