import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';

class Blacklist extends StatefulWidget {
  @override
  _BlacklistState createState() {
    // TODO: implement createState
    return _BlacklistState();
  }
}

class _BlacklistState extends State<Blacklist> {
  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();

  @override
  Widget build(BuildContext context) {
    return Text('黑名单');
  }
}
