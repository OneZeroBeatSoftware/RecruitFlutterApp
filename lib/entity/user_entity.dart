import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	int statusCode;
	String msg;
	String data;
}
