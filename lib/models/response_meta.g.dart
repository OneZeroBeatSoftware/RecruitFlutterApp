// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response_meta _$Response_metaFromJson(Map<String, dynamic> json) {
  return Response_meta()
    ..code = json['code'] as num
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$Response_metaToJson(Response_meta instance) =>
    <String, dynamic>{'code': instance.code, 'msg': instance.msg};
