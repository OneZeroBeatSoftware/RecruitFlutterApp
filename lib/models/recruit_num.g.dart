// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruit_num.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruit_num _$Recruit_numFromJson(Map<String, dynamic> json) {
  return Recruit_num()
    ..id = json['id'] as num
    ..year = json['year'] as String
    ..applyPeopleNumber = json['applyPeopleNumber'] as num
    ..actualPeopleNumber = json['actualPeopleNumber'] as num
    ..batchAAdmissionNumber = json['batchAAdmissionNumber'] as num
    ..batchAAdmissionRate = json['batchAAdmissionRate'] as num
    ..batchBAdmissionNumber = json['batchBAdmissionNumber'] as num
    ..batchBAdmissionRate = json['batchBAdmissionRate'] as num
    ..batchCAdmissionNumber = json['batchCAdmissionNumber'] as num
    ..batchCAdmissionRate = json['batchCAdmissionRate'] as num;
}

Map<String, dynamic> _$Recruit_numToJson(Recruit_num instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'applyPeopleNumber': instance.applyPeopleNumber,
      'actualPeopleNumber': instance.actualPeopleNumber,
      'batchAAdmissionNumber': instance.batchAAdmissionNumber,
      'batchAAdmissionRate': instance.batchAAdmissionRate,
      'batchBAdmissionNumber': instance.batchBAdmissionNumber,
      'batchBAdmissionRate': instance.batchBAdmissionRate,
      'batchCAdmissionNumber': instance.batchCAdmissionNumber,
      'batchCAdmissionRate': instance.batchCAdmissionRate
    };
