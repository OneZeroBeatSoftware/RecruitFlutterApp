import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/entity/job_list_entity.dart';

jobListEntityFromJson(JobListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new JobListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> jobListEntityToJson(JobListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}