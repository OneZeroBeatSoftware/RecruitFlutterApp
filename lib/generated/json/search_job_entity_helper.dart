import 'package:recruit_app/entity/search_job_entity.dart';
import 'package:recruit_app/entity/job_list_data_record_entity.dart';

searchJobEntityFromJson(SearchJobEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<JobListDataRecord>();
		(json['data'] as List).forEach((v) {
			data.data.add(new JobListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchJobEntityToJson(SearchJobEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}