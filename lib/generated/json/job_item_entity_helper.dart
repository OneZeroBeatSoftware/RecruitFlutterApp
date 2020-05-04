import 'package:recruit_app/entity/job_item_entity.dart';

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

jobListDataRecordFromJson(JobListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['starId'] != null) {
		data.starId = json['starId']?.toString();
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
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toDouble();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toDouble();
	}
	if (json['releaseDate'] != null) {
		data.releaseDate = json['releaseDate']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toString();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	if (json['workDateId'] != null) {
		data.workDateId = json['workDateId']?.toInt();
	}
	if (json['workDateName'] != null) {
		data.workDateName = json['workDateName']?.toString();
	}
	if (json['candidatesTotal'] != null) {
		data.candidatesTotal = json['candidatesTotal']?.toInt();
	}
	if (json['candidatesCurrent'] != null) {
		data.candidatesCurrent = json['candidatesCurrent']?.toInt();
	}
	if (json['treatments'] != null) {
		data.treatments = new List<JobListDataTreatments>();
		(json['treatments'] as List).forEach((v) {
			data.treatments.add(new JobListDataTreatments().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobListDataRecordToJson(JobListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['starId'] = entity.starId;
	data['companyId'] = entity.companyId;
	data['companyName'] = entity.companyName;
	data['jobName'] = entity.jobName;
	data['workAddress'] = entity.workAddress;
	data['avatar'] = entity.avatar;
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
	return data;
}

jobListDataTreatmentsFromJson(JobListDataTreatments data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['treatmentName'] != null) {
		data.treatmentName = json['treatmentName']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	return data;
}

Map<String, dynamic> jobListDataTreatmentsToJson(JobListDataTreatments entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['treatmentName'] = entity.treatmentName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}