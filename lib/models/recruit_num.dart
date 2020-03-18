import 'package:json_annotation/json_annotation.dart';

part 'recruit_num.g.dart';

@JsonSerializable()
class Recruit_num {
    Recruit_num();

    num id;
    String year;
    num applyPeopleNumber;
    num actualPeopleNumber;
    num batchAAdmissionNumber;
    num batchAAdmissionRate;
    num batchBAdmissionNumber;
    num batchBAdmissionRate;
    num batchCAdmissionNumber;
    num batchCAdmissionRate;
    
    factory Recruit_num.fromJson(Map<String,dynamic> json) => _$Recruit_numFromJson(json);
    Map<String, dynamic> toJson() => _$Recruit_numToJson(this);
}
