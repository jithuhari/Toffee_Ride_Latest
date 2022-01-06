import 'package:get/get.dart';
import 'dart:math';
import 'package:toffee_ride/models/jithu/math_quiz/math_quiz_question_model.dart';
//import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:toffee_ride/data/math_quiz_data.dart';
import 'package:toffee_ride/features/jithu/math_quiz/math_quiz_result_screen.dart';
// import 'package:toffee_ride/models/jithu/math_quiz/math_quiz_question_model.dart';

class MathQuizController extends GetxController {
  // List<String> myFav = [
  //   'Eagle',
  //   'Lion',
  //   'Sheep',
  // ].obs;
  List<QuestionModel> questions = [];
  int index = 0;
  int correct = 0, incorrect = 0, notAttempted = 0, points = 0;
  double beginAnim = 0.0;
  double endAnim = 1.0;

  Animation? animation;
  AnimationController? animationController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questions = getQuestion();

    // animationController =
    //     AnimationController(duration: const Duration(seconds: 10), vsync: this)
    //       ..addListener(() {
    //         // setState(() {});
    //       });

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
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void reorder(oldIndex, newIndex) {
  //   // if (newIndex > oldIndex) {
  //   //   newIndex = -1;
  //   // }
  //   final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
  //   final user = myFav.removeAt(oldIndex);
  //   myFav.insert(index, user);
  // }

  startAnim() {
    animationController!.forward();
  }

  resetAnim() {
    animationController!.reset();
  }

  stopAnim() {
    animationController!.stop();
  }

  List<QuestionModel> getQuestion() {
    List<QuestionModel> questions = [];
    QuestionModel questionModel = new QuestionModel();

    //1-15 Questions

    for (int i = 1; i <= 15; i++) {
      final number = 1;
      final question = nextNumber(min: 1, max: 5);
      dynamic operation;
      dynamic symbolswitch;
      final counter = Random().nextInt(4);

      //Set different operators randomly
      if (counter == 0) {
        operation = question + number;
        symbolswitch = '+';
      } else if (counter == 1) {
        operation = question - number;
        symbolswitch = '-';
      } else if (counter == 2) {
        operation = question * number;
        symbolswitch = '*';
      } else {
        operation = question / number;
        symbolswitch = '/';
      }

      //Random Answer List With Correct Answer
      final answerList = [
        operation,
        nextNumber(min: 1, max: 15),
      ];

      final answer = (answerList..shuffle()).first;
      questionModel.setQuestion('$question $symbolswitch $number = $answer');
      final finalAnswer = answer;
      (operation == finalAnswer)
          ? questionModel.setAnswer('True')
          : questionModel.setAnswer('False');
      questions.add(questionModel);
      questionModel = new QuestionModel();
    }

    return questions;
  }

// create a method to show randow numbers between 2 numbers
  int nextNumber({required int min, required int max}) =>

      //max 50 , min 5
      //1.50-5 = 45
      //2.Random.nextInt(45+1)=>0...45
      //3.5 + 0 ... 45 => 5...50

      min + Random().nextInt(max - min + 1);
}
