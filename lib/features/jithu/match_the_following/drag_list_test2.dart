import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following_controller.dart';

class DragListTest extends GetView<MatchTheFollowingController> {
  final matchTheFollowingController = Get.put(MatchTheFollowingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ReorderableListView(
          // itemBuilder: itemBuilder,
          // itemCount: itemCount,
          onReorder: (oldIndex, newIndex) {},
          children: controller.myFav
              .map(
                (e) => Container(
                  //margin: EdgeInsets.only(),
                  key: ValueKey(e),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue),
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
