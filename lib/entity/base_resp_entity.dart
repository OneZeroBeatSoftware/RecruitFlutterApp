import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BaseRespEntity with JsonConvert<BaseRespEntity> {
	int statusCode;
	String msg;
}
