import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class SeekerInterviewEntity with JsonConvert<SeekerInterviewEntity> {
	int statusCode;
	String msg;
	SeekerInterviewData data;
}

class SeekerInterviewData with JsonConvert<SeekerInterviewData> {
	int total;
	int size;
	int pages;
	int current;
	List<SeekerInterviewDataRecord> records;
}

class SeekerInterviewDataRecord with JsonConvert<SeekerInterviewDataRecord> {
	String id;
	String resumeId;
	String realName;
	String jobId;
	String jobName;
	String minSalary;
	String maxSalary;
	String companyName;
	int interviewDate;
	String address;
	String phone;
	String avatar;
	String state;
}
