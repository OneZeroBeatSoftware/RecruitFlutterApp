import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossJobDetailEntity with JsonConvert<BossJobDetailEntity> {
	int statusCode;
	String msg;
	BossJobDetailData data;
}

class BossJobDetailData with JsonConvert<BossJobDetailData> {
	BossJobDetailDataJob job;
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
	String minSalary;
	String maxSalary;
	int releaseDate;
	String industryId;
	String industryName;
	String positionId;
	String positionName;
	String cityId;
	String cityName;
	String educationId;
	String educationName;
	String workDateId;
	String workDateName;
	String positionTypeId;
	String positionTypeName;
	int sex;
	int recruitsTotal;
	int createDate;
	int candidatesTotal;
	int candidatesCurrent;
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
