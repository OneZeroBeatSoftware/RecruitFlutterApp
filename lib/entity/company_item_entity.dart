import 'package:recruit_app/generated/json/base/json_convert_content.dart';
import 'package:recruit_app/generated/json/base/json_filed.dart';
class CompanyListData with JsonConvert<CompanyListData> {
	int total;
	int size;
	int pages;
	int current;
	List<CompanyListDataRecord> records;
}
class CompanyListDataRecord with JsonConvert<CompanyListDataRecord> {
	String id;
	String starId;
	String companyName;
	String registerAddress;
	String managementName;
	String avatar;
	String cityName;
	String scaleName;
	String industryName;
	List<CompanyListDataRecordsJobInfo> jobInfo;
}

class CompanyListDataRecordsJobInfo with JsonConvert<CompanyListDataRecordsJobInfo> {
	@JSONField(name: "job_name")
	String jobName;
	String id;
}
