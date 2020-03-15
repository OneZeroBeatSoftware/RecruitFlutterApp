import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobDetailEntity with JsonConvert<JobDetailEntity> {
	int statusCode;
	String msg;
	JobDetailData data;
}

class JobDetailData with JsonConvert<JobDetailData> {
	JobDetailDataJob job;
	JobDetailDataIndustry industry;
	JobDetailDataPosition position;
	List<dynamic> jobTags;
	List<dynamic> treatments;
}

class JobDetailDataJob with JsonConvert<JobDetailDataJob> {
	String id;
	String companyId;
	String companyName;
	String recruiterId;
	String realName;
	String jobName;
	String jobContent;
	String workAddress;
	double minSalary;
	double maxSalary;
	int releaseDate;
	String industryId;
	String positionId;
	int city;
	int recommend;
	int weight;
	String educationId;
	String workDateId;
	int candidatesTotal;
	int candidatesCurrent;
	int recruitsTotal;
	int createDate;
	int state;
	int positionType;
}

class JobDetailDataIndustry with JsonConvert<JobDetailDataIndustry> {
	String id;
	String industryName;
	int state;
	String pid;
}

class JobDetailDataPosition with JsonConvert<JobDetailDataPosition> {
	String id;
	String positionName;
	int state;
	String pid;
}
