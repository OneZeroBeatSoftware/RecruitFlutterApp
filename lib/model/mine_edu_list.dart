class MineEduList {
  static const _allEduList = <MineEduData>[
    MineEduData(school: '福建省福州市福州大学', during: '2012-2016', profession: '计算机科学与技术', level: '本科'),
  ];

  static List<MineEduData> loadEduList() {
    return _allEduList;
  }
}

class MineEduData {
  final String school;
  final String during;
  final String profession;
  final String level;

  const MineEduData({this.school, this.during, this.profession, this.level});
}
