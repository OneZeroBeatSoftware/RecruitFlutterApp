import 'package:json_annotation/json_annotation.dart';

part 'response_meta.g.dart';

@JsonSerializable()
class Response_meta {
    Response_meta();

    num code;
    String msg;
    
    factory Response_meta.fromJson(Map<String,dynamic> json) => _$Response_metaFromJson(json);
    Map<String, dynamic> toJson() => _$Response_metaToJson(this);
}
