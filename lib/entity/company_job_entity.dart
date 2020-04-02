import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyJobEntity with JsonConvert<CompanyJobEntity> {
	int statusCode;
	String msg;
	CompanyJobData data;
}

class CompanyJobData with JsonConvert<CompanyJobData> {
	int total;
	int size;
	int pages;
	int current;
	List<CompanyJobDataRecord> records;
}

class CompanyJobDataRecord with JsonConvert<CompanyJobDataRecord> {
	String id;
	String jobName;
	String workAddress;
	String minSalary;
	String maxSalary;
	String workDateName;
	String educationName;
}
