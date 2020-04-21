import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CollectionEntity with JsonConvert<CollectionEntity> {
	int statusCode;
	String msg;
	String data;
}
