import 'package:dio/dio.dart';

import '../constant/app_constant.dart';

class DioManager {
  static DioManager instance = DioManager._internal();
  late Dio dio;

  factory DioManager() {
    return instance;
  }

  DioManager._internal() {
    dio = Dio(baseOptions);
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  BaseOptions baseOptions = BaseOptions(
    receiveTimeout: 6000 * 10,
    sendTimeout: 6000 * 10,
    responseType: ResponseType.json,
    baseUrl: apiUrl,
  );

  Dio getDio() {
    return dio;
  }
}
