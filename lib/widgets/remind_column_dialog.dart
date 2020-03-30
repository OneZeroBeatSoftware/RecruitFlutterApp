import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindColDialog extends Dialog {
  final List<String> items;
  final String cancelText;
  final Color itemColor;
  final Color cancelColor;
  final Function(int) itemClick;
  final Function() cancel;

  RemindColDialog(
      {@required this.items,
      this.itemColor,
      this.cancelText = '',
      this.cancelColor,
      this.itemClick,
      this.cancel});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        return GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                          itemClick(index);
                        },child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setWidth(35),
                            horizontal: ScreenUtil().setWidth(30),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(159, 199, 235, 1),
                                width: ScreenUtil().setWidth(1),
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            items[index],
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: itemColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(34),
                            ),
                          ),
                        ),);
                      }
                      return null;
                    },
                    itemCount: items.length,
                    physics: BouncingScrollPhysics(),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(35),
                        horizontal: ScreenUtil().setWidth(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        cancelText,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: cancelColor,
                          fontSize: ScreenUtil().setSp(34),
                        ),
                      ),
                    ),
                    onTap: cancel,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
