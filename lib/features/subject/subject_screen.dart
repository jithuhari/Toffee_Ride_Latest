import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/appbar_icon.dart';
import 'package:grouped_list/grouped_list.dart';

import 'subject_controller.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectController>(
        init: SubjectController(),
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
                  : GroupedListView<dynamic, String>(
                      elements: controller.modules,
                      groupBy: (element) => element.chapter,
                      //groupComparator: (value1, value2) => value2.compareTo(value1),
                      itemComparator: (item1, item2) =>
                          (item1.pkgSequenceNo).compareTo(item2.pkgSequenceNo),
                      order: GroupedListOrder.ASC,
                      // useStickyGroupSeparators: true,
                      groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      itemBuilder: (c, element) {
                        return Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              //leading: Icon(Icons.account_circle),
                              title: Text(
                                element.title,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      },
                    )));
        });
  }
}
