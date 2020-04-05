import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/pages/jobs/job_detail.dart';
import 'package:recruit_app/pages/msg/msg_interview_item.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/slide_button.dart';

class MineInterView extends StatefulWidget {
  VoidCallback onItemClicked;
  MineInterView({this.onItemClicked});
  
  @override
  _MineInterViewState createState() => _MineInterViewState();
}

class _MineInterViewState extends State<MineInterView> {
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
          '面试列表',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(1),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Expanded(
            child: ListView.builder(
              //具体的数据，根据外部传递进来的参数，进行初始化，招聘者和求职者的都是一样的
              itemBuilder: (context, idx) {
                var key = GlobalKey<SlideButtonState>();
                if (idx < 10) {
                  return GestureDetector(onTap: (){
                    if(widget.onItemClicked != null) {
                      widget.onItemClicked();
                    } else {
                      //默认跳转行为
                      Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>JobDetail(jobDetailType: JobDetailType.interview,)
                         )
                      );
                    }
                    
                  },behavior: HitTestBehavior.opaque,child: MsgInterviewItem(btnKey: key),);
                }
                return null;
              },
              physics: BouncingScrollPhysics(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
