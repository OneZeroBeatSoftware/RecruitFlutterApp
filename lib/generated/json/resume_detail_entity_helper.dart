import 'package:recruit_app/entity/resume_detail_entity.dart';

resumeDetailEntityFromJson(ResumeDetailEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new ResumeDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> resumeDetailEntityToJson(ResumeDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

resumeDetailDataFromJson(ResumeDetailData data, Map<String, dynamic> json) {
	if (json['resume'] != null) {
		data.resume = new ResumeDetailDataResume().fromJson(json['resume']);
	}
	if (json['certificates'] != null) {
		data.certificates = new List<ResumeDetailDataCertificate>();
		(json['certificates'] as List).forEach((v) {
			data.certificates.add(new ResumeDetailDataCertificate().fromJson(v));
		});
	}
	if (json['socialHomepage'] != null) {
		data.socialHomepage = json['socialHomepage']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['workExperience'] != null) {
		data.workExperience = new List<ResumeDetailDataWorkExperience>();
		(json['workExperience'] as List).forEach((v) {
			data.workExperience.add(new ResumeDetailDataWorkExperience().fromJson(v));
		});
	}
	if (json['projectExperience'] != null) {
		data.projectExperience = new List<ResumeDetailDataProjectExperience>();
		(json['projectExperience'] as List).forEach((v) {
			data.projectExperience.add(new ResumeDetailDataProjectExperience().fromJson(v));
		});
	}
	if (json['educationExperience'] != null) {
		data.educationExperience = new List<ResumeDetailDataEducationExperience>();
		(json['educationExperience'] as List).forEach((v) {
			data.educationExperience.add(new ResumeDetailDataEducationExperience().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resumeDetailDataToJson(ResumeDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.resume != null) {
		data['resume'] = entity.resume.toJson();
	}
	if (entity.certificates != null) {
		data['certificates'] =  entity.certificates.map((v) => v.toJson()).toList();
	}
	data['socialHomepage'] = entity.socialHomepage;
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

resumeDetailDataResumeFromJson(ResumeDetailDataResume data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeName'] != null) {
		data.resumeName = json['resumeName']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['birthDate'] != null) {
		data.birthDate = json['birthDate']?.toInt();
	}
	if (json['workExp'] != null) {
		data.workExp = json['workExp']?.toInt();
	}
	if (json['age'] != null) {
		data.age = json['age']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['graduationDate'] != null) {
		data.graduationDate = json['graduationDate']?.toInt();
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
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
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
	if (json['defaultResume'] != null) {
		data.defaultResume = json['defaultResume']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['socialHomepage'] != null) {
		data.socialHomepage = json['socialHomepage']?.toString();
	}
	return data;
}

Map<String, dynamic> resumeDetailDataResumeToJson(ResumeDetailDataResume entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeName'] = entity.resumeName;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['realName'] = entity.realName;
	data['birthDate'] = entity.birthDate;
	data['workExp'] = entity.workExp;
	data['age'] = entity.age;
	data['sex'] = entity.sex;
	data['address'] = entity.address;
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
	data['defaultResume'] = entity.defaultResume;
	data['state'] = entity.state;
	data['socialHomepage'] = entity.socialHomepage;
	return data;
}

resumeDetailDataCertificateFromJson(ResumeDetailDataCertificate data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['certificateName'] != null) {
		data.certificateName = json['certificateName']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> resumeDetailDataCertificateToJson(ResumeDetailDataCertificate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['certificateName'] = entity.certificateName;
	data['resumeId'] = entity.resumeId;
	data['state'] = entity.state;
	return data;
}

resumeDetailDataWorkExperienceFromJson(ResumeDetailDataWorkExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['positionName'] != null) {
		data.positionName = json['positionName']?.toString();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate']?.toInt();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate']?.toInt();
	}
	if (json['department'] != null) {
		data.department = json['department']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> resumeDetailDataWorkExperienceToJson(ResumeDetailDataWorkExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['companyName'] = entity.companyName;
	data['industryId'] = entity.industryId;
	data['positionId'] = entity.positionId;
	data['industryName'] = entity.industryName;
	data['positionName'] = entity.positionName;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['department'] = entity.department;
	data['state'] = entity.state;
	return data;
}

resumeDetailDataProjectExperienceFromJson(ResumeDetailDataProjectExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['projectName'] != null) {
		data.projectName = json['projectName']?.toString();
	}
	if (json['projectContent'] != null) {
		data.projectContent = json['projectContent']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
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

Map<String, dynamic> resumeDetailDataProjectExperienceToJson(ResumeDetailDataProjectExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['projectName'] = entity.projectName;
	data['projectContent'] = entity.projectContent;
	data['industryId'] = entity.industryId;
	data['industryName'] = entity.industryName;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['state'] = entity.state;
	return data;
}

resumeDetailDataEducationExperienceFromJson(ResumeDetailDataEducationExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['school'] != null) {
		data.school = json['school']?.toString();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toString();
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

Map<String, dynamic> resumeDetailDataEducationExperienceToJson(ResumeDetailDataEducationExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['school'] = entity.school;
	data['educationId'] = entity.educationId;
	data['educationName'] = entity.educationName;
	data['specialty'] = entity.specialty;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['state'] = entity.state;
	return data;
}