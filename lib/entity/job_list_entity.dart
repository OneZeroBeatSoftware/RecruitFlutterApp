import 'package:recruit_app/entity/job_item_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobListEntity with JsonConvert<JobListEntity> {
	int statusCode;
	String msg;
	JobListData data;
}