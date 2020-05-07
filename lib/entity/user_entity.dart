import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	int statusCode;
	String msg;
	UserData data;
}

class UserData with JsonConvert<UserData> {
	String token;
	String jobSeekerId;
	String userId;
	String recruiterId;
	String phone;
	String email;
}
