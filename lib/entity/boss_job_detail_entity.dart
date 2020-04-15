import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossJobDetailEntity with JsonConvert<BossJobDetailEntity> {
	int statusCode;
	String msg;
	BossJobDetailData data;
}

class BossJobDetailData with JsonConvert<BossJobDetailData> {
	BossJobDetailDataJob job;
	BossJobDetailDataIndustry industry;
	BossJobDetailDataPosition position;
	List<BossJobDetailDataJobDetail> jobDetails;
	List<BossJobDetailDataJobTag> jobTags;
	List<BossJobDetailDataTreatmants> treatments;
}

class BossJobDetailDataJob with JsonConvert<BossJobDetailDataJob> {
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
	int industryId;
	int positionId;
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

class BossJobDetailDataIndustry with JsonConvert<BossJobDetailDataIndustry> {
	String id;
	String pid;
	String industryName;
	int state;
}

class BossJobDetailDataPosition with JsonConvert<BossJobDetailDataPosition> {
	String id;
	String pid;
	String positionName;
	int state;
}

class BossJobDetailDataJobDetail with JsonConvert<BossJobDetailDataJobDetail> {
	String id;
	String jobId;
	String detailsName;
	String content;
	int state;
}

class BossJobDetailDataJobTag with JsonConvert<BossJobDetailDataJobTag> {
	String id;
	String jobId;
	String tagName;
	int state;
}

class BossJobDetailDataTreatmants with JsonConvert<BossJobDetailDataTreatmants> {
	String id;
	String jobId;
	String treatmentName;
	String content;
	int state;
}
