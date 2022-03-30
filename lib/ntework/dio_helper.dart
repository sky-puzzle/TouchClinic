import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      // baseUrl: 'https://student.valuxapps.com/api/',
         baseUrl: 'http://touch.extra-laboratory.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type':'application/json'
      }

    ));
  }

  static Future<Response> getData(
      {
        required String url,
         Map<String, dynamic>? query,
        String lang = 'en',
        String? token,
      }
        )async
   {
     dio.options.headers =
     {
       // 'lang':lang,
       'token':token,
       'Content-Type':'application/json'
     };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }



  static Future <Response> postData( {
  required String url,
  required Map <String,dynamic> data,
     String lang = 'en',
    String? token ,

})
   async {
    print("api call $token");

    dio.options.headers =
    {
      // 'lang':lang,
      'token':token,
        'Content-Type':'application/x-www-form-urlencoded'
    };
    return  await dio.post(url,data: data);

  }
}
