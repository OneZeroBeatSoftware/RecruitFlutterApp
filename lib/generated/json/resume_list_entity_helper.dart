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
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['birthDate'] != null) {
		data.birthDate = json['birthDate']?.toInt();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['graduationDate'] != null) {
		data.graduationDate = json['graduationDate']?.toInt();
	}
	if (json['education'] != null) {
		data.education = json['education']?.toInt();
	}
	if (json['workDate'] != null) {
		data.workDate = json['workDate']?.toString();
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
	return data;
}

Map<String, dynamic> resumeListDataToJson(ResumeListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['resumeName'] = entity.resumeName;
	data['realName'] = entity.realName;
	data['sex'] = entity.sex;
	data['birthDate'] = entity.birthDate;
	data['address'] = entity.address;
	data['graduationDate'] = entity.graduationDate;
	data['education'] = entity.education;
	data['workDate'] = entity.workDate;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['workExperienceId'] = entity.workExperienceId;
	data['projectExperienceId'] = entity.projectExperienceId;
	data['educationExperienceId'] = entity.educationExperienceId;
	data['defaultResume'] = entity.defaultResume;
	data['state'] = entity.state;
	return data;
}