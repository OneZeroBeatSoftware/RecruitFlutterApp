class JobData {
  static const _allJob = <Job>[
    Job(
        jobName: 'Java开发工程师',
        companyName: '一零跳动',
        companyStatus: '已上市',
        label: <String>['五险一金', '不打卡', '双休'],
        hr: 'Bingo',
        hrPos: 'CEO',
        leastSalary: 12,
        highestSalary: 15,
        count: 15),
    Job(
        jobName: '运营总监',
        companyName: '一零跳动',
        companyStatus: '已上市',
        label: <String>['五险一金', '不打卡', '双休'],
        hr: 'Liao',
        hrPos: 'COO',
        leastSalary: 12,
        highestSalary: 15,
        count: 13),
    Job(
        jobName: '人事专员',
        companyName: '一零跳动',
        companyStatus: '已上市',
        label: <String>['五险一金', '不打卡', '双休'],
        hr: 'Jane',
        hrPos: 'HR',
        leastSalary: 6,
        highestSalary: 8,
        count: 13),
    Job(
        jobName: '财务会计',
        companyName: '一零跳动',
        companyStatus: '已上市',
        label: <String>['五险一金', '不打卡', '双休'],
        hr: 'Mike',
        hrPos: 'CFO',
        leastSalary: 6,
        highestSalary: 9,
        count: 13),

    Job(
        jobName: 'Web前端',
        companyName: 'OZBeat',
        companyStatus: 'B轮',
        label: <String>['带薪年假','双休'],
        hr: 'Yang',
        hrPos: 'CTO',
        leastSalary: 8,
        highestSalary: 12,
        count: 13),

    Job(
        jobName: 'C#工程师',
        companyName: 'OZBeat',
        companyStatus: 'B轮',
        label: <String>['带薪年假','双休'],
        hr: 'Yang',
        hrPos: 'CTO',
        leastSalary: 13,
        highestSalary: 14,
        count: 13),

    Job(
        jobName: '运维',
        companyName: 'OZBeat',
        companyStatus: 'B轮',
        label: <String>['带薪年假','双休'],
        hr: 'Yang',
        hrPos: 'CTO',
        leastSalary: 8,
        highestSalary: 9,
        count: 13),
    Job(
        jobName: 'UI设计师',
        companyName: 'OZBeat',
        companyStatus: 'B轮',
        label: <String>['带薪年假','双休'],
        hr: 'Yang',
        hrPos: 'CTO',
        leastSalary: 10,
        highestSalary: 12,
        count: 13),
  ];

  static List<Job> loadJobs() {
    return _allJob;
  }
}

class Job {
  final String jobName;
  final String companyName;
  final String companyStatus;
  final List<String> label;
  final String hr;
  final String hrPos;
  final int leastSalary;
  final int highestSalary;
  final int count;

  const Job(
      {this.jobName,
      this.companyName,
      this.companyStatus,
      this.label,
      this.hr,
      this.hrPos,
      this.leastSalary,
      this.highestSalary,
      this.count});
}
