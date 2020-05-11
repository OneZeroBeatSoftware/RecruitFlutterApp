import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class InterviewUpdateEntity with JsonConvert<InterviewUpdateEntity> {
	int statusCode;
	String msg;
	InterviewUpdateData data;
}

class InterviewUpdateData with JsonConvert<InterviewUpdateData> {
	String id;
	String recruiterId;
	String jobSeekerId;
	String jobId;
	String companyId;
	int interviewDate;
	String address;
	String state;
	int createDate;
	int updateDate;
}
