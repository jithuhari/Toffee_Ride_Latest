import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following_controller.dart';

class DragTest extends StatefulWidget {
  @override
  _DragTestState createState() => _DragTestState();
}

class _DragTestState extends State<DragTest> {
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
            () => Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReorderableListView(
                    scrollDirection: Axis.horizontal,
                    // itemBuilder: itemBuilder,
                    // itemCount: itemCount,
                    onReorder: (oldIndex, newIndex) {
                      controller.reorder(oldIndex, newIndex);
                    },
                    children: controller.myFav
                        .map(
                          (e) => Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            key: ValueKey(e),
                            children: [
                              Container(
                                  //key: ValueKey(e),
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
                                    e,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ))),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
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
