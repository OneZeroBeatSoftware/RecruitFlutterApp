import 'package:recruit_app/entity/apply_list_entity.dart';

applyListEntityFromJson(ApplyListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new ApplyListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> applyListEntityToJson(ApplyListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

applyListDataFromJson(ApplyListData data, Map<String, dynamic> json) {
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
		data.records = new List<ApplyListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new ApplyListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> applyListDataToJson(ApplyListData entity) {
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

applyListDataRecordFromJson(ApplyListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['jobName'] != null) {
		data.jobName = json['jobName']?.toString();
	}
	if (json['workAddress'] != null) {
		data.workAddress = json['workAddress']?.toString();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
	}
	if (json['releaseDate'] != null) {
		data.releaseDate = json['releaseDate']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toString();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	if (json['workDateId'] != null) {
		data.workDateId = json['workDateId']?.toString();
	}
	if (json['workDateName'] != null) {
		data.workDateName = json['workDateName']?.toString();
	}
	if (json['candidatesTotal'] != null) {
		data.candidatesTotal = json['candidatesTotal']?.toString();
	}
	if (json['candidatesCurrent'] != null) {
		data.candidatesCurrent = json['candidatesCurrent']?.toString();
	}
	if (json['treatments'] != null) {
		data.treatments = new List<ApplyListDataRecordsTreatmants>();
		(json['treatments'] as List).forEach((v) {
			data.treatments.add(new ApplyListDataRecordsTreatmants().fromJson(v));
		});
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['applyDate'] != null) {
		data.applyDate = json['applyDate']?.toInt();
	}
	return data;
}

Map<String, dynamic> applyListDataRecordToJson(ApplyListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['companyName'] = entity.companyName;
	data['jobName'] = entity.jobName;
	data['workAddress'] = entity.workAddress;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['releaseDate'] = entity.releaseDate;
	data['city'] = entity.city;
	data['educationId'] = entity.educationId;
	data['educationName'] = entity.educationName;
	data['workDateId'] = entity.workDateId;
	data['workDateName'] = entity.workDateName;
	data['candidatesTotal'] = entity.candidatesTotal;
	data['candidatesCurrent'] = entity.candidatesCurrent;
	if (entity.treatments != null) {
		data['treatments'] =  entity.treatments.map((v) => v.toJson()).toList();
	}
	data['state'] = entity.state;
	data['applyDate'] = entity.applyDate;
	return data;
}

applyListDataRecordsTreatmantsFromJson(ApplyListDataRecordsTreatmants data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['treatmentName'] != null) {
		data.treatmentName = json['treatmentName']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> applyListDataRecordsTreatmantsToJson(ApplyListDataRecordsTreatmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobId'] = entity.jobId;
	data['treatmentName'] = entity.treatmentName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}