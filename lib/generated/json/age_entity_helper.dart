import 'package:recruit_app/entity/age_entity.dart';

ageEntityFromJson(AgeEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<AgeData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new AgeData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> ageEntityToJson(AgeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

ageDataFromJson(AgeData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['minAge'] != null) {
		data.minAge = json['minAge']?.toInt();
	}
	if (json['maxAge'] != null) {
		data.maxAge = json['maxAge']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> ageDataToJson(AgeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['minAge'] = entity.minAge;
	data['maxAge'] = entity.maxAge;
	data['state'] = entity.state;
	return data;
}