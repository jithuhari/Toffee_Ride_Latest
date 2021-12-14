import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/models/dto/fetch_subjects/fetch_subjects.dart';
import 'package:toffee_ride/models/subject_model.dart';
import 'package:toffee_ride/repository/api_repository.dart';
import 'package:toffee_ride/repository/repository.dart';

class ViewContentsController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _subjects = (List<SubjectModel>.empty()).obs;
  List<SubjectModel> get subjects => _subjects.value;

  @override
  void onInit() {
    super.onInit();
    _fetchSubjects();
  }

  _fetchSubjects() {
    _fetchSubjectsFromApi();
  }

  _fetchSubjectsFromApi() async {
    final user = AppController.to.getUser();
    final account = AppController.to.getAccount();
    if (user == null || account == null) {
      _showErrorSnackbar(title: "Error", message: "User not found");
      AppController.to.loggedOut();
    } else {
      _isLoading(true);
      try {
        final request = FetchSubjectsRequest(user: user, account: account);
        final response = await ApiRepository.to.fetchSubjects(request: request);

        _isLoading(false);

        final subjects = response.getSubjects();
        await DbRepository.to.insertSubjects(subjects);
        _subjects(subjects);
      } catch (e) {
        _isLoading(false);
        _showErrorSnackbar(title: "Error", message: e.toString());
      }
    }
  }

  onTappedSubjectView(int index) {
    final subject = _subjects[index];

    final arguments = {
      'subjectId': '5eff12586ec3c82c234fd907',
      'subjectName': subject.name
    };
    Get.toNamed('/subject_details', arguments: arguments);
  }

  _showErrorSnackbar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}
