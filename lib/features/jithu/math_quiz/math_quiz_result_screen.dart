import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/math_quiz/math_test_screen.dart';
import 'package:toffee_ride/features/jithu/math_quiz/quiz_screen.dart';

class Result extends StatefulWidget {
  int? score, totalQuestion, correct, incorrect, notAttended;

  Result(
      {this.score,
      this.totalQuestion,
      this.correct,
      this.incorrect,
      this.notAttended});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";

  @override
  void initState() {
    super.initState();

    var percentage = (widget.correct! / (widget.totalQuestion! * 1)) * 100;

    if (percentage >= 90) {
      greeting = "OutStanding";
    } else if (percentage >= 80 && percentage < 90) {
      greeting = "Good Work";
    } else if (percentage >= 60 && percentage < 80) {
      greeting = "Good Effort";
    } else if (percentage < 60) {
      greeting = "Needs Improvement";
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/Sky.png'),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   'MATH QUIZ',
                    //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    // ),
                    Text(
                      greeting,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Game Over',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'You Scored ${widget.correct} Out of ${widget.totalQuestion! * 1}',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.correct} correct,',
                          style: TextStyle(
                            fontSize: 20, color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          ' ${widget.incorrect} Incorrect, ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          ' ${widget.notAttended} Not Attended',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.bold,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          ' out of ${widget.totalQuestion}',
                          style: TextStyle(
                            fontSize: 20,

                            fontWeight: FontWeight.bold,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => QuizPAge()));
                    //     },
                    //     child: Text('Play Again'))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
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
                            child: GestureDetector(
                              onTap: () {
                                //Get.to(QuizPAge());
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuizTestScreen()));
                              },
                              child: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage(
                                      'assets/images/newicons/Repeat_150.png')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                width: 50,
                                height: 50,
                                image: AssetImage(
                                    'assets/images/newicons/Done_150.png')),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
