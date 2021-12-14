import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/theme/theme.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import '../registration_controller.dart';

class RegistrationSelectClassView extends StatelessWidget {
  RegistrationSelectClassView({Key? key}) : super(key: key);

  final RegistrationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          HeaderTitle(context: context, title: "My child is in"),
          const VerticalSpacer(
            height: 40,
          ),
          Column(
            children: List.generate(
                _controller.studentClasses.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          _controller.onSelectedStudentClass(_controller.studentClasses[index]);
                        },
                        child: Obx(() => Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: _controller.studentClasses[index] ==
                                      _controller.selectedClass
                                  ? Colors.green
                                  : primaryColor),
                          child: Center(
                            child: Text(
                              _controller.studentClasses[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        )),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
