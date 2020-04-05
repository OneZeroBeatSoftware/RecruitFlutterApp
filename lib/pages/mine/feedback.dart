import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/file_model.dart';
import 'package:recruit_app/utils/net_utils.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CraftFeedback extends StatefulWidget {
  @override
  _CraftFeedbackState createState() => _CraftFeedbackState();
}

class _CraftFeedbackState extends State<CraftFeedback> {
  List<String> _imgFile=[];

  TextEditingController _editController;

  @override
  void initState() {
    // TODO: implement initState
    _imgFile.add('images/img_img_add_blue.png');
    _editController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_editController!=null){
      _editController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pop(context);
        },
        center: Text(
          '反馈',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            String content = _editController.text;
            if (content.isEmpty) {
              Utils.showToast('请填写反馈内容');
              return;
            }
            if (_imgFile.length<2) {
              Utils.showToast('请至少上传一张图片反馈');
              return;
            }
            _submitFeedback(content,_imgFile.sublist(1));
          },
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              '提交',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: ScreenUtil().setSp(34),
                color: Color.fromRGBO(57, 57, 57, 1),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(56),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
                bottom: ScreenUtil().setWidth(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '反馈内容',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color.fromRGBO(95, 94, 94, 1),
                      fontSize: ScreenUtil().setSp(28)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                TextField(
                  controller: _editController,
                  autofocus: false,
                  maxLines: 10,
                  textAlign: TextAlign.start,
                  cursorColor: Color.fromRGBO(95, 94, 94, 1),
                  maxLength: 500,
                  scrollPhysics: BouncingScrollPhysics(),
                  style: TextStyle(
                      height: 1.5,
                      letterSpacing: ScreenUtil().setWidth(3),
                      wordSpacing: ScreenUtil().setWidth(3),
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(255, 248, 248, 1),
                    contentPadding: EdgeInsets.all(
                      ScreenUtil().setWidth(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          ScreenUtil().setWidth(15),
                        ),
                      ),
                    ),
                    hintText: '请简要说明您遇到的问题和意见，以便我们为您提供更好的帮助',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1),
                    ),
                    counterStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color.fromRGBO(95, 94, 94, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setWidth(4),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(44),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
                bottom: ScreenUtil().setWidth(80)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '图片上传',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color.fromRGBO(95, 94, 94, 1),
                      fontSize: ScreenUtil().setSp(28)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Wrap(
                  spacing: ScreenUtil().setWidth(20),
                  runSpacing: ScreenUtil().setWidth(20),
                  children: _imgFile
                      .asMap()
                      .keys
                      .map((index) {
                    if (index == 0) {
                      return GestureDetector(onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_imgFile.length > 3) {
                          return Utils.showToast('最多上传3张图片');
                        }
                        _openGallery();
                      }, behavior: HitTestBehavior.opaque, child: Image.asset(
                        _imgFile[index],
                        width: ScreenUtil().setWidth(120),
                        height: ScreenUtil().setWidth(120),
                        fit: BoxFit.cover,
                      ),);
                    }
                    return GestureDetector(child: Image.network(
                      _imgFile[index],
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setWidth(120),
                      fit: BoxFit.cover,
                    ),behavior: HitTestBehavior.opaque,onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      _imgFile.removeAt(index);
                      setState(() {

                      });
                    },);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 相册获取图片上传
  _openGallery() async{
    var _image=await ImagePicker.pickImage(source: ImageSource.gallery,);
    if(_image==null){
      return;
    }
    _uploadFile(_image);
  }

  /// 选中图片后上传图片
  _uploadFile(File file) async {
    String imgPath= await FileModel.instance.uploadFile(context, file);
    if (null!=imgPath) {
      Utils.showToast('上传成功');
      _imgFile.add(imgPath);
      setState(() {

      });
    }else {
      Utils.showToast('上传失败');
    }
  }

  /// 提交反馈
  _submitFeedback(String content,List<String> imgPath) async{
    BaseRespEntity baseRespEntity = await NetUtils.subFeedBack(context, imgPath, content);
    if(baseRespEntity!=null&&baseRespEntity.statusCode==200){
      Utils.showToast(baseRespEntity.msg??"反馈成功");
      _imgFile.removeRange(1, _imgFile.length);
      if(_editController!=null){
        _editController.text="";
      }
      setState(() {});
    }else {
      Utils.showToast(baseRespEntity.msg??"提交失败，请重新尝试");
    }
  }
}
