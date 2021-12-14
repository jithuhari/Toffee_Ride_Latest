import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/features/splash/splash.dart';
import 'package:toffee_ride/models/user_model.dart';

class MockUser extends Mock implements UserModel {}

class MockSplashController extends GetxController
    with Mock
    implements SplashController {}

void main() {
  final appController = AppController();

  final splashController = MockSplashController();

  test('user initial status', () {
    expect(appController.isLogged.value, LoggedStatus.loggedInitial);
  });

  test("user not logged in", () async {
    when(splashController.checkIfUserLoggedin())
        .thenReturn({appController.notLoggedIn()});

    expect(appController.isLogged.value, LoggedStatus.notLoggedIn);
  });

  test("user logged in", () async {
    when(splashController.checkIfUserLoggedin())
    .thenReturn({appController.loggedIn(MockUser())});

    expect(appController.isLogged.value, LoggedStatus.loggedIn);
  });
}
