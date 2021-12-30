import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/fill_quiz/quiz_controllere.dart';

class FillInTheBlanks extends StatelessWidget {
  final quizController = Get.put(QuizController());

  FillInTheBlanks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.quiz != null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/Sky.png'),
                          ),
                        ),
                        child: SafeArea(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.quiz!.question,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      //mainAxisAlignme nt: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Image(
                                            height: 300,
                                            width: 300,
                                            image: AssetImage(
                                                'assets/images/boystudy.png'),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                child: ListView.builder(
                                                  itemCount: controller
                                                      .quiz!.options.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return PinkButton(
                                                      answer: controller
                                                          .quiz!.options[index],
                                                      onTap: () {
                                                        if (controller.quiz!
                                                                    .options[
                                                                index] ==
                                                            controller
                                                                .quiz!.answer) {
                                                          print('true');
                                                        } else {
                                                          print('false');
                                                        }
                                                      },
                                                      buttonColor: Colors.pink,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/newicons/Back_150.png')),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              width: 50,
                                              height: 50,
                                              image: AssetImage(
                                                  'assets/images/newicons/Repeat_150.png')),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              width: 50,
                                              height: 50,
                                              image: AssetImage(
                                                  'assets/images/newicons/ToffeeShot_150.png')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
          ),
        );
      },
    );
  }
}

class PinkButton extends StatelessWidget {
  const PinkButton({
    Key? key,
    required this.answer,
    required this.onTap,
    required this.buttonColor,
  }) : super(key: key);

  final String answer;
  final GestureTapCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor,
          ),
          child: Center(
              child: Text(
            answer,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
