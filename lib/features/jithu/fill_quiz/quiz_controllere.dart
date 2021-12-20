import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/fill_in_the_blanks/fill_model.dart';

class QuizController extends GetxController {
  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  ActivityModel? quiz;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  _fetchData() async {
    await rootBundle
        .loadString('assets/jsons/model/activity_model.json')
        .then((value) {
      final list = (json.decode(value)).map((e) => ActivityModel.fromJson(e));
      quiz = list.first;
      _isLoading(false);
    });
  }
}
