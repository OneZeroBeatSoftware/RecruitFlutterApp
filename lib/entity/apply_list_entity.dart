import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ApplyListEntity with JsonConvert<ApplyListEntity> {
	int statusCode;
	String msg;
	ApplyListData data;
}

class ApplyListData with JsonConvert<ApplyListData> {
	int total;
	int size;
	int pages;
	int current;
	List<ApplyListDataRecord> records;
}

class ApplyListDataRecord with JsonConvert<ApplyListDataRecord> {
	String id;
	String jobId;
	String companyId;
	String companyName;
	String jobName;
	String workAddress;
	String minSalary;
	String maxSalary;
	int releaseDate;
	String city;
	String educationId;
	String educationName;
	String avatar;
	String workDateId;
	String workDateName;
	String candidatesTotal;
	String candidatesCurrent;
	List<ApplyListDataRecordsTreatmants> treatments;
	int state;
	int applyDate;
}

class ApplyListDataRecordsTreatmants with JsonConvert<ApplyListDataRecordsTreatmants> {
	String id;
	String jobId;
	String treatmentName;
	String content;
	int state;
}
