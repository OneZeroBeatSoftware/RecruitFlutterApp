import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CandidateUpdateEntity with JsonConvert<CandidateUpdateEntity> {
	int statusCode;
	String msg;
	CandidateUpdateData data;
}

class CandidateUpdateData with JsonConvert<CandidateUpdateData> {
	CandidateUpdateDataCandidate candidate;
	CandidateUpdateDataApply interview;
}

class CandidateUpdateDataCandidate with JsonConvert<CandidateUpdateDataCandidate> {
	String id;
	String jobSeekerId;
	String recruiterId;
	String jobId;
	int completeDate;
}

class CandidateUpdateDataApply with JsonConvert<CandidateUpdateDataApply> {
	String address;
	String avatar;
	String companyId;
	String createDate;
	String id;
	int interviewDate;
	String jobId;
	String jobSeekerId;
	String phone;
	String recruiterId;
	String updateDate;
	String state;
}
