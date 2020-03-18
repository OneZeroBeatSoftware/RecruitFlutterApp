class IndustryTypeList {
  static List<IndustryTypeData> _allIndustryData = <IndustryTypeData>[
    IndustryTypeData(filterName: 'IT', isChecked: false),
    IndustryTypeData(filterName: '游戏', isChecked: false),
    IndustryTypeData(filterName: '房地产', isChecked: false),
    IndustryTypeData(filterName: '交通', isChecked: false),
    IndustryTypeData(filterName: '服务业', isChecked: false),
    IndustryTypeData(filterName: '汽车', isChecked: false),
    IndustryTypeData(filterName: '金融', isChecked: false),
    IndustryTypeData(filterName: '广告/传媒', isChecked: false),
    IndustryTypeData(filterName: '文化/教育', isChecked: false),
    IndustryTypeData(filterName: '医疗', isChecked: false),
    IndustryTypeData(filterName: '制造', isChecked: false),
    IndustryTypeData(filterName: '能源', isChecked: false),
    IndustryTypeData(filterName: '工业', isChecked: false),
    IndustryTypeData(filterName: '养殖', isChecked: false),
  ];

  static List<IndustryTypeData> loadIndustryData() {
    return _allIndustryData;
  }
}

class IndustryTypeData {
  String filterName;
  bool isChecked;

  IndustryTypeData({this.filterName, this.isChecked});
}
