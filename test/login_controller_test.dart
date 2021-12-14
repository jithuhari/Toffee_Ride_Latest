import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:toffee_ride/features/login/login.dart';
import 'package:toffee_ride/models/dto/login_response.dart';
import 'package:toffee_ride/repository/repository.dart';

class FakeApiRepositoryImpl extends GetxController
    with Mock
    implements ApiRepository {
  @override
  Future<LoginResponse> loginWithMobile({required String mobile}) async {
    if (mobile == "9946513856") {
      return LoginResponse(success: true, data: true);
    } else {
      return LoginResponse(success: false, data: false);
    }
  }
}

class FakeExceptionApiRepositoryImpl extends GetxController
    with Mock
    implements ApiRepositoryImpl {
  @override
  Future<LoginResponse> loginWithMobile({required String mobile}) async {
    throw const FormatException("wrong format");
  }
}

void main() {
  
  final controller = LoginController();
  final apiRep = FakeApiRepositoryImpl();
  final apiExceptionRep = FakeExceptionApiRepositoryImpl();

  test("login success", () async {
    controller.mobileNumberController.text = "9946513856";

    var response = await apiRep.loginWithMobile(
        mobile: controller.mobileNumberController.text);
    expect(response.success, true);
  });

  test("login failed", () async {
    controller.mobileNumberController.text = "123456789";

    var response = await apiRep.loginWithMobile(
        mobile: controller.mobileNumberController.text);
    expect(response.success, false);
  });

  test("login exception", () async {
    controller.mobileNumberController.text = "123456789";

    try {
      await apiExceptionRep.loginWithMobile(
          mobile: controller.mobileNumberController.text);
      fail("exception not thrown");
    } catch (e) {
      expect(e, isInstanceOf<FormatException>());
    }
  });
}
