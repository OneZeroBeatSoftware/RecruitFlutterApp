import 'package:recruit_app/entity/edu_level_entity.dart';

eduLevelEntityFromJson(EduLevelEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<EduLevelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new EduLevelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> eduLevelEntityToJson(EduLevelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

eduLevelDataFromJson(EduLevelData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> eduLevelDataToJson(EduLevelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['educationName'] = entity.educationName;
	data['state'] = entity.state;
	return data;
}