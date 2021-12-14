import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/repository/repository.dart';
import 'package:toffee_ride/utils/utils.dart';

class OtpController extends GetxController {
  //params
  bool _isSignUp = false;
  bool _isEmail = false;
  String? _countryCode;
  String? _mobileNumber;
  String? _email;

  bool get isSignUp => _isSignUp;
  bool get isEmail => _isEmail;

  String get displayItem =>
      _isEmail ? _email ?? '' : "${_countryCode ?? ''} ${_mobileNumber ?? ''}";

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final otpTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _getParams();
  }

  @override
  void onClose() {
    otpTextController.dispose();
    super.onClose();
  }

  _getParams() {
    final arguments = Get.arguments;
    _isSignUp = arguments["isSignUp"];
    _isEmail = arguments["isEmail"];
    _countryCode = arguments["countryCode"];
    _mobileNumber = arguments["mobile"];
    _email = arguments["email"];
  }

  onTappedSubmit() {
    _otpVerification();
  }

  _otpVerification() async {
    final _validationStatus = _validate();

    if (_validationStatus is ValidationSuccess) {
      _isLoading(true);
      try {
        final response;

        if (_isEmail) {
          response = await ApiRepository.to.otpVerificationEmail(
              otp: otpTextController.text,
              isLogin: _isSignUp ? '0' : '1',
              email: _email ?? '');
        } else {
          response = await ApiRepository.to.otpVerificationMobile(
              otp: otpTextController.text,
              isLogin: _isSignUp ? '0' : '1',
              mobile: _mobileNumber ?? '',
              mobileCode: _countryCode ?? '');
        }
        _isLoading(false);
        if (response.success) {
          final _user = response.getUser();
          final _accounts = response.getAccounts();
          //insert to db
          DbRepository.to.insertUserAndAccount(_user, _accounts);
          //logged in
          AppController.to.loggedIn(_user);
        } else {
          _showErrorSnackbar(title: "Error", message: response.data.toString());
        }
      } catch (e) {
        _isLoading(false);
        _showErrorSnackbar(title: "Error", message: e.toString());
      }
    } else {
      _showErrorSnackbar(title: "Error", message: _validationStatus.toString());
    }
  }

  ValidationStatus _validate() {
    if (otpTextController.text.isEmpty) {
      return ValidationError(errorMessage: emptyFields);
    }
    return ValidationSuccess();
  }

  _showErrorSnackbar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}
