import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following_controller.dart';

class MatchTheFollowing extends StatefulWidget {
  const MatchTheFollowing({Key? key}) : super(key: key);

  @override
  _MatchTheFollowingState createState() => _MatchTheFollowingState();
}

class _MatchTheFollowingState extends State<MatchTheFollowing> {
  final matchTheFollowingController = Get.put(MatchTheFollowingController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return GetBuilder<MatchTheFollowingController>(
      init: MatchTheFollowingController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Sky.png'),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ImageCard(
                                imageuri:
                                    'assets/images/jithu/animals/lion.png',
                              ),
                              ImageCard(
                                imageuri:
                                    'assets/images/jithu/animals/sheep.png',
                              ),
                              ImageCard(
                                imageuri:
                                    'assets/images/jithu/animals/eagle.png',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: ReorderableListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              onReorder: (oldIndex, newIndex) {
                                controller.reorder(oldIndex, newIndex);
                              },
                              children: controller.myFav
                                  .map(
                                    (e) => Container(
                                        margin: EdgeInsets.all(40),
                                        key: ValueKey(e),
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .15,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 6.0,
                                              ),
                                            ]),
                                        child: Center(
                                            child: Text(
                                          e,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ))),
                                  )
                                  .toList(),
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
        );
      },
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
        margin: EdgeInsets.all(40),
        height: 110,
        width: MediaQuery.of(context).size.width * .15,
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
