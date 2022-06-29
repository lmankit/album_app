import 'package:album_app/models/album.dart';
import 'package:album_app/providers/base_provider.dart';

class AlbumProvider extends BaseProvider {
  List<AlbumResponse> albumList = [];
  AlbumResponse? albumResponse = AlbumResponse();

  AlbumProvider() {
    getAlbumData();
  }

  void getAlbumData() {
    print('Get album data');
    setStatus(Status.loading);
    apiProvider.fetchAlbum(
      onSuccess: (response) {
        albumResponse = albumResponse;
        setStatus(Status.success);
      },
      onError: (error) {
        errorMessage = "Album not found";
        setStatus(Status.error);
      },
    );
  }
}
