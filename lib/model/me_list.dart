class MeOptions {
  static const _allOptions = <Me>[
    Me(imgPath: 'images/img_edit_resume_gray.png', itemName: '编辑简历', itemStatus: '1/3'),
    Me(imgPath: 'images/img_job_intent_gray.png', itemName: '管理求职意向', itemStatus: '离职-随时到岗'),
    Me(imgPath: 'images/img_love_gray.png', itemName: '收藏夹', itemStatus: ''),
    Me(imgPath: 'images/img_blacklist_gray.png', itemName: '黑名单', itemStatus: ''),
    Me(imgPath: 'images/img_help_gray.png', itemName: '帮助与反馈', itemStatus: '牛人'),
    Me(imgPath: 'images/img_about_gray.png', itemName: '关于', itemStatus: ''),
  ];

  static List<Me> loadOptions() {
    return _allOptions;
  }

  static const _allBossOptions = <Me>[
    Me(imgPath: 'images/img_cv.png', itemName: '职位管理', itemStatus: ''),
    Me(imgPath: 'images/img_job_status.png', itemName: '企业管理', itemStatus: ''),
    Me(imgPath: 'images/img_home_personal.png', itemName: '个人主页', itemStatus: ''),
    Me(imgPath: 'images/img_sun.png', itemName: '公司主页', itemStatus: '完成度:0%'),
    Me(imgPath: 'images/img_help.png', itemName: '切换角色', itemStatus: '老板'),
    Me(imgPath: 'images/img_service.png', itemName: '我的客服', itemStatus: ''),
    Me(imgPath: 'images/img_about.png', itemName: '关于', itemStatus: ''),
  ];

  static List<Me> loadBossOptions() {
    return _allBossOptions;
  }
}

class Me {
  final String imgPath;
  final String itemName;
  final String itemStatus;

  const Me({this.imgPath, this.itemName, this.itemStatus});
}
