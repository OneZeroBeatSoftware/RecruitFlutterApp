// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admission_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admission_data _$Admission_dataFromJson(Map<String, dynamic> json) {
  return Admission_data()
    ..meta = json['meta'] == null
        ? null
        : Response_meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..response = (json['response'] as List)
        ?.map((e) =>
            e == null ? null : Recruit_num.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Admission_dataToJson(Admission_data instance) =>
    <String, dynamic>{'meta': instance.meta, 'response': instance.response};
