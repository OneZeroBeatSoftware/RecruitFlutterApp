class JobManageList {
  static const _allJob = <JobManageData>[
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: 'JavaScript',
        salary: '6-7k',
        address: '福州•金山',
        degree: '本科',
        exp: '1-3年',
        candidateCount: 2,
        candidateTotal: 10,
    ),
    JobManageData(
        jobName: '全栈工程师',
        salary: '20-30k',
        address: '福州•金山',
        degree: '本科',
        exp: '3-5年',
        candidateCount: 1,
        candidateTotal: 10,
    ),
  ];

  static List<JobManageData> loadJobList() {
    return _allJob;
  }
}

class JobManageData {
  final String jobName;
  final String salary;
  final String address;
  final String degree;
  final String exp;
  final int candidateCount;
  final int candidateTotal;

  const JobManageData(
      {this.jobName, this.salary, this.address, this.degree, this.exp, this.candidateCount, this.candidateTotal});
}
