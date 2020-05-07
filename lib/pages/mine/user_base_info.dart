import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/application.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/model/file_model.dart';
import 'package:recruit_app/model/mine_model.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/craft_picker.dart';
import 'package:recruit_app/widgets/network_image.dart';
class UserBaseInfoResult{
  String userName;
  String avatar;

  UserBaseInfoResult(this.userName, this.avatar);
}
class UserBaseInfo extends StatefulWidget {
  final String userName;
  final String avatar;
  final String id;
  final Function(String) changeJobState;

  const UserBaseInfo({Key key, this.userName, this.avatar, this.changeJobState, this.id})
      : super(key: key);

  @override
  _UserBaseInfoState createState() {
    // TODO: implement createState
    return _UserBaseInfoState();
  }
}

class _UserBaseInfoState extends State<UserBaseInfo> {
  TextEditingController _nameController;
  String _avatar;

  String _jobState = '';
  int _selStatePos = 0;
  String _selStateId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _avatar = widget.avatar;
    _nameController = TextEditingController(text: widget.userName);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _getJobState();
      _getJobStateList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_nameController != null) {
      _nameController.dispose();
    }
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
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pop(context);
        },
        center: Text(
          '基本信息',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        rightAction: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            if (null == _avatar || _avatar.isEmpty) {
              Utils.showToast('请选择头像');
              return;
            }
            if (_nameController.text.isEmpty) {
              Utils.showToast('请填写名字');
              return;
            }
            _saveJobSeeker(widget.id, _avatar, _nameController.text);
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
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(38),
                    bottom: ScreenUtil().setWidth(40),
                  ),
                  margin: EdgeInsets.only(
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '头像',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(57, 57, 57, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(16),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _openGallery();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(54),
                          ),
                          child: NetImage(
                            img: '$_avatar',
                            placeholder: 'images/img_default_head.png',
                            error: 'images/img_default_head.png',
                            size: ScreenUtil().setWidth(108),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '姓名',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(57, 57, 57, 1),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  autofocus: false,
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
                    hintText: '请填写姓名',
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color.fromRGBO(176, 181, 180, 1),
                    ),
                  ),
                  onSubmitted: (text) {},
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(50)),
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil().setWidth(48)),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          width: ScreenUtil().setWidth(1),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '求职状态',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(57, 57, 57, 1),
                                fontSize: ScreenUtil().setSp(32)),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          '$_jobState',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color.fromRGBO(176, 181, 180, 1),
                            fontSize: ScreenUtil().setSp(24),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Image.asset(
                          'images/img_arrow_right_blue.png',
                          width: ScreenUtil().setWidth(10),
                          height: ScreenUtil().setWidth(20),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _setJobState();
                  },
                ),
              ],
            ),
          ),
        ),
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
      setState(() {
        _avatar = imgPath;
      });
    } else {
      Utils.showToast('上传失败');
    }
  }

  /// 添加、修改求职者信息
  _saveJobSeeker(String id,String avatar,String name) async {
    BaseRespEntity _baseEntity = await MineModel.instance.saveJobSeeker(
        context, id, Application.sp.getString('userId'),avatar,name);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '修改成功');
      Navigator.pop(context,UserBaseInfoResult(name, avatar));
    }
  }

  /// 设置求职状态
  _setJobState() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CraftPicker(
          confirm: (selPos) {
            Navigator.pop(context);
            _changeJobState(Application.sp.get('jobSeekerId'), MineModel.instance.jobStateList[selPos].id,selPos);
          },
          title: '求职状态',
          pickList: MineModel.instance.jobStateList.map((item)=>item.name).toList(),
          selIdx: _selStatePos,
        );
      },
    );
  }

  /// 获取求职状态
  _getJobState() {
    MineModel.instance
        .getJobState(context, Application.sp.get('jobSeekerId'))
        .then((model) {
      if (model != null) {
        setState(() {
          _jobState = model;
        });
      }
    });
  }

  /// 获取全部求职状态
  _getJobStateList() {
    MineModel.instance.getJobStateList(context).then((model) {
      if (model != null) {
        setState(() {});
      }
    });
  }

  /// 修改求职状态
  _changeJobState(String jobSeekId, String jobStateId, int selPos) async {
    BaseRespEntity _baseEntity =
        await MineModel.instance.changeJobState(context, jobSeekId, jobStateId);
    if (_baseEntity != null) {
      Utils.showToast(_baseEntity.msg ?? '修改成功');
      if (widget.changeJobState != null) {
        widget.changeJobState(MineModel.instance.jobStateList[selPos].name);
      }
      setState(() {
        _selStatePos = selPos;
        _selStateId = MineModel.instance.jobStateList[selPos].id;
        _jobState = MineModel.instance.jobStateList[selPos].name;
      });
    }
  }
}
