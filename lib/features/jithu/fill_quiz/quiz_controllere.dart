import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/fill_in_the_blanks/fill_model.dart';

class QuizController extends GetxController {
  var quiz = <ActivityModel>[].obs;
  // final quiz = (List<ActivityModel>.empty()).obs;
  // List<ActivityModel> get countries => quiz.value;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<List<ActivityModel>> fetchData() async {
    final jsondata =
        await rootBundle.loadString('assets/jsons/model/activity_model.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }
}
