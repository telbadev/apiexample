import 'package:dio/dio.dart';

class ApiService {
  String BASE_URL="https://64088dcf2f01352a8a965e74.mockapi.io/";
  static String PRODUCTS = "products/";
  static String PRODUCT = "products/";//id
  Dio dio = Dio();


  Future<Response?> GET(String api) async {
    Response response = await dio.get(BASE_URL + api);
    if(response.statusCode==200) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> POST(String api,Map<String,dynamic> params) async {
    Response response = await dio.post(BASE_URL + api,data: params);
    if(response.statusCode==200 && response.statusCode==201) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> PUT(String api,Map<String,dynamic> params) async {
    Response response = await dio.put(BASE_URL + api,data: params);
    if(response.statusCode==200) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> DEL(String api,) async {
    Response response = await dio.delete(BASE_URL + api,);
    if(response.statusCode==200) {
      return response;
    } else {
      return null;
    }
  }

}