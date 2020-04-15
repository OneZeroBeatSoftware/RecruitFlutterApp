import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossJobManageEntity with JsonConvert<BossJobManageEntity> {
	int statusCode;
	String msg;
	List<BossJobManageData> data;
}

class BossJobManageData with JsonConvert<BossJobManageData> {
	String id;
	String companyId;
	String companyName;
	String recruiterId;
	String realName;
	String jobName;
	String jobContent;
	String workAddress;
	int minSalary;
	int maxSalary;
	int releaseDate;
	String industryId;
	String positionId;
	int city;
	int longitude;
	int latitude;
	int recommend;
	int weight;
	int educationId;
	int workDateId;
	int candidatesTotal;
	int candidatesCurrent;
	int recruitsTotal;
	int createDate;
	int state;
	int sex;
	int positionType;
}
