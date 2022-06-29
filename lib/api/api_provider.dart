import 'package:album_app/models/album.dart';
import 'package:dio/dio.dart';

import 'dio_manager.dart';

class ApiProvider {
  static ApiProvider instance = ApiProvider._internal();
  late ApiProvider apiProvider;

  factory ApiProvider() {
    return instance;
  }

  ApiProvider._internal();

  Dio dio = DioManager().getDio();

  void fetchAlbum({
    required Function(AlbumResponse?) onSuccess,
    required Function(dynamic) onError,
  }) {
    dio.get('').then((value) => onSuccess(AlbumResponse.fromJson(value.data))).catchError((error) => onError(error));
  }
}
