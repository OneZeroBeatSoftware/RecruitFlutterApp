import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CityEntity with JsonConvert<CityEntity> {
	int statusCode;
	String msg;
	List<CityData> data;
}

class CityData with JsonConvert<CityData> {
	String initial;
	List<CityDataCity> cities;
}

class CityDataCity with JsonConvert<CityDataCity> {
	String id;
	String cityName;
	String phonetic;
	String state;
	String pid;
}
