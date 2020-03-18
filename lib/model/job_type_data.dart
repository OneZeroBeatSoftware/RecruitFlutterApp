class JobTypeList {
  static List<JobTypeData> _allJobData = <JobTypeData>[
    JobTypeData(filterName: '设计', isChecked: false),
    JobTypeData(filterName: '销售', isChecked: false),
    JobTypeData(filterName: '技术', isChecked: false),
    JobTypeData(filterName: '教育', isChecked: false),
    JobTypeData(filterName: '金融', isChecked: false),
    JobTypeData(filterName: '房地产', isChecked: false),
    JobTypeData(filterName: '市场', isChecked: false),
    JobTypeData(filterName: '运营', isChecked: false),
    JobTypeData(filterName: '生产', isChecked: false),
    JobTypeData(filterName: '医疗', isChecked: false),
    JobTypeData(filterName: '旅游', isChecked: false),
    JobTypeData(filterName: '管理', isChecked: false),
    JobTypeData(filterName: '行政', isChecked: false),
    JobTypeData(filterName: '其他', isChecked: false),
  ];

  static List<JobTypeData> loadJobData() {
    return _allJobData;
  }
}

class JobTypeData {
  String filterName;
  bool isChecked;

  JobTypeData({this.filterName, this.isChecked});
}
