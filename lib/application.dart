import 'package:shared_preferences/shared_preferences.dart';

class Application{
  static SharedPreferences sp;

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }
}