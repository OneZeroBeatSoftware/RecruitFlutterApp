import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/remind_dialog.dart';

class IgnoreSetting extends StatefulWidget {
  @override
  _IgnoreSettingState createState() => _IgnoreSettingState();
}

class _IgnoreSettingState extends State<IgnoreSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '屏蔽公司',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(48),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(159, 199, 235, 1),
                  width: ScreenUtil().setWidth(2),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/img_search_blue.png',
                  width: ScreenUtil().setWidth(26),
                  height: ScreenUtil().setWidth(26),
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    cursorColor: Color.fromRGBO(159, 199, 235, 1),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                      ),
                      border: InputBorder.none,
                      hintText: '请输入公司名称',
                      hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Color.fromRGBO(176, 181, 180, 1),
                      ),
                    ),
                    onChanged: (text) {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: ScreenUtil().setHeight(18),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, int) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return RemindDialog(
                                title: '确定屏蔽该公司吗？',
                                titleColor: Color.fromRGBO(57, 57, 57, 1),
                                content: '该公司将不会再搜索到您的简历',
                                contentColor: Color.fromRGBO(57, 57, 57, 1),
                                cancelText: '我再想想',
                                cancelColor: Color.fromRGBO(142, 190, 245, 1),
                                confirmText: '屏蔽',
                                confirmColor: Color.fromRGBO(142, 190, 245, 1),
                                cancel: () {
                                  Navigator.pop(context);
                                },
                                confirm: () {
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(48),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(12),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Craft Time',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26),
                                  color: Color.fromRGBO(95, 94, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(15),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {},
                              child: Image.asset(
                                'images/img_del_gray.png',
                                width: ScreenUtil().setWidth(20),
                                height: ScreenUtil().setWidth(24),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: 2),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: ScreenUtil().setHeight(18),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(48),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(30),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                    ),
                    child: Text(
                      '搜索建议',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(32),
                        color: Color.fromRGBO(95, 94, 94, 1),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return RemindDialog(
                                title: '确定屏蔽该公司吗？',
                                titleColor: Color.fromRGBO(57, 57, 57, 1),
                                content: '该公司将不会再搜索到您的简历',
                                contentColor: Color.fromRGBO(57, 57, 57, 1),
                                cancelText: '我再想想',
                                cancelColor: Color.fromRGBO(142, 190, 245, 1),
                                confirmText: '屏蔽',
                                confirmColor: Color.fromRGBO(142, 190, 245, 1),
                                cancel: () {
                                  Navigator.pop(context);
                                },
                                confirm: () {
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(52),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(30),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(159, 199, 235, 1),
                              width: ScreenUtil().setWidth(1),
                            ),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: '阿斯致力',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Color.fromRGBO(95, 94, 94, 1),
                              ),
                              children: [
                                TextSpan(
                                  text: '教育',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color.fromRGBO(176, 181, 180, 1),
                                  ),
                                ),
                              ]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }, childCount: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
