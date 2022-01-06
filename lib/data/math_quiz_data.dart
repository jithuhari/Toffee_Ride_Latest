import 'dart:math';
import 'package:toffee_ride/models/jithu/math_quiz/math_quiz_question_model.dart';

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
