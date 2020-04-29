import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BaseDataEntity with JsonConvert<BaseDataEntity> {
	int statusCode;
	String msg;
	String data;
}
