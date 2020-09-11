import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class MsgListEntity with JsonConvert<MsgListEntity> {
	int statusCode;
	String msg;
	List<MsgListData> data;
}

class MsgListData with JsonConvert<MsgListData> {
	int userId;
	String toRoleImgUrl;
	String toRoleName;
	String newestMessage;
	int newestTime;
}
