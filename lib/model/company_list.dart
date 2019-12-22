class CompanyData {
  static const _allCompany = <Company>[
    Company(
        name: '一零跳动',
        status: '已上市',
        type: '互联网',
        address: '福建省福州市',
        scale: '100-999人',
        purpose: '生命不息，代码不止。',
        introduce: '扶我起来，我还能码个产品！',
        recruitNum: '3',
        bossNum: '2'),
    Company(
        name: '车纷享',
        status: '未融资',
        type: '互联网',
        address: '杭州市滨江区长河',
        scale: '100-499人',
        purpose: '专注于电动汽车智能化、网络化、分享化技术',
        introduce: '年终奖、餐补、双休、上午09:00-下午06:00、弹性工作。',
        recruitNum: '124',
        bossNum: '7'),
    Company(
        name: '腾讯',
        status: '已上市',
        type: '互联网',
        address: '上海市徐汇区徐家汇',
        scale: '10000人以上',
        purpose: '是中国最大的互联网综合服务提供商之一',
        introduce: '年终奖、餐补、双休、上午09:00-下午06:00、弹性工作。',
        recruitNum: '4915',
        bossNum: '1156'),
    Company(
        name: '美团点评',
        status: '已上市',
        type: 'O2O',
        address: '北京',
        scale: '10000人以上',
        purpose: '业务结构美团点评拥有到店餐饮、酒店旅游、在线外卖。',
        introduce: '年终奖、餐补、双休、上午09:00-下午06:00、弹性工作。',
        recruitNum: '6775',
        bossNum: '3113'),
    Company(
        name: '网易',
        status: '已上市',
        type: '移动互联网',
        address: '广州市天河区天河公园',
        scale: '10000人以上',
        purpose: '也是中国最大的电子邮件服务商',
        introduce: '年终奖、餐补、双休、上午09:30-下午06:30、偶尔加班。',
        recruitNum: '1398',
        bossNum: '324'),
    Company(
        name: '阿里集团',
        status: '已上市',
        type: '移动互联网',
        address: '杭州市余杭区仓前',
        scale: '10000人以上',
        purpose: '股票代码"BABA"',
        introduce: '年终奖、餐补、双休、上午10:00-下午07:00、偶尔加班。',
        recruitNum: '998',
        bossNum: '475'),
    Company(
        name: '网易游戏',
        status: '已上市',
        type: '游戏',
        address: '广州市天河区珠江新城',
        scale: '10000人以上',
        purpose: '在开发互联网应用、服务及其他技术方面',
        introduce: '年终奖、餐补、双休、上午09:30-下午06:30、偶尔加班。',
        recruitNum: '881',
        bossNum: '87'),
    Company(
        name: '苏宁易购',
        status: '已上市',
        type: '电子商务',
        address: '南京市玄武区仙鹤门',
        scale: '10000人以上',
        purpose: '始终致力于商业零售经营',
        introduce: '年终奖、餐补、双休、上午09:00-下午06:00、偶尔加班。',
        recruitNum: '810',
        bossNum: '311'),
  ];

  static List<Company> loadCompany() {
    return _allCompany;
  }
}

class Company {
  final String name;
  final String status;
  final String address;
  final String type;
  final String scale;
  final String purpose;
  final String introduce;
  final String recruitNum;
  final String bossNum;

  const Company(
      {this.name,
      this.status,
      this.address,
      this.type,
      this.scale,
      this.purpose,
      this.introduce,
      this.recruitNum,
      this.bossNum});
}
