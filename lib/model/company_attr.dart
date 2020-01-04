class CompanyAttrList {
  static const _allAttr = <CompanyAttr>[
    CompanyAttr(attr: '公司介绍', status: '未完善'),
    CompanyAttr(attr: '公司福利', status: '未完善'),
    CompanyAttr(attr: '公司相册', status: '未完善'),
    CompanyAttr(attr: '产品介绍', status: '未完善'),
    CompanyAttr(attr: '高管介绍', status: '未完善'),
  ];

  static List<CompanyAttr> loadAttrs() {
    return _allAttr;
  }
}

class CompanyAttr {
  final String attr;
  final String status;

  const CompanyAttr({this.attr, this.status});
}
