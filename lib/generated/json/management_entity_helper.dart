import 'package:recruit_app/entity/management_entity.dart';

managementEntityFromJson(ManagementEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ManagementData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ManagementData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> managementEntityToJson(ManagementEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

managementDataFromJson(ManagementData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['managementName'] != null) {
		data.managementName = json['managementName']?.toString();
	}
	return data;
}

Map<String, dynamic> managementDataToJson(ManagementData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['managementName'] = entity.managementName;
	return data;
}