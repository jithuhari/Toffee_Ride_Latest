import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/repository/repository.dart';

class HomeController extends GetxController {
  tappedOnSuperParentButton() {
    Get.toNamed('/parent');
  }

  tappedOnViewContentsButton() {
    Get.toNamed('/view_contents');
  }

  tappedOnLogoutButton() {
    DbRepository.to.clearData();
    AppController.to.loggedOut();
  }
}
