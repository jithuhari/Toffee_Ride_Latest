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

    return Scaffold(
      body: GetBuilder<QuizController>(
          init: QuizController(),
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Sky.png'))),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: (controller.quiz != null)
                                      ? controller.quiz!.isNotEmpty
                                          ? 1
                                          : 0
                                      : 0,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      controller.quiz![index].question,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  })),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Image(
                                  height: 300,
                                  width: 300,
                                  image:
                                      AssetImage('assets/images/boystudy.png'),
                                  // NetworkImage(items[0]
                                  //     .coverPageImgBase64
                                  //     .toString()),
                                ),
                              ),
                              Column(
                                children: [
                                  PinkButton(answer: '1'),
                                  PinkButton(answer: '2'),
                                  PinkButton(answer: '3'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            );
          }),
    );
  }

  // Future<List<ActivityModel>> ReadJsonData() async {
  //   final jsondata =
  //       await rootBundle.loadString('assets/jsons/model/activity_model.json');
  //   final list = json.decode(jsondata) as List<dynamic>;

  //   return list.map((e) => ActivityModel.fromJson(e)).toList();
  // }
}

class PinkButton extends StatelessWidget {
  const PinkButton({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
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