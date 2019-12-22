class WelfareList {
  static const _allWelfareList = <WelfareData>[
    WelfareData(welfare: '五险一金'),
    WelfareData(welfare: '补充医疗保险'),
    WelfareData(welfare: '定期体检'),
    WelfareData(welfare: '年终奖'),
    WelfareData(welfare: '带薪年假'),
    WelfareData(welfare: '员工旅游'),
    WelfareData(welfare: '免费班车'),
    WelfareData(welfare: '交通补助'),
    WelfareData(welfare: '包吃'),
    WelfareData(welfare: '节日福利'),
    WelfareData(welfare: '无息房贷'),
  ];

  static List<WelfareData> loadWelfareList() {
    return _allWelfareList;
  }
}

class WelfareData {
  final String welfare;

  const WelfareData({this.welfare});
}
