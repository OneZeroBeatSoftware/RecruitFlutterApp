import 'package:dio/dio.dart';
import 'package:recruit_app/application.dart';

class TokenInterceptor extends Interceptor{
  @override
  Future onRequest(RequestOptions options) async {
    if(Application.sp.get('token')!=null){
      Map<String,String> tokenMap={'access-token':Application.sp.get('token')};
      print('access-token:'+Application.sp.get('token'));
      options.headers.addAll(tokenMap);
    }
  }
}