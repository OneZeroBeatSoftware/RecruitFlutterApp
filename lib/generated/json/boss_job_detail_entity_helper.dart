import 'package:recruit_app/entity/boss_job_detail_entity.dart';

bossJobDetailEntityFromJson(BossJobDetailEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BossJobDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> bossJobDetailEntityToJson(BossJobDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

bossJobDetailDataFromJson(BossJobDetailData data, Map<String, dynamic> json) {
	if (json['job'] != null) {
		data.job = new BossJobDetailDataJob().fromJson(json['job']);
	}
	if (json['jobDetails'] != null) {
		data.jobDetails = new List<BossJobDetailDataJobDetail>();
		(json['jobDetails'] as List).forEach((v) {
			data.jobDetails.add(new BossJobDetailDataJobDetail().fromJson(v));
		});
	}
	if (json['jobTags'] != null) {
		data.jobTags = new List<BossJobDetailDataJobTag>();
		(json['jobTags'] as List).forEach((v) {
			data.jobTags.add(new BossJobDetailDataJobTag().fromJson(v));
		});
	}
	if (json['treatments'] != null) {
		data.treatments = new List<BossJobDetailDataTreatmants>();
		(json['treatments'] as List).forEach((v) {
			data.treatments.add(new BossJobDetailDataTreatmants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bossJobDetailDataToJson(BossJobDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.job != null) {
		data['job'] = entity.job.toJson();
	}
	if (entity.jobDetails != null) {
		data['jobDetails'] =  entity.jobDetails.map((v) => v.toJson()).toList();
	}
	if (entity.jobTags != null) {
		data['jobTags'] =  entity.jobTags.map((v) => v.toJson()).toList();
	}
	if (entity.treatments != null) {
		data['treatments'] =  entity.treatments.map((v) => v.toJson()).toList();
	}
	return data;
}

bossJobDetailDataJobFromJson(BossJobDetailDataJob data, Map<String, dynamic> json) {
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
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
	}
	if (json['releaseDate'] != null) {
		data.releaseDate = json['releaseDate']?.toInt();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toString();
	}
	if (json['positionName'] != null) {
		data.positionName = json['positionName']?.toString();
	}
	if (json['cityId'] != null) {
		data.cityId = json['cityId']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
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
	if (json['positionTypeId'] != null) {
		data.positionTypeId = json['positionTypeId']?.toString();
	}
	if (json['positionTypeName'] != null) {
		data.positionTypeName = json['positionTypeName']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['recruitsTotal'] != null) {
		data.recruitsTotal = json['recruitsTotal']?.toInt();
	}
	if (json['createDate'] != null) {
		data.createDate = json['createDate']?.toInt();
	}
	if (json['candidatesTotal'] != null) {
		data.candidatesTotal = json['candidatesTotal']?.toInt();
	}
	if (json['candidatesCurrent'] != null) {
		data.candidatesCurrent = json['candidatesCurrent']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> bossJobDetailDataJobToJson(BossJobDetailDataJob entity) {
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
	data['industryName'] = entity.industryName;
	data['positionId'] = entity.positionId;
	data['positionName'] = entity.positionName;
	data['cityId'] = entity.cityId;
	data['cityName'] = entity.cityName;
	data['educationId'] = entity.educationId;
	data['educationName'] = entity.educationName;
	data['workDateId'] = entity.workDateId;
	data['workDateName'] = entity.workDateName;
	data['positionTypeId'] = entity.positionTypeId;
	data['positionTypeName'] = entity.positionTypeName;
	data['sex'] = entity.sex;
	data['recruitsTotal'] = entity.recruitsTotal;
	data['createDate'] = entity.createDate;
	data['candidatesTotal'] = entity.candidatesTotal;
	data['candidatesCurrent'] = entity.candidatesCurrent;
	data['state'] = entity.state;
	return data;
}

bossJobDetailDataJobDetailFromJson(BossJobDetailDataJobDetail data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['detailsName'] != null) {
		data.detailsName = json['detailsName']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> bossJobDetailDataJobDetailToJson(BossJobDetailDataJobDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobId'] = entity.jobId;
	data['detailsName'] = entity.detailsName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}

bossJobDetailDataJobTagFromJson(BossJobDetailDataJobTag data, Map<String, dynamic> json) {
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
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> bossJobDetailDataJobTagToJson(BossJobDetailDataJobTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobId'] = entity.jobId;
	data['tagName'] = entity.tagName;
	data['state'] = entity.state;
	return data;
}

bossJobDetailDataTreatmantsFromJson(BossJobDetailDataTreatmants data, Map<String, dynamic> json) {
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

Map<String, dynamic> bossJobDetailDataTreatmantsToJson(BossJobDetailDataTreatmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobId'] = entity.jobId;
	data['treatmentName'] = entity.treatmentName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}