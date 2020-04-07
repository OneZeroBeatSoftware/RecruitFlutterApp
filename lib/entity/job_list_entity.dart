import 'package:recruit_app/generated/json/base/json_convert_content.dart';

import 'job_item_entity.dart';

class JobListEntity with JsonConvert<JobListEntity> {
	int statusCode;
	String msg;
	JobListData data;
}