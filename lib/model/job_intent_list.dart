class JobIntentList {
  static const _allIntent = <IntentData>[
    IntentData(city: '福州', jobName: '高级运营', industry: '互联网', salary: '10-13k'),
    IntentData(city: '厦门', jobName: '运营总监', industry: '行业不限', salary: '20-23k'),
  ];

  static List<IntentData> loadJobIntent() {
    return _allIntent;
  }
}

class IntentData {
  final String city;
  final String jobName;
  final String industry;
  final String salary;

  const IntentData({this.city, this.jobName, this.industry, this.salary});
}
