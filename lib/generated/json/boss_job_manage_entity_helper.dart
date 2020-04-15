import 'package:recruit_app/entity/boss_job_manage_entity.dart';

bossJobManageEntityFromJson(BossJobManageEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<BossJobManageData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new BossJobManageData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bossJobManageEntityToJson(BossJobManageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

bossJobManageDataFromJson(BossJobManageData data, Map<String, dynamic> json) {
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
		data.minSalary = json['minSalary']?.toInt();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toInt();
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
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toInt();
	}
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toInt();
	}
	if (json['recommend'] != null) {
		data.recommend = json['recommend']?.toInt();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toInt();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toInt();
	}
	if (json['workDateId'] != null) {
		data.workDateId = json['workDateId']?.toInt();
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
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['positionType'] != null) {
		data.positionType = json['positionType']?.toInt();
	}
	return data;
}

Map<String, dynamic> bossJobManageDataToJson(BossJobManageData entity) {
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
	data['longitude'] = entity.longitude;
	data['latitude'] = entity.latitude;
	data['recommend'] = entity.recommend;
	data['weight'] = entity.weight;
	data['educationId'] = entity.educationId;
	data['workDateId'] = entity.workDateId;
	data['candidatesTotal'] = entity.candidatesTotal;
	data['candidatesCurrent'] = entity.candidatesCurrent;
	data['recruitsTotal'] = entity.recruitsTotal;
	data['createDate'] = entity.createDate;
	data['state'] = entity.state;
	data['sex'] = entity.sex;
	data['positionType'] = entity.positionType;
	return data;
}