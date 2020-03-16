import 'package:recruit_app/entity/work_date_entity.dart';

workDateEntityFromJson(WorkDateEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<WorkDateData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new WorkDateData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> workDateEntityToJson(WorkDateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

workDateDataFromJson(WorkDateData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['workDateName'] != null) {
		data.workDateName = json['workDateName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> workDateDataToJson(WorkDateData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['workDateName'] = entity.workDateName;
	data['state'] = entity.state;
	return data;
}