import 'package:recruit_app/entity/job_detail_entity.dart';

jobDetailEntityFromJson(JobDetailEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new JobDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> jobDetailEntityToJson(JobDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

jobDetailDataFromJson(JobDetailData data, Map<String, dynamic> json) {
	if (json['job'] != null) {
		data.job = new JobDetailDataJob().fromJson(json['job']);
	}
	if (json['starId'] != null) {
		data.starId = json['starId']?.toString();
	}
	if (json['industry'] != null) {
		data.industry = new JobDetailDataIndustry().fromJson(json['industry']);
	}
	if (json['position'] != null) {
		data.position = new JobDetailDataPosition().fromJson(json['position']);
	}
	if (json['jobTags'] != null) {
		data.jobTags = new List<JobDetailDataTags>();
		(json['jobTags'] as List).forEach((v) {
			data.jobTags.add(new JobDetailDataTags().fromJson(v));
		});
	}
	if (json['treatments'] != null) {
		data.treatments = new List<JobDetailDataTreatments>();
		(json['treatments'] as List).forEach((v) {
			data.treatments.add(new JobDetailDataTreatments().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> jobDetailDataToJson(JobDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.job != null) {
		data['job'] = entity.job.toJson();
	}
	data['starId'] = entity.starId;
	if (entity.industry != null) {
		data['industry'] = entity.industry.toJson();
	}
	if (entity.position != null) {
		data['position'] = entity.position.toJson();
	}
	if (entity.jobTags != null) {
		data['jobTags'] =  entity.jobTags.map((v) => v.toJson()).toList();
	}
	if (entity.treatments != null) {
		data['treatments'] =  entity.treatments.map((v) => v.toJson()).toList();
	}
	return data;
}

jobDetailDataJobFromJson(JobDetailDataJob data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['recruiterId'] != null) {
		data.recruiterId = json['recruiterId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['jobName'] != null) {
		data.jobName = json['jobName']?.toString();
	}
	if (json['jobContent'] != null) {
		data.jobContent = json['jobContent']?.toString();
	}
	if (json['workAddress'] != null) {
		data.workAddress = json['workAddress']?.toString();
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
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['recommend'] != null) {
		data.recommend = json['recommend']?.toInt();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toInt();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toString();
	}
	if (json['workDateId'] != null) {
		data.workDateId = json['workDateId']?.toString();
	}
	if (json['candidatesTotal'] != null) {
		data.candidatesTotal = json['candidatesTotal']?.toInt();
	}
	if (json['candidatesCurrent'] != null) {
		data.candidatesCurrent = json['candidatesCurrent']?.toInt();
	}
	if (json['recruitsTotal'] != null) {
		data.recruitsTotal = json['recruitsTotal']?.toInt();
	}
	if (json['createDate'] != null) {
		data.createDate = json['createDate']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['positionType'] != null) {
		data.positionType = json['positionType']?.toInt();
	}
	return data;
}

Map<String, dynamic> jobDetailDataJobToJson(JobDetailDataJob entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['companyName'] = entity.companyName;
	data['recruiterId'] = entity.recruiterId;
	data['realName'] = entity.realName;
	data['jobName'] = entity.jobName;
	data['jobContent'] = entity.jobContent;
	data['workAddress'] = entity.workAddress;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['releaseDate'] = entity.releaseDate;
	data['industryId'] = entity.industryId;
	data['positionId'] = entity.positionId;
	data['city'] = entity.city;
	data['recommend'] = entity.recommend;
	data['weight'] = entity.weight;
	data['educationId'] = entity.educationId;
	data['workDateId'] = entity.workDateId;
	data['candidatesTotal'] = entity.candidatesTotal;
	data['candidatesCurrent'] = entity.candidatesCurrent;
	data['recruitsTotal'] = entity.recruitsTotal;
	data['createDate'] = entity.createDate;
	data['state'] = entity.state;
	data['positionType'] = entity.positionType;
	return data;
}

jobDetailDataIndustryFromJson(JobDetailDataIndustry data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toString();
	}
	return data;
}

Map<String, dynamic> jobDetailDataIndustryToJson(JobDetailDataIndustry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['industryName'] = entity.industryName;
	data['state'] = entity.state;
	data['pid'] = entity.pid;
	return data;
}

jobDetailDataPositionFromJson(JobDetailDataPosition data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['positionName'] != null) {
		data.positionName = json['positionName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toString();
	}
	return data;
}

Map<String, dynamic> jobDetailDataPositionToJson(JobDetailDataPosition entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['positionName'] = entity.positionName;
	data['state'] = entity.state;
	data['pid'] = entity.pid;
	return data;
}

jobDetailDataTreatmentsFromJson(JobDetailDataTreatments data, Map<String, dynamic> json) {
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

Map<String, dynamic> jobDetailDataTreatmentsToJson(JobDetailDataTreatments entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['treatmentName'] = entity.treatmentName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}

jobDetailDataTagsFromJson(JobDetailDataTags data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['tagName'] != null) {
		data.tagName = json['tagName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	return data;
}

Map<String, dynamic> jobDetailDataTagsToJson(JobDetailDataTags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobId'] = entity.jobId;
	data['tagName'] = entity.tagName;
	data['state'] = entity.state;
	return data;
}