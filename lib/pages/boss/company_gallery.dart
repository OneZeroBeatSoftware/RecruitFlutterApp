import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';
import 'package:recruit_app/pages/boss/company_info_item.dart';

class CompanyGallery extends StatefulWidget {
  @override
  _CompanyGallery createState() {
    // TODO: implement createState
    return _CompanyGallery();
  }
}

class _CompanyGallery extends State<CompanyGallery> {
  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();

  @override
  Widget build(BuildContext context) {
    return Text('发布简历');
  }
}
