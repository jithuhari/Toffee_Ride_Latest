import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/models/dto/get_subject_details/get_subject_details_request.dart';
import 'package:toffee_ride/models/module_model.dart';
import 'package:toffee_ride/repository/repository.dart';

class SubjectController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  String? _subjectName;
  String? _subjectId;

  final _modules = (List<ModuleModel>.empty()).obs;
  List<ModuleModel> get modules => _modules.value;

  @override
  void onInit() {
    super.onInit();
    _getParams();
    _getSubjectDetails();
  }

  _getParams() {
    final arguments = Get.arguments;
    _subjectName = arguments["subjectName"];
    _subjectId = arguments["subjectId"];
  }

  _getSubjectDetails() {
    _getSubjectDetailsFromApi();
  }

  _getSubjectDetailsFromApi() async {
    final user = AppController.to.getUser();
    final account = AppController.to.getAccount();
    if (_subjectName == null || _subjectId == null) {
      Get.back();
    } else if (user == null || account == null) {
      _showErrorSnackbar(title: "Error", message: "User not found");
      AppController.to.loggedOut();
    } else {
      _isLoading(true);
      try {
        final request = GetSubjectDetailsRequest(
            user: user, account: account, subjectId: _subjectId!, subjectName: _subjectName!, grade: '8');
        final response =
            await ApiRepository.to.getSubjectDetails(request: request);

        _isLoading(false);

        final modules = response.getModules();
        _modules(modules);

        _isLoading(false);
      } catch (e) {
        _isLoading(false);
        _showErrorSnackbar(title: "Error", message: e.toString());
      }
    }
  }

  _showErrorSnackbar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}
