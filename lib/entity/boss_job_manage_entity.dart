import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossJobManageEntity with JsonConvert<BossJobManageEntity> {
	int statusCode;
	String msg;
	BossJobManageData data;
}

class BossJobManageData with JsonConvert<BossJobManageData> {
	int total;
	int size;
	int pages;
	int current;
	List<BossJobManageDataRecord> records;
}

class BossJobManageDataRecord with JsonConvert<BossJobManageDataRecord> {
	String id;
	String recruiterId;
	String companyId;
	String companyName;
	String jobName;
	String workAddress;
	int minSalary;
	int maxSalary;
	int releaseDate;
	int city;
	String cityName;
	String educationId;
	String educationName;
	String workDateId;
	String workDateName;
	int candidatesTotal;
	int candidatesCurrent;
	String avatar;
	int state;
}
