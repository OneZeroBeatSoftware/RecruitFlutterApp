class MeOptions {
  static List<Me> _allOptions = <Me>[
    Me(imgPath: 'images/img_edit_resume_gray.png', itemName: '编辑简历', itemStatus: '0/0'),
    Me(imgPath: 'images/img_job_intent_gray.png', itemName: '管理求职意向', itemStatus: ''),
    Me(imgPath: 'images/img_love_gray.png', itemName: '收藏夹', itemStatus: ''),
    Me(imgPath: 'images/img_blacklist_gray.png', itemName: '黑名单', itemStatus: ''),
    Me(imgPath: 'images/img_help_gray.png', itemName: '帮助与反馈',),
    Me(imgPath: 'images/img_about_gray.png', itemName: '关于', itemStatus: ''),
  ];

  static List<Me> loadOptions() {
    return _allOptions;
  }

  static List<Me> _allBossOptions = <Me>[
    Me(imgPath: 'images/boss_me_co_info_icon.png', itemName: '公司信息', itemStatus: ''),
    Me(imgPath: 'images/boss_me_post_recruit_icon.png', itemName: '发布招聘', itemStatus: ''),
    Me(imgPath: 'images/boss_me_post_mrg.png', itemName: '管理岗位', itemStatus: ''),
//    Me(imgPath: 'images/img_home_personal.png', itemName: '公司相册', itemStatus: ''),
    Me(imgPath: 'images/img_love_gray.png', itemName: '收藏夹', itemStatus: ''),
    Me(imgPath: 'images/img_blacklist_gray.png', itemName: '黑名单', itemStatus: ''),
    Me(imgPath: 'images/boss_me_help_icon.png', itemName: '帮助与反馈',),
    Me(imgPath: 'images/boss_me_about_icon.png', itemName: '关于', itemStatus: ''),
  ];

  static List<Me> loadBossOptions() {
    return _allBossOptions;
  }
}

class Me {
  String imgPath;
  String itemName;
  String itemStatus;

  Me({this.imgPath, this.itemName, this.itemStatus=''});
}
