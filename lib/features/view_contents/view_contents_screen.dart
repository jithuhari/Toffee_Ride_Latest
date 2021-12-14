import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/view_contents/widgets/subject_view.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/appbar_icon.dart';

import 'view_contents_controller.dart';

class ViewContentsScreen extends StatelessWidget {
  const ViewContentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewContentsController>(
      init: ViewContentsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.lightBlue.shade100,
          appBar: AppBar(
            title: Text('View Content',
              style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white)),
              backgroundColor: secondaryColor,
              elevation: 60.0,
              leading: AppBarIcon(
                imagePath: "assets/images/buttons/back.png",
                onPressed: () => Get.back(),
              ),
            ),
            body: Obx(() => controller.isLoading 
            ? const Center(
              child: CircularProgressIndicator(),
            )
            : ListView.builder(
              itemCount: controller.subjects.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => controller.onTappedSubjectView(index),
                  child: SubjectView(
                    name: controller.subjects[index].name ?? '',
                    score: controller.subjects[index].score ?? 0, 
                    progress: controller.subjects[index].progressValue,
                  ),
                );
              }
            )
          )
        );
      }
    );
  }
}