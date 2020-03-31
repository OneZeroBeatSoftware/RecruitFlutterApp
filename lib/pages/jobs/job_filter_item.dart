import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/model/job_filter_data.dart';

class JobFilterItem extends StatelessWidget {
  final JobFilterData jobFilterData;
  final int index;
  final bool lastItem;
  final Function(JobFilterSubData) onTap;

  const JobFilterItem({Key key, this.jobFilterData, this.index, this.lastItem=false,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wrapWidth=(ScreenUtil.screenWidthDp-ScreenUtil().setWidth(96)-ScreenUtil().setWidth(36))/3;
    final filterItem = Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(48),
        right: ScreenUtil().setWidth(48),
        top: ScreenUtil().setWidth(36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            jobFilterData.filterName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Color.fromRGBO(57, 57, 57, 1),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(24),
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(18),
            runSpacing: ScreenUtil().setWidth(20),
            children: jobFilterData.filterSubData
                .map(
                  (item) => GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                    onTap(item);
                  },child: Container(
                    width: wrapWidth,
                    height: ScreenUtil().setWidth(50),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(
                        ScreenUtil().setWidth(18),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(1000),
                      ),
                      border: Border.all(
                        color: item.isChecked
                            ? Color.fromRGBO(68, 77, 151, 1)
                            : Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(2),
                      ),
                    ),
                    child: Text(
                      item.filterName,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: item.isChecked
                            ? Color.fromRGBO(68, 77, 151, 1)
                            : Color.fromRGBO(159, 199, 235, 1),
                        fontSize: ScreenUtil().setSp(28),
                      ),
                    ),
                  ),),
                )
                .toList(),
          ),
        ],
      ),
    );

    if (!lastItem) {
      return filterItem;
    }
    return Column(
      children: <Widget>[
        filterItem,
        SizedBox(
          height: ScreenUtil().setWidth(40),
        ),
      ],
    );
  }
}
