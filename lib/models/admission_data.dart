import 'package:json_annotation/json_annotation.dart';
import "response_meta.dart";
import "recruit_num.dart";
part 'admission_data.g.dart';

@JsonSerializable()
class Admission_data {
    Admission_data();

    Response_meta meta;
    List<Recruit_num> response;
    
    factory Admission_data.fromJson(Map<String,dynamic> json) => _$Admission_dataFromJson(json);
    Map<String, dynamic> toJson() => _$Admission_dataToJson(this);
}
