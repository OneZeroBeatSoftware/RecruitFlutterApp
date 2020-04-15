import 'package:recruit_app/entity/intent_list_entity.dart';

intentListEntityFromJson(IntentListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<IntentListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new IntentListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> intentListEntityToJson(IntentListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

intentListDataFromJson(IntentListData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['jobState'] != null) {
		data.jobState = json['jobState']?.toString();
	}
	if (json['positionName'] != null) {
		data.positionName = json['positionName']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
	}
	if (json['cityId'] != null) {
		data.cityId = json['cityId']?.toString();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['defaultIntention'] != null) {
		data.defaultIntention = json['defaultIntention']?.toInt();
	}
	return data;
}

Map<String, dynamic> intentListDataToJson(IntentListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['jobState'] = entity.jobState;
	data['positionName'] = entity.positionName;
	data['industryName'] = entity.industryName;
	data['cityName'] = entity.cityName;
	data['cityId'] = entity.cityId;
	data['positionId'] = entity.positionId;
	data['industryId'] = entity.industryId;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['state'] = entity.state;
	data['defaultIntention'] = entity.defaultIntention;
	return data;
}