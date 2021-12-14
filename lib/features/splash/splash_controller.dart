import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/models/user_model.dart';
import 'package:toffee_ride/repository/repository.dart';

class SplashController extends GetxController {
  @override
  onInit() {
    super.onInit();
    checkIfUserLoggedin();
  }

  //check if user logged in
  checkIfUserLoggedin() async {
    //wait for animations to complete
    await Future.delayed(const Duration(seconds: 5));

    final isAlreadyRun = await DbRepository.to.isAppAlreadyRun();
    if (isAlreadyRun) {
      UserModel? _user = DbRepository.to.getUser();
      if (_user == null) {
        AppController.to.notLoggedIn();
      } else {
        AppController.to.loggedIn(_user);
      }
      return;
    }
    AppController.to.notLoggedIn();
  }
}
