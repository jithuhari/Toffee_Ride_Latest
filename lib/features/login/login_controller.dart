import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/country_model.dart';
import 'package:toffee_ride/repository/repository.dart';
import 'package:toffee_ride/utils/utils.dart';

class LoginController extends GetxController {
  final _isEmail = false.obs;
  bool get isEmail => _isEmail.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _countries = (List<CountryModel>.empty()).obs;
  List<CountryModel> get countries => _countries.value;

  //input variables
  final _selectedCountry = Rxn<CountryModel>();
  CountryModel? get selectedCountry => _selectedCountry.value;

  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();

  LoginController() {
    //_fetchCountries();
  }

  @override
  void onInit() {
    super.onInit();
    _fetchCountries();
  }

  @override
  void onClose() {
    emailController.dispose();
    mobileNumberController.dispose();
    super.onClose();
  }

  _fetchCountries() async {
    final countries = await AssetRepository.to.getCountries();
    _countries(countries);

    final selectedCountry =
        countries.where((i) => i.dialCode == "+91").toList().first;
    _selectedCountry(selectedCountry);
  }

  //from view
  onChangeLoginType() {
    mobileNumberController.clear();
    emailController.clear();

    _isEmail(!_isEmail.value);
  }

  onSelectedCountry(CountryModel country) {
    _selectedCountry(country);
  }

  onTappedSubmit() {
    if (_isEmail.value) {
      _loginWithEmail();
    } else {
      _loginWithMobile();
    }
  }

  //1. login with email
  _loginWithEmail() async {
    final _validationStatus = _validateEmail();
    if (_validationStatus is ValidationSuccess) {
      _isLoading(true);
      try {
        final response =
            await ApiRepository.to.loginWithEmail(email: emailController.text);
        _isLoading(false);

        if (response.data) {
          final arguments = {
            'isSignUp': false,
            'isEmail': true,
            'countryCode': null,
            'mobile': null,
            'email': emailController.text
          };
          Get.toNamed('/login_otp', arguments: arguments);
        } else {
          _showErrorSnackbar(title: "Error", message: "User not found");
        }
      } catch (e) {
        _isLoading(false);
        _showErrorSnackbar(title: "Error", message: e.toString());
      }
    } else {
      _showErrorSnackbar(title: "Error", message: _validationStatus.toString());
    }
  }

  ValidationStatus _validateEmail() {
    if (emailController.text.isEmpty) {
      return ValidationError(errorMessage: emptyFields);
    }
    return ValidationSuccess();
  }

  //2. login with mobile
  _loginWithMobile() async {
    final _validationStatus = _validateMobile();
    if (_validationStatus is ValidationSuccess) {
      _isLoading(true);
      try {
        final response = await ApiRepository.to
            .loginWithMobile(mobile: mobileNumberController.text);
        _isLoading(false);

        if (response.data) {
          final arguments = {
            'isSignUp': false,
            'isEmail': false,
            'countryCode': _selectedCountry.value?.dialCode,
            'mobile': mobileNumberController.text,
            'email': null
          };

          Get.toNamed('/login_otp', arguments: arguments);
        } else {
          _showErrorSnackbar(title: "Error", message: "User not found");
        }
      } catch (e) {
        _isLoading(false);
        _showErrorSnackbar(title: "Error", message: e.toString());
      }
    } else {
      _showErrorSnackbar(title: "Error", message: _validationStatus.toString());
    }
  }

  ValidationStatus _validateMobile() {
    if (mobileNumberController.text.isEmpty) {
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
