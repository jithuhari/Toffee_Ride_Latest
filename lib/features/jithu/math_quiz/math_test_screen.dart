import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/data/math_quiz_data.dart';
import 'package:toffee_ride/features/jithu/math_quiz/math_quiz_controller.dart';
import 'package:toffee_ride/features/jithu/math_quiz/math_quiz_result_screen.dart';
import 'package:toffee_ride/models/jithu/math_quiz/math_quiz_question_model.dart';

class QuizTestScreen extends StatefulWidget {
  //static const routeName = '/MixedQuizPage';

  const QuizTestScreen({Key? key}) : super(key: key);

  @override
  _QuizTestScreenState createState() => _QuizTestScreenState();
}

class _QuizTestScreenState extends State<QuizTestScreen>
    with SingleTickerProviderStateMixin {
  final mathQuizController = Get.put(MathQuizController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return GetBuilder<MathQuizController>(
      init: MathQuizController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  image: const AssetImage('assets/images/Sky.png'),
                ),
                Column(
                  children: [
                    //Linear progress animation
                    LinearProgressIndicator(
                      value: controller.animation!.value,
                      color: Colors.red,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                        ),
                        Text(
                          '${controller.index + 1}/${controller.questions.length}',
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Text(
                          ' Question',
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        Spacer(),
                        Text(
                          '${controller.points}',
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          ' Points',
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                        )
                      ],
                    ),

                    Text(
                      '${controller.questions[controller.index].getQuestion()}',
                      style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (controller.index <
                                controller.questions.length - 1) {
                              if (controller.questions[controller.index]
                                      .getAnswer() ==
                                  "True") {
                                setState(() {
                                  controller.points = controller.points + 1;
                                  controller.index++;
                                  controller.correct++;
                                  controller.resetAnim();
                                  controller.startAnim();
                                });
                              } else {
                                //points = points - 1;
                                controller.index++;
                                controller.incorrect++;
                                controller.resetAnim();
                                controller.startAnim();
                              }
                            } else {
                              if (controller.questions[controller.index]
                                      .getAnswer() ==
                                  "True") {
                                controller.correct++;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                              score: controller.points,
                                              totalQuestion:
                                                  controller.questions.length,
                                              correct: controller.correct,
                                              incorrect: controller.incorrect,
                                              notAttended:
                                                  controller.notAttempted,
                                            )));
                              } else {
                                controller.incorrect++;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                              score: controller.points,
                                              totalQuestion:
                                                  controller.questions.length,
                                              correct: controller.correct,
                                              incorrect: controller.incorrect,
                                              notAttended:
                                                  controller.notAttempted,
                                            )));
                              }
                              //incorrect++;

                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.check,
                              size: 50,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (controller.index <
                                controller.questions.length - 1) {
                              if (controller.questions[controller.index]
                                      .getAnswer() ==
                                  "False") {
                                setState(() {
                                  controller.points = controller.points + 1;
                                  controller.index++;
                                  controller.correct++;
                                  controller.resetAnim();
                                  controller.startAnim();
                                });
                              } else {
                                //points = points - 1;
                                controller.index++;
                                controller.incorrect++;
                                controller.resetAnim();
                                controller.startAnim();
                              }
                            } else {
                              if (controller.questions[controller.index]
                                      .getAnswer() ==
                                  "False") {
                                controller.correct++;
                                //incorrect++;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                              score: controller.points,
                                              totalQuestion:
                                                  controller.questions.length,
                                              correct: controller.correct,
                                              incorrect: controller.incorrect,
                                              notAttended:
                                                  controller.notAttempted,
                                            )));
                              } else {
                                //correct++;
                                controller.incorrect++;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                              score: controller.points,
                                              totalQuestion:
                                                  controller.questions.length,
                                              correct: controller.correct,
                                              incorrect: controller.incorrect,
                                              notAttended:
                                                  controller.notAttempted,
                                            )));
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.close,
                              size: 50,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   animationController!.dispose();
  //   super.dispose();
  // }
}
