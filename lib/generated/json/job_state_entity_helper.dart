import 'package:recruit_app/entity/job_state_entity.dart';

jobStateEntityFromJson(JobStateEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<JobStateData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new JobStateData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobStateEntityToJson(JobStateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

jobStateDataFromJson(JobStateData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> jobStateDataToJson(JobStateData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['state'] = entity.state;
	return data;
}