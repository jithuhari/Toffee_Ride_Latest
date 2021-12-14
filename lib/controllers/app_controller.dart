import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/account_model.dart';
import 'package:toffee_ride/models/user_model.dart';

enum LoggedStatus { loggedInitial, notLoggedIn, loggedIn, loggedInCompletely }

class AppController extends GetxController {
  static AppController get to => Get.find();

  final isLogged = LoggedStatus.loggedInitial.obs;
  UserModel? _user;

  AccountModel? _account;

  //static const platform = MethodChannel('toffee_ride.flutter.dev/orientation');

  @override
  onInit() {
    super.onInit();
    ever(isLogged, _fireRoute);
  }

  _fireRoute(logged) async {
    if (logged == LoggedStatus.loggedInCompletely) {
      Get.offAllNamed('/home');
    } else if (logged == LoggedStatus.loggedIn) {
      Get.offAllNamed('/accounts');
    } else if (logged == LoggedStatus.notLoggedIn) {
      Get.offAllNamed('/onboard');
    }
  }

  loggedIn(UserModel user) {
    _user = user;
    isLogged(LoggedStatus.loggedIn);
  }

  selectedAccount(AccountModel account) {
    _account = account;
    isLogged(LoggedStatus.loggedInCompletely);
  }

  notLoggedIn() {
    isLogged(LoggedStatus.notLoggedIn);
  }

  loggedOut() {
    _user = null;
    isLogged(LoggedStatus.notLoggedIn);
  }

  UserModel? getUser() {
    return _user;
  }

  AccountModel? getAccount() {
    return _account;
  }
}
