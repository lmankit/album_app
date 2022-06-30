import 'dart:convert';

import 'package:album_app/models/album_response.dart';
import 'package:dio/dio.dart';

import 'dio_manager.dart';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  Dio dio = DioManager().getDio();

  void fetchAlbum({
    required Function(AlbumResponse?) onSuccess,
    required Function(dynamic) onError,
  }) async {
    try {
      var response = await dio.get('');
      onSuccess(AlbumResponse.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      onError(e);
    }
  }
}
