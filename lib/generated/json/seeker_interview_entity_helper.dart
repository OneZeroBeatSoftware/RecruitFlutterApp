import 'package:recruit_app/entity/seeker_interview_entity.dart';

seekerInterviewEntityFromJson(SeekerInterviewEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new SeekerInterviewData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> seekerInterviewEntityToJson(SeekerInterviewEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

seekerInterviewDataFromJson(SeekerInterviewData data, Map<String, dynamic> json) {
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
		data.records = new List<SeekerInterviewDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new SeekerInterviewDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> seekerInterviewDataToJson(SeekerInterviewData entity) {
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

seekerInterviewDataRecordFromJson(SeekerInterviewDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['jobName'] != null) {
		data.jobName = json['jobName']?.toString();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['interviewDate'] != null) {
		data.interviewDate = json['interviewDate']?.toInt();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	return data;
}

Map<String, dynamic> seekerInterviewDataRecordToJson(SeekerInterviewDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['realName'] = entity.realName;
	data['jobId'] = entity.jobId;
	data['jobName'] = entity.jobName;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['companyName'] = entity.companyName;
	data['interviewDate'] = entity.interviewDate;
	data['address'] = entity.address;
	data['phone'] = entity.phone;
	data['avatar'] = entity.avatar;
	data['state'] = entity.state;
	return data;
}