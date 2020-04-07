import 'package:recruit_app/entity/job_type_entity.dart';

jobTypeEntityFromJson(JobTypeEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<JobTypeData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new JobTypeData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobTypeEntityToJson(JobTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

jobTypeDataFromJson(JobTypeData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['isChecked'] != null) {
		data.isChecked = json['isChecked'];
	}
	if (json['subType'] != null) {
		data.subType = new List<JobSubTypeData>();
		(json['subType'] as List).forEach((v) {
			data.subType.add(new JobSubTypeData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobTypeDataToJson(JobTypeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['isChecked'] = entity.isChecked;
	if (entity.subType != null) {
		data['subType'] =  entity.subType.map((v) => v.toJson()).toList();
	}
	return data;
}

jobSubTypeDataFromJson(JobSubTypeData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['subType'] != null) {
		data.subType = json['subType']?.toString();
	}
	if (json['isChecked'] != null) {
		data.isChecked = json['isChecked'];
	}
	return data;
}

Map<String, dynamic> jobSubTypeDataToJson(JobSubTypeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['subType'] = entity.subType;
	data['isChecked'] = entity.isChecked;
	return data;
}