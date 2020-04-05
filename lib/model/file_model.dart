import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:recruit_app/entity/file_upload_entity.dart';
import 'package:recruit_app/utils/net_utils.dart';

class FileModel {
  factory FileModel() =>_getInstance();
  static FileModel _instance;
  static FileModel get instance => _getInstance();
  FileModel._internal() {
    //TODO
  }

  static FileModel _getInstance() {
    if (_instance == null) {
      _instance = new FileModel._internal();
    }
    return _instance;
  }

  /// 上传图片
  Future<String> uploadFile(BuildContext context,File file) async{
    FileUploadEntity fileUploadEntity=await NetUtils.uploadFile(context, file);
    if(fileUploadEntity.statusCode==200){
      return fileUploadEntity.data;
    }
    return null;
  }
}
