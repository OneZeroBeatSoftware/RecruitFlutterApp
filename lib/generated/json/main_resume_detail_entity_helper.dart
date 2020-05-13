import 'package:recruit_app/entity/main_resume_detail_entity.dart';

mainResumeDetailEntityFromJson(MainResumeDetailEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new MainResumeDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> mainResumeDetailEntityToJson(MainResumeDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

mainResumeDetailDataFromJson(MainResumeDetailData data, Map<String, dynamic> json) {
	if (json['resume'] != null) {
		data.resume = new MainResumeDetailDataResume().fromJson(json['resume']);
	}
	if (json['starId'] != null) {
		data.starId = json['starId']?.toString();
	}
	if (json['workExperience'] != null) {
		data.workExperience = new List<MainResumeDetailDataWorkExperience>();
		(json['workExperience'] as List).forEach((v) {
			data.workExperience.add(new MainResumeDetailDataWorkExperience().fromJson(v));
		});
	}
	if (json['projectExperience'] != null) {
		data.projectExperience = new List<MainResumeDetailDataProjectExperience>();
		(json['projectExperience'] as List).forEach((v) {
			data.projectExperience.add(new MainResumeDetailDataProjectExperience().fromJson(v));
		});
	}
	if (json['educationExperience'] != null) {
		data.educationExperience = new List<MainResumeDetailDataEducationExperience>();
		(json['educationExperience'] as List).forEach((v) {
			data.educationExperience.add(new MainResumeDetailDataEducationExperience().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> mainResumeDetailDataToJson(MainResumeDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.resume != null) {
		data['resume'] = entity.resume.toJson();
	}
	data['starId'] = entity.starId;
	if (entity.workExperience != null) {
		data['workExperience'] =  entity.workExperience.map((v) => v.toJson()).toList();
	}
	if (entity.projectExperience != null) {
		data['projectExperience'] =  entity.projectExperience.map((v) => v.toJson()).toList();
	}
	if (entity.educationExperience != null) {
		data['educationExperience'] =  entity.educationExperience.map((v) => v.toJson()).toList();
	}
	return data;
}

mainResumeDetailDataResumeFromJson(MainResumeDetailDataResume data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['resumeName'] != null) {
		data.resumeName = json['resumeName']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['age'] != null) {
		data.age = json['age']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['workExp'] != null) {
		data.workExp = json['workExp']?.toInt();
	}
	if (json['birthDate'] != null) {
		data.birthDate = json['birthDate']?.toInt();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['graduationDate'] != null) {
		data.graduationDate = json['graduationDate']?.toInt();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toInt();
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
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toInt();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toInt();
	}
	if (json['workExperienceId'] != null) {
		data.workExperienceId = json['workExperienceId']?.toString();
	}
	if (json['projectExperienceId'] != null) {
		data.projectExperienceId = json['projectExperienceId']?.toString();
	}
	if (json['educationExperienceId'] != null) {
		data.educationExperienceId = json['educationExperienceId']?.toString();
	}
	if (json['socialHomepage'] != null) {
		data.socialHomepage = json['socialHomepage']?.toString();
	}
	if (json['defaultResume'] != null) {
		data.defaultResume = json['defaultResume']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	return data;
}

Map<String, dynamic> mainResumeDetailDataResumeToJson(MainResumeDetailDataResume entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['resumeName'] = entity.resumeName;
	data['realName'] = entity.realName;
	data['age'] = entity.age;
	data['sex'] = entity.sex;
	data['workExp'] = entity.workExp;
	data['birthDate'] = entity.birthDate;
	data['address'] = entity.address;
	data['avatar'] = entity.avatar;
	data['graduationDate'] = entity.graduationDate;
	data['educationId'] = entity.educationId;
	data['educationName'] = entity.educationName;
	data['workDateId'] = entity.workDateId;
	data['workDateName'] = entity.workDateName;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['workExperienceId'] = entity.workExperienceId;
	data['projectExperienceId'] = entity.projectExperienceId;
	data['educationExperienceId'] = entity.educationExperienceId;
	data['socialHomepage'] = entity.socialHomepage;
	data['defaultResume'] = entity.defaultResume;
	data['state'] = entity.state;
	data['phone'] = entity.phone;
	return data;
}

mainResumeDetailDataWorkExperienceFromJson(MainResumeDetailDataWorkExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toString();
	}
	if (json['positionName'] != null) {
		data.positionName = json['positionName']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['workContent'] != null) {
		data.workContent = json['workContent']?.toString();
	}
	if (json['department'] != null) {
		data.department = json['department']?.toString();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate']?.toInt();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> mainResumeDetailDataWorkExperienceToJson(MainResumeDetailDataWorkExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['companyName'] = entity.companyName;
	data['positionId'] = entity.positionId;
	data['positionName'] = entity.positionName;
	data['industryName'] = entity.industryName;
	data['industryId'] = entity.industryId;
	data['workContent'] = entity.workContent;
	data['department'] = entity.department;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['state'] = entity.state;
	return data;
}

mainResumeDetailDataProjectExperienceFromJson(MainResumeDetailDataProjectExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['projectName'] != null) {
		data.projectName = json['projectName']?.toString();
	}
	if (json['position'] != null) {
		data.position = json['position']?.toString();
	}
	if (json['projectContent'] != null) {
		data.projectContent = json['projectContent']?.toString();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate']?.toInt();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> mainResumeDetailDataProjectExperienceToJson(MainResumeDetailDataProjectExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['projectName'] = entity.projectName;
	data['position'] = entity.position;
	data['projectContent'] = entity.projectContent;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['state'] = entity.state;
	return data;
}

mainResumeDetailDataEducationExperienceFromJson(MainResumeDetailDataEducationExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	if (json['specialty'] != null) {
		data.specialty = json['specialty']?.toString();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate']?.toInt();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> mainResumeDetailDataEducationExperienceToJson(MainResumeDetailDataEducationExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['educationName'] = entity.educationName;
	data['specialty'] = entity.specialty;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['state'] = entity.state;
	return data;
}