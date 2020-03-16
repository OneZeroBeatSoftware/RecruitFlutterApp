import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListMenuDialog extends Dialog {
  final String title;
  final List<String> lists;
  final Function() confirm;
  final Function() itemSelected;
  final Function() cancel;

  ListMenuDialog({this.title = '', this.confirm, this.cancel,this.lists,this.itemSelected,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + EdgeInsets.only(top: 56),
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setWidth(30)),
                topRight: Radius.circular(ScreenUtil().setWidth(30)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(48),
                    right: ScreenUtil().setWidth(48),
                    top: ScreenUtil().setWidth(48),
                    bottom: ScreenUtil().setWidth(40),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: cancel,
                          child: Image.asset(
                            'images/img_cancel_gray.png',
                            width: ScreenUtil().setWidth(24),
                            height: ScreenUtil().setWidth(24),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromRGBO(57, 57, 57, 1),
                            fontSize: ScreenUtil().setSp(32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: confirm,
                          child: Text(
                            '确定',
                            style: TextStyle(
                              color: Color.fromRGBO(95, 94, 94, 1),
                              fontSize: ScreenUtil().setSp(28),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      if (index < lists.length) {
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(40),
                                horizontal: ScreenUtil().setWidth(48),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(159, 199, 235, 1),
                                    width: ScreenUtil().setWidth(1),
                                  ),
                                ),
                              ),
                              child: Text(
                                lists[index],
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32),
                                  color: Color.fromRGBO(159, 199, 235, 1),
                                ),
                              ),
                            ),
                            onTap: itemSelected,);
                      }
                      return null;
                    },
                    itemCount: lists.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
