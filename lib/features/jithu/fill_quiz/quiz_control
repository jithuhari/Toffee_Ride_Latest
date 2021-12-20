import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/models/fill_in_the_blanks/fill_model.dart';

class QuizController extends GetxController {
  //var quiz = <ActivityModel>[];
  List<ActivityModel>? quiz;
  // final quiz = (List<ActivityModel>.empty()).obs;
  // List<ActivityModel> get countries => quiz.value;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<List<ActivityModel>> fetchData() async {
    await rootBundle
        .loadString('assets/jsons/model/activity_model.json')
        .then((value) => {
              quiz = (json.decode(value) as List)
                  .map((e) => ActivityModel.fromJson(e))
                  .toList()
            });

    //final list = json.decode(jsondata) as List<dynamic>;

    //return list.map((e) => ActivityModel.fromJson(e)).toList();

    return quiz ?? [];
  }
}
