import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CandidateEntity with JsonConvert<CandidateEntity> {
	int statusCode;
	String msg;
	CandidateData data;
}

class CandidateData with JsonConvert<CandidateData> {
	int total;
	int size;
	int pages;
	int current;
	List<CandidateDataRecord> records;
}

class CandidateDataRecord with JsonConvert<CandidateDataRecord> {
	String id;
	String jobSeekerId;
	String jobId;
	String resumeId;
	String realName;
	String resumeName;
	String avatar;
	int sex;
	String workDateName;
	int minSalary;
	int maxSalary;
	String educationName;
	int completeDate;
}
