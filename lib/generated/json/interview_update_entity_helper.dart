import 'package:recruit_app/entity/interview_update_entity.dart';

interviewUpdateEntityFromJson(InterviewUpdateEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new InterviewUpdateData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> interviewUpdateEntityToJson(InterviewUpdateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

interviewUpdateDataFromJson(InterviewUpdateData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['recruiterId'] != null) {
		data.recruiterId = json['recruiterId']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['interviewDate'] != null) {
		data.interviewDate = json['interviewDate']?.toInt();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	if (json['createDate'] != null) {
		data.createDate = json['createDate']?.toInt();
	}
	if (json['updateDate'] != null) {
		data.updateDate = json['updateDate']?.toInt();
	}
	return data;
}

Map<String, dynamic> interviewUpdateDataToJson(InterviewUpdateData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['recruiterId'] = entity.recruiterId;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['jobId'] = entity.jobId;
	data['companyId'] = entity.companyId;
	data['interviewDate'] = entity.interviewDate;
	data['address'] = entity.address;
	data['state'] = entity.state;
	data['createDate'] = entity.createDate;
	data['updateDate'] = entity.updateDate;
	return data;
}