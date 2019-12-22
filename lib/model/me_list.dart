class MeOptions {
  static const _allOptions = <Me>[
    Me(imgPath: 'images/img_cv.png', itemName: '附件简历', itemStatus: '未上传'),
    Me(imgPath: 'images/img_job_status.png', itemName: '管理求职意向', itemStatus: '在职-暂不考虑'),
    Me(imgPath: 'images/img_home_personal.png', itemName: '个人主页', itemStatus: ''),
    Me(imgPath: 'images/img_ask_reply.png', itemName: '我关注的公司', itemStatus: ''),
    Me(imgPath: 'images/img_sun.png', itemName: '提升简历曝光', itemStatus: ''),
    Me(imgPath: 'images/img_help.png', itemName: '帮助与反馈', itemStatus: ''),
    Me(imgPath: 'images/img_service.png', itemName: '我的客服', itemStatus: ''),
    Me(imgPath: 'images/img_about.png', itemName: '关于', itemStatus: ''),
  ];

  static List<Me> loadOptions() {
    return _allOptions;
  }
}

class Me {
  final String imgPath;
  final String itemName;
  final String itemStatus;

  const Me({this.imgPath, this.itemName, this.itemStatus});
}
