import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following_controller.dart';
import 'package:toffee_ride/features/jithu/rearrange_options/rearrange_options_controller.dart';

class RearrangeScreen extends StatefulWidget {
  const RearrangeScreen({Key? key}) : super(key: key);

  @override
  _RearrangeScreenState createState() => _RearrangeScreenState();
}

class _RearrangeScreenState extends State<RearrangeScreen> {
  final rearrangeController = Get.put(RearrangeController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return GetBuilder<RearrangeController>(
      init: RearrangeController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => SafeArea(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Sky.png'),
                    ),
                  ),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .83,
                                  decoration:
                                      BoxDecoration(color: Colors.lightBlue),
                                  child: ListView(
                                    padding: EdgeInsets.all(10),
                                    //shrinkWrap: true,
                                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      TextCard(
                                        text: 'Let Us',
                                      ),
                                      TextCard(
                                        text: 'I am',
                                      ),
                                      TextCard(
                                        text: 'Do not',
                                      ),
                                      TextCard(
                                        text: 'We have',
                                      ),
                                      TextCard(
                                        text: 'She is',
                                      ),
                                      TextCard(
                                        text: 'They',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .83,
                                  decoration:
                                      BoxDecoration(color: Colors.lightBlue),
                                  child: ReorderableListView(
                                    //buildDefaultDragHandles: false,
                                    padding: EdgeInsets.all(15),
                                    //shrinkWrap: true,
                                    onReorder: (oldIndex, newIndex) {
                                      controller.reorder(oldIndex, newIndex);
                                    },
                                    children: controller.myFav
                                        .map(
                                          (e) => Container(
                                            key: ValueKey(e),
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .15,
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 6.0,
                                                  ),
                                                ]),
                                            child: Center(
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
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
            ),
          ),
        );
      },
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
      height: 50,
      width: MediaQuery.of(context).size.width * .15,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
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
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
