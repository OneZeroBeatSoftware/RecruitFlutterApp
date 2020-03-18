class JobResumeList {
  static const _allResume = <ResumeData>[
    ResumeData(jobName: '高级运营', industry: '互联网', salary: '10-13k'),
    ResumeData(jobName: '运营总监', industry: '行业不限', salary: '20-23k'),
  ];

  static List<ResumeData> loadResume() {
    return _allResume;
  }
}

class ResumeData {
  final String jobName;
  final String industry;
  final String salary;

  const ResumeData({this.jobName, this.industry, this.salary});
}
