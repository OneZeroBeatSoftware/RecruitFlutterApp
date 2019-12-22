class MineWorkList {
  static const _allWrokList = <MineWorkData>[
    MineWorkData(
        companyName: '福建省一零跳动有限公司',
        during: '2016-至今',
        pos: '研发工程师',
        content: '负责数据采集，人物建模，人物模型训练，产品监控，性能监测。',
        label: ['研发兼运营', '全能']),
  ];

  static List<MineWorkData> loadWorkList() {
    return _allWrokList;
  }
}

class MineWorkData {
  final String companyName;
  final String during;
  final String pos;
  final String content;
  final List<String> label;

  const MineWorkData(
      {this.companyName, this.during, this.pos, this.content, this.label});
}
