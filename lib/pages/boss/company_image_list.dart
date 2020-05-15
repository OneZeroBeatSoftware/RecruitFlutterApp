import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/model/file_model.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';

class CompanyImageResult {
  List<CompanyImage> companyImages;

  CompanyImageResult(this.companyImages);
}

class CompanyImageList extends StatefulWidget {
  final List<CompanyImage> companyImage;

  const CompanyImageList({Key key, this.companyImage}) : super(key: key);

  @override
  _CompanyImageListState createState() => _CompanyImageListState();
}

class _CompanyImageListState extends State<CompanyImageList> {
  List<CompanyImage> _imgFile = [];

  @override
  void initState() {
    // TODO: implement initState
    _imgFile.add(CompanyImage()..companyImage = 'images/img_img_add_blue.png');
    _imgFile.addAll(widget.companyImage);
    super.initState();
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
          '公司照片',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            if (_imgFile.length < 2) {
              Utils.showToast('请上传至少一张公司照片');
              return;
            }
            Navigator.pop(context,
                CompanyImageResult(_imgFile.sublist(1, _imgFile.length)));
          },
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              '保存',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setWidth(44),
              left: ScreenUtil().setWidth(48),
              right: ScreenUtil().setWidth(48),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '图片上传',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(20, 20, 20, 1),
                      fontSize: ScreenUtil().setSp(32)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(30),
                ),
                Wrap(
                  spacing: ScreenUtil().setWidth(20),
                  runSpacing: ScreenUtil().setWidth(20),
                  children: _imgFile.asMap().keys.map((index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_imgFile.length > 5) {
                            return Utils.showToast('最多上传5张');
                          }
                          _openGallery();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setWidth(200),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: ScreenUtil().setWidth(3),
                                  color: Color.fromRGBO(154, 202, 241, 1),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(20))),
                          child: Image.asset('images/img_add.png',
                            fit: BoxFit.cover,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setWidth(100),),
                        ),
                      );
                    }
                    return GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                        child: CachedNetworkImage(
                            imageUrl: _imgFile[index].companyImage,
                            fit: BoxFit.cover,
                            width: ScreenUtil().setWidth(300),
                            height: ScreenUtil().setWidth(200),
                            errorWidget: (context, url, error) {
                              return Image.asset('images/img_job_ad.png',
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(300),
                                height: ScreenUtil().setWidth(200),);
                            },
                            placeholder: (context, url) {
                              return Image.asset('images/img_job_ad.png',
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(300),
                                height: ScreenUtil().setWidth(200),);
                            }),
                      ),
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _imgFile.removeAt(index);
                        setState(() {});
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(38),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(245, 245, 245, 1),
            height: ScreenUtil().setHeight(4),
          )
        ],
      ),
    );
  }

  /// 相册获取图片上传
  _openGallery() async {
    var _image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (_image == null) {
      return;
    }
    _uploadFile(_image);
  }

  /// 选中图片后上传图片
  _uploadFile(File file) async {
    String imgPath = await FileModel.instance.uploadFile(context, file);
    if (null != imgPath) {
      Utils.showToast('上传成功');
      _imgFile.add(CompanyImage()
        ..companyImage = imgPath
        ..id = ''
        ..companyId = ''
        ..state = 1);
      setState(() {});
    } else {
      Utils.showToast('上传失败');
    }
  }
}
