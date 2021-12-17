import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/repository/repository.dart';
import 'package:toffee_ride/models/country_model.dart';
import 'package:toffee_ride/utils/utils.dart';

class RegistrationController extends GetxController {
  var selectedPageIndex = 0.obs;
  final pageController = PageController();

  final _isEmail = false.obs;
  bool get isEmail => _isEmail.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _countries = (List<CountryModel>.empty()).obs;
  List<CountryModel> get countries => _countries.value;

  //classes
  final List<String> _studentClasses = [
    "Class 1",
    "Class 2",
    "Class 3",
    "Class 4"
  ];
  List<String> get studentClasses => _studentClasses;

  //genders
  final List<String> _genders = ["Boy", "Girl"];
  List<String> get genders => _genders;

  //input variables
  final _selectedCountry = Rxn<CountryModel>();
  CountryModel? get selectedCountry => _selectedCountry.value;

  final _selectedClass = Rxn<String>();
  String? get selectedClass => _selectedClass.value;

  final _selectedGender = Rxn<String>();
  String? get selectedGender => _selectedGender.value;

  final studentNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();

  RegistrationController() {
    _fetchCountries();
  }

  @override
  void onClose() {
    studentNameController.dispose();
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

  onChangeRegistrationType() {
    mobileNumberController.clear();
    emailController.clear();

    _isEmail(!_isEmail.value);
  }

  onSelectedStudentClass(String studentClass) {
    _selectedClass(studentClass);

    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  onSelectedGender(String gender) {
    _selectedGender(gender);

    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  onSelectedCountry(CountryModel country) {
    _selectedCountry(country);
  }

  onTappedContinue() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  onTappedSubmit() {
    if (_isEmail.value) {
      _registerWithEmail();
    } else {
      _registerWithMobile();
    }
  }

  //1. register with email
  _registerWithEmail() async {
    final _validationStatus = _validateEmail();
    if (_validationStatus is ValidationSuccess) {
      _isLoading(true);
      try {
        final response = await ApiRepository.to.registerWithEmail(
            studentClass: _selectedClass.value ?? '',
            studentGender: _selectedGender.value ?? '',
            studentName: studentNameController.text,
            email: emailController.text);

        _isLoading(false);

        if (response.success) {
          final arguments = {
            'isSignUp': true,
            'isEmail': true,
            'countryCode': null,
            'mobile': null,
            'email': emailController.text
          };

          Get.toNamed('/login-otp', arguments: arguments);
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

  ValidationStatus _validateEmail() {
    if (emailController.text.isEmpty ||
        _selectedClass.value == null ||
        _selectedGender.value == null ||
        studentNameController.text.isEmpty) {
      return ValidationError(errorMessage: emptyFields);
    }
    return ValidationSuccess();
  }

  //2. register with mobile
  _registerWithMobile() async {
    final _validationStatus = _validateMobile();
    if (_validationStatus is ValidationSuccess) {
      _isLoading(true);
      try {
        final response = await ApiRepository.to.registerWithMobile(
            studentClass: _selectedClass.value ?? '',
            studentGender: _selectedGender.value ?? '',
            studentName: studentNameController.text,
            mobile: mobileNumberController.text);

        _isLoading(false);

        if (response.success) {
          final arguments = {
            'isSignUp': true,
            'isEmail': false,
            'countryCode': _selectedCountry.value?.dialCode,
            'mobile': mobileNumberController.text,
            'email': null
          };

          Get.toNamed('/login-otp', arguments: arguments);
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

  ValidationStatus _validateMobile() {
    if (mobileNumberController.text.isEmpty ||
        _selectedClass.value == null ||
        _selectedGender.value == null ||
        studentNameController.text.isEmpty) {
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
