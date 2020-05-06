import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/entity/job_list_data_record_entity.dart';

jobListDataFromJson(JobListData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['current'] != null) {
		data.current = json['current']?.toInt();
	}
	if (json['records'] != null) {
		data.records = new List<JobListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new JobListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobListDataToJson(JobListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['size'] = entity.size;
	data['pages'] = entity.pages;
	data['current'] = entity.current;
	if (entity.records != null) {
		data['records'] =  entity.records.map((v) => v.toJson()).toList();
	}
	return data;
}