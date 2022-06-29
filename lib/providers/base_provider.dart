import 'package:album_app/api/api_provider.dart';
import 'package:flutter/material.dart';

enum Status { init, loading, error, success }

class BaseProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
  Status status = Status.init;
  String? errorMessage;

  void setStatus(Status currentStatus) {
    status = currentStatus;
    notifyListeners();
  }

  void setErrorMessage(String error) {
    errorMessage = error;
  }
}
