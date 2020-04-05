import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class FileUploadEntity with JsonConvert<FileUploadEntity> {
	int statusCode;
	String msg;
	String data;
}
