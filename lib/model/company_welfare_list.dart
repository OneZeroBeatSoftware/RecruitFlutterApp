class WelfareList {
  static const _allWelfareList = <WelfareData>[
    WelfareData(welfare: '定期体检',imgPath: 'images/img_time_check.png'),
    WelfareData(welfare: '加班补助',imgPath: 'images/img_work_welfare.png'),
    WelfareData(welfare: '年终奖金',imgPath: 'images/img_year_salray.png'),
  ];

  static List<WelfareData> loadWelfareList() {
    return _allWelfareList;
  }
}

class WelfareData {
  final String welfare;
  final String imgPath;

  const WelfareData({this.welfare,this.imgPath});
}
