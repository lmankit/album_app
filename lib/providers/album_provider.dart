import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/base_provider.dart';

class AlbumProvider extends BaseProvider {
  List<Results> albumList = [];
  List<Results> searchList = [];
  AlbumResponse? albumResponse = AlbumResponse();

  bool haveSearchKey = false;

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

  void search(String value) {
    searchList.clear();
    if (value.isNotEmpty) {
      haveSearchKey = true;
      String inputString = value.replaceAll(' ', '').toLowerCase().trim();
      for (var e in albumList) {
        String albumName = e.collectionName!.replaceAll(' ', '').toLowerCase().trim();
        if (albumName.contains(inputString)) {
          searchList.add(e);
        }
      }
    } else {
      haveSearchKey = false;
    }
    notifyListeners();
  }
}
