import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatchTheFollowing extends StatefulWidget {
  const MatchTheFollowing({Key? key}) : super(key: key);

  @override
  _MatchTheFollowingState createState() => _MatchTheFollowingState();
}

class _MatchTheFollowingState extends State<MatchTheFollowing> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/Sky.png'))),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageCard(
                          imageuri: 'assets/images/jithu/animals/lion.png',
                        ),
                        ImageCard(
                          imageuri: 'assets/images/jithu/animals/sheep.png',
                        ),
                        ImageCard(
                          imageuri: 'assets/images/jithu/animals/eagle.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            DragTarget(
                              builder: (context, candidateData, rejectedData) =>
                                  Center(
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  child: Text('Lion'),
                                ),
                              ),
                              onWillAccept: (data) => true,
                              onAccept: (data) {},
                            ),
                            Draggable(
                              feedback: TextCard(text: 'Eagle'),
                              childWhenDragging: Container(),
                              child: TextCard(text: 'Eagle'),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            DragTarget(
                                builder:
                                    (context, candidateData, rejectedData) =>
                                        Center(
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            child: Text('Sheep'),
                                          ),
                                        )),
                            Draggable(
                              feedback: TextCard(text: 'Lion'),
                              childWhenDragging: Container(),
                              child: TextCard(text: 'Lion'),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Draggable(
                              feedback: TextCard(text: 'Sheep'),
                              childWhenDragging: Container(),
                              child: TextCard(text: 'Sheep'),
                            ),
                            DragTarget(
                              builder: (context, candidateData, rejectedData) =>
                                  Center(
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  child: Text('Eagle'),
                                ),
                              ),
                              onWillAccept: (data) => true,
                              onAccept: (data) {},
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                        width: 50,
                        height: 50,
                        image:
                            AssetImage('assets/images/newicons/Back_150.png')),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.imageuri,
  }) : super(key: key);

  final String imageuri;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]),
        child: Image(
          image: AssetImage(imageuri),
        ),
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        )));
  }
}
