class CompanyPicList {
  static const _allCompanyPicList = <CompanyPicData>[
    CompanyPicData(picPath: 'images/timg1.png'),
    CompanyPicData(picPath: 'images/timg2.png'),
    CompanyPicData(picPath: 'images/timg3.png'),
    CompanyPicData(picPath: 'images/timg1.png'),
    CompanyPicData(picPath: 'images/timg2.png'),
    CompanyPicData(picPath: 'images/timg3.png'),
  ];

  static List<CompanyPicData> loadCompanyPicList() {
    return _allCompanyPicList;
  }
}

class CompanyPicData {
  final String picPath;

  const CompanyPicData({this.picPath});
}
