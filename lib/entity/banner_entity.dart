import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	int statusCode;
	String msg;
	List<BannerData> data;
}

class BannerData with JsonConvert<BannerData> {
	String id;
	String desc;
	String image;
	String url;
	int actionType;
	String actionValue;
	int visible;
	int rank;
	int state;
}
