import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/base_provider.dart';

class AlbumProvider extends BaseProvider {
  List<Results> albumList = [];
  AlbumResponse? albumResponse = AlbumResponse();

  AlbumProvider() {
    getAlbumData();
  }

  void getAlbumData() async {
    setStatus(Status.loading);
    apiProvider.fetchAlbum(
      onSuccess: (response) {
        albumResponse = response;
        albumList = albumResponse!.results!;
        setStatus(Status.success);
      },
      onError: (error) {
        errorMessage = "Album not found";
        setStatus(Status.error);
      },
    );
  }
}
