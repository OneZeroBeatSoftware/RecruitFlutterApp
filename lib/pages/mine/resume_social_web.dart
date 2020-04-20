import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';


class SocialWebResult{
  final String web;
  final int index;

  SocialWebResult(this.web, this.index);
}
class ResumeSocialWeb extends StatefulWidget {
  final String web;
  final int index;

  const ResumeSocialWeb({Key key, this.web='', this.index=-1}) : super(key: key);

  @override
  _ResumeSocialWebState createState() {
    // TODO: implement createState
    return _ResumeSocialWebState();
  }
}

class _ResumeSocialWebState extends State<ResumeSocialWeb> {
  TextEditingController _webController;

  @override
  void initState() {
    // TODO: implement initState
    _webController=TextEditingController(text: widget.web);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          '社交主页',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
          child: GestureDetector(
            onTap: () {
              if(_webController.text.isEmpty){
                Utils.showToast('请填写社交网址');
                return;
              }
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(context,SocialWebResult(_webController.text, widget.index));
            }, behavior: HitTestBehavior.opaque, child: Text("保存",
            style: TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1),
                fontSize: ScreenUtil().setSp(36),
                fontWeight: FontWeight.bold
            ),
          ),),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(48),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setWidth(40),
                ),
                Text(
                  '社交主页',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  autofocus: false,
                  keyboardType: TextInputType.url,
                  controller: _webController,
                  scrollPadding: EdgeInsets.all(0),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  cursorColor: Color.fromRGBO(176, 181, 180, 1),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(95, 94, 94, 1)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(34),
                      bottom: ScreenUtil().setWidth(34),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    hintText: '请输入网址',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
