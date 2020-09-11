import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class SocketMsgEntity with JsonConvert<SocketMsgEntity> {
	String code;
	String content;
	String contentType;
	String fromId;
	String groupId;
	String nickname;
	String sendTime;
	String toId;
	String version;
}
