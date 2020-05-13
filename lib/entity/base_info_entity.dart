import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BaseInfoEntity with JsonConvert<BaseInfoEntity> {
	int statusCode;
	String msg;
	BaseInfoData data;
}

class BaseInfoData with JsonConvert<BaseInfoData> {
	String id;
	String userId;
	String realName;
	String avatar;
}
