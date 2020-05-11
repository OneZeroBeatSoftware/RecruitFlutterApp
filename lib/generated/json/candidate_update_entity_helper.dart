import 'package:recruit_app/entity/candidate_update_entity.dart';

candidateUpdateEntityFromJson(CandidateUpdateEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new CandidateUpdateData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> candidateUpdateEntityToJson(CandidateUpdateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

candidateUpdateDataFromJson(CandidateUpdateData data, Map<String, dynamic> json) {
	if (json['candidate'] != null) {
		data.candidate = new CandidateUpdateDataCandidate().fromJson(json['candidate']);
	}
	if (json['interview'] != null) {
		data.interview = new CandidateUpdateDataApply().fromJson(json['interview']);
	}
	return data;
}

Map<String, dynamic> candidateUpdateDataToJson(CandidateUpdateData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.candidate != null) {
		data['candidate'] = entity.candidate.toJson();
	}
	if (entity.interview != null) {
		data['interview'] = entity.interview.toJson();
	}
	return data;
}

candidateUpdateDataCandidateFromJson(CandidateUpdateDataCandidate data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['recruiterId'] != null) {
		data.recruiterId = json['recruiterId']?.toString();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['completeDate'] != null) {
		data.completeDate = json['completeDate']?.toInt();
	}
	return data;
}

Map<String, dynamic> candidateUpdateDataCandidateToJson(CandidateUpdateDataCandidate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['recruiterId'] = entity.recruiterId;
	data['jobId'] = entity.jobId;
	data['completeDate'] = entity.completeDate;
	return data;
}

candidateUpdateDataApplyFromJson(CandidateUpdateDataApply data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['createDate'] != null) {
		data.createDate = json['createDate']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['interviewDate'] != null) {
		data.interviewDate = json['interviewDate']?.toInt();
	}
	if (json['jobId'] != null) {
		data.jobId = json['jobId']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	if (json['recruiterId'] != null) {
		data.recruiterId = json['recruiterId']?.toString();
	}
	if (json['updateDate'] != null) {
		data.updateDate = json['updateDate']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	return data;
}

Map<String, dynamic> candidateUpdateDataApplyToJson(CandidateUpdateDataApply entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['avatar'] = entity.avatar;
	data['companyId'] = entity.companyId;
	data['createDate'] = entity.createDate;
	data['id'] = entity.id;
	data['interviewDate'] = entity.interviewDate;
	data['jobId'] = entity.jobId;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['phone'] = entity.phone;
	data['recruiterId'] = entity.recruiterId;
	data['updateDate'] = entity.updateDate;
	data['state'] = entity.state;
	return data;
}