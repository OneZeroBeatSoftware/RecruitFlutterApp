import 'package:recruit_app/generated/json/base/json_convert_content.dart';
class JobListData with JsonConvert<JobListData> {
	int total;
	int size;
	int pages;
	int current;
	List<JobListDataRecord> records;
}
class JobListDataRecord with JsonConvert<JobListDataRecord> {
	String id;
	String companyId;
	String companyName;
	String jobName;
	String workAddress;
	double minSalary;
	double maxSalary;
	int releaseDate;
	int city;
	String educationId;
	String educationName;
	int workDateId;
	String workDateName;
	int candidatesTotal;
	int candidatesCurrent;
	List<JobListDataTreatments> treatments;
}

class JobListDataTreatments with JsonConvert<JobListDataTreatments> {
	String id;
	String treatmentName;
	String content;
	String state;
}
