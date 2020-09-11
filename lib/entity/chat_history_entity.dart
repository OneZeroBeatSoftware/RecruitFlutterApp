import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ChatHistoryEntity with JsonConvert<ChatHistoryEntity> {
	int statusCode;
	String msg;
	List<ChatHistoryData> data;
}

class ChatHistoryData with JsonConvert<ChatHistoryData> {
	int id;
	int fromId;
	int toId;
	String content;
	int contentType;
	int sendTime;
	int isLook;
}
