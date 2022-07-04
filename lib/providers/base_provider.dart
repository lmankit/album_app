import 'package:album_app/api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Get.dialog(
      AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        content: SizedBox(
          height: 50,
          child: Center(
            child: Text(errorMessage!),
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
