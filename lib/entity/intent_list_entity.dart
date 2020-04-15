import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class IntentListEntity with JsonConvert<IntentListEntity> {
	int statusCode;
	String msg;
	List<IntentListData> data;
}

class IntentListData with JsonConvert<IntentListData> {
	String id;
	String jobSeekerId;
	String jobState;
	String positionName;
	String industryName;
	String cityName;
	String cityId;
	String positionId;
	String industryId;
	String minSalary;
	String maxSalary;
	int state;
	int defaultIntention;
}
