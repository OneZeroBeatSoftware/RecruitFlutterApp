import 'package:recruit_app/entity/resume_list_entity.dart';

resumeListEntityFromJson(ResumeListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ResumeListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ResumeListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resumeListEntityToJson(ResumeListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

resumeListDataFromJson(ResumeListData data, Map<String, dynamic> json) {
	if (json['resume'] != null) {
		data.resume = new ResumeListDataResume().fromJson(json['resume']);
	}
	if (json['certificates'] != null) {
		data.certificates = new List<ResumeListDataCertificate>();
		(json['certificates'] as List).forEach((v) {
			data.certificates.add(new ResumeListDataCertificate().fromJson(v));
		});
	}
	if (json['socialHomepage'] != null) {
		data.socialHomepage = json['socialHomepage']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['workExperience'] != null) {
		data.workExperience = new List<ResumeListDataWorkExperience>();
		(json['workExperience'] as List).forEach((v) {
			data.workExperience.add(new ResumeListDataWorkExperience().fromJson(v));
		});
	}
	if (json['projectExperience'] != null) {
		data.projectExperience = new List<ResumeListDataProjectExperience>();
		(json['projectExperience'] as List).forEach((v) {
			data.projectExperience.add(new ResumeListDataProjectExperience().fromJson(v));
		});
	}
	if (json['educationExperience'] != null) {
		data.educationExperience = new List<ResumeListDataEducationExperience>();
		(json['educationExperience'] as List).forEach((v) {
			data.educationExperience.add(new ResumeListDataEducationExperience().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resumeListDataToJson(ResumeListData entity) {
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

resumeListDataResumeFromJson(ResumeListDataResume data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['resumeName'] != null) {
		data.resumeName = json['resumeName']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toInt();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
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
		data.minSalary = json['minSalary']?.toDouble();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toDouble();
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
	if (json['socialHomepage'] != null) {
		data.socialHomepage = json['socialHomepage']?.toString();
	}
	return data;
}

Map<String, dynamic> resumeListDataResumeToJson(ResumeListDataResume entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['resumeName'] = entity.resumeName;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['realName'] = entity.realName;
	data['avatar'] = entity.avatar;
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
	data['defaultResume'] = entity.defaultResume;
	data['state'] = entity.state;
	data['phone'] = entity.phone;
	data['socialHomepage'] = entity.socialHomepage;
	return data;
}

resumeListDataCertificateFromJson(ResumeListDataCertificate data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['certificateName'] != null) {
		data.certificateName = json['certificateName']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> resumeListDataCertificateToJson(ResumeListDataCertificate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['certificateName'] = entity.certificateName;
	data['resumeId'] = entity.resumeId;
	data['state'] = entity.state;
	return data;
}

resumeListDataWorkExperienceFromJson(ResumeListDataWorkExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toInt();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toInt();
	}
	if (json['positionId'] != null) {
		data.positionId = json['positionId']?.toInt();
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

Map<String, dynamic> resumeListDataWorkExperienceToJson(ResumeListDataWorkExperience entity) {
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

resumeListDataProjectExperienceFromJson(ResumeListDataProjectExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['projectName'] != null) {
		data.projectName = json['projectName']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toInt();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toInt();
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
	if (json['projectContent'] != null) {
		data.projectContent = json['projectContent']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> resumeListDataProjectExperienceToJson(ResumeListDataProjectExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['projectName'] = entity.projectName;
	data['resumeId'] = entity.resumeId;
	data['industryId'] = entity.industryId;
	data['industryName'] = entity.industryName;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['projectContent'] = entity.projectContent;
	data['state'] = entity.state;
	return data;
}

resumeListDataEducationExperienceFromJson(ResumeListDataEducationExperience data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toInt();
	}
	if (json['school'] != null) {
		data.school = json['school']?.toString();
	}
	if (json['educationId'] != null) {
		data.educationId = json['educationId']?.toInt();
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

Map<String, dynamic> resumeListDataEducationExperienceToJson(ResumeListDataEducationExperience entity) {
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