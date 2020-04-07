import 'package:recruit_app/entity/company_item_entity.dart';

companyListDataFromJson(CompanyListData data, Map<String, dynamic> json) {
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
		data.records = new List<CompanyListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new CompanyListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> companyListDataToJson(CompanyListData entity) {
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

companyListDataRecordFromJson(CompanyListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['registerAddress'] != null) {
		data.registerAddress = json['registerAddress']?.toString();
	}
	if (json['operateState'] != null) {
		data.operateState = json['operateState']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
	}
	if (json['scaleName'] != null) {
		data.scaleName = json['scaleName']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['jobInfo'] != null) {
		data.jobInfo = new List<CompanyListDataRecordsJobInfo>();
		(json['jobInfo'] as List).forEach((v) {
			data.jobInfo.add(new CompanyListDataRecordsJobInfo().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> companyListDataRecordToJson(CompanyListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['registerAddress'] = entity.registerAddress;
	data['operateState'] = entity.operateState;
	data['avatar'] = entity.avatar;
	data['cityName'] = entity.cityName;
	data['scaleName'] = entity.scaleName;
	data['industryName'] = entity.industryName;
	if (entity.jobInfo != null) {
		data['jobInfo'] =  entity.jobInfo.map((v) => v.toJson()).toList();
	}
	return data;
}

companyListDataRecordsJobInfoFromJson(CompanyListDataRecordsJobInfo data, Map<String, dynamic> json) {
	if (json['job_name'] != null) {
		data.jobName = json['job_name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> companyListDataRecordsJobInfoToJson(CompanyListDataRecordsJobInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['job_name'] = entity.jobName;
	data['id'] = entity.id;
	return data;
}