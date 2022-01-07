import 'package:get/get.dart';
import 'package:toffee_ride/data/math_quiz_data.dart';
import 'package:toffee_ride/models/jithu/math_quiz/math_quiz_question_model.dart';
import 'package:flutter/material.dart';
import 'package:toffee_ride/features/jithu/math_quiz/math_quiz_result_screen.dart';

class MathQuizController extends GetxController
    with SingleGetTickerProviderMixin {
  List<QuestionModel> questions = [];
  int index = 0;
  int correct = 0, incorrect = 0, notAttempted = 0, points = 0;
  double beginAnim = 0.0;
  double endAnim = 1.0;

  Animation? animation;
  AnimationController? animationController;
  @override
  void onInit() {
    super.onInit();
    questions = getQuestion();

    animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..addListener(() {
            update();
          });

    animation =
        Tween(begin: beginAnim, end: endAnim).animate(animationController!);
    startAnim();

    animationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        if (index < questions.length - 1) {
          index++;
          resetAnim();
          startAnim();
          notAttempted++;
        } else {
          notAttempted++;
          Get.to(Result(
            score: correct,
            totalQuestion: questions.length,
            correct: correct,
            incorrect: incorrect,
            notAttended: notAttempted,
          ));
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController!.dispose();
    super.onClose();
  }

  startAnim() {
    animationController!.forward();
  }

  resetAnim() {
    animationController!.reset();
  }

  stopAnim() {
    animationController!.stop();
  }
}
