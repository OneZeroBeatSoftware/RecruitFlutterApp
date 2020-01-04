class EmployeeData {
  static const _allEmployee = <Employee>[
    Employee(
        name: '林恺淼',
        exp: '1年',
        degree: '本科',
        label: ['DIV', 'PC端', 'HTML5'],
        salary: '面议',
        company: '薇鼎',
        pos: 'web前端',
        during: '9个月',
        resume: '熟悉HTML5，DIV+CSS，Javascript，熟悉jQuery、ajax、Json。本人对大部分事物都有……'),
    Employee(
        name: '洪德扬',
        exp: '2年',
        degree: '本科',
        label: ['React', '页面跳转', 'Vue'],
        salary: '6-10k',
        company: '福建宏天信息产业',
        pos: 'web前端',
        during: '2年',
        resume:
            '有两年工作经验，精通Html5，Bootstrap，Javascript，jQuery，熟练掌握Ajax、Vue，了解nodeJs……'),
    Employee(
        name: '李志增',
        exp: '2年',
        degree: '本科',
        label: ['HTML', 'jquery插件', 'Node.js'],
        salary: '面议',
        company: '福建颖睿信息',
        pos: 'web前端',
        during: '1年半',
        resume: '两年前端开发经验，熟悉nodejs，掌握express第三方应用框架及相关中间件，自学能力较强……'),
    Employee(
        name: '黄木木',
        exp: '2年',
        degree: '本科',
        label: ['HTML', 'jquery插件', 'Node.js'],
        salary: '面议',
        company: 'OZB',
        pos: 'web前端',
        during: '1年半',
        resume: '两年前端开发经验，熟悉nodejs，掌握express第三方应用框架及相关中间件，自学能力较强……'),
    Employee(
        name: '林彩',
        exp: '2年',
        degree: '本科',
        label: ['HTML', 'jquery插件', 'Node.js'],
        salary: '面议',
        company: '一零跳动',
        pos: 'web前端',
        during: '1年半',
        resume: '两年前端开发经验，熟悉nodejs，掌握express第三方应用框架及相关中间件，自学能力较强……'),
  ];

  static List<Employee> loadEmployees() {
    return _allEmployee;
  }
}

class Employee {
  final String name;
  final String exp;
  final String degree;
  final List<String> label;
  final String salary;
  final String company;
  final String pos;
  final String during;
  final String resume;

  const Employee(
      {this.name,
      this.exp,
      this.degree,
      this.label,
      this.salary,
      this.company,
      this.pos,
      this.during,
      this.resume});
}
