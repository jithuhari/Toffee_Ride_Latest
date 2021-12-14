import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/registration/widgets/registration_create_account_view.dart';
import 'package:toffee_ride/features/registration/widgets/registration_select_class_view.dart';
import 'package:toffee_ride/features/registration/widgets/registration_select_gender_view.dart';
import 'package:toffee_ride/features/registration/widgets/registration_set_child_name_view.dart';
import 'package:toffee_ride/utils/theme/theme.dart';
import 'package:toffee_ride/widgets/page_background.dart';
import 'package:toffee_ride/widgets/underline_button.dart';

import 'registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Stack(children: [
                    const PageBackground(imagePath: "assets/images/sky_bg.png"),
                    SafeArea(
                        child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Expanded(
                          child: PageView.builder(
                              controller: controller.pageController,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: controller.selectedPageIndex,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return RegistrationSelectClassView();
                                } else if (index == 1) {
                                  return RegistrationSelectGenderView();
                                } else if (index == 2) {
                                  return RegistrationSetChildNameView();
                                } else {
                                  return RegistrationCreateAccountView();
                                }
                              }),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    4,
                                    (index) => Obx(() => _buildDot(index ==
                                        controller.selectedPageIndex.value)))),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: UnderlineButton(
                                  context: context,
                                  title: "Already registered? Login here",
                                  onTap: () => Get.offNamed('/login')),
                            ),
                          ],
                        )
                      ],
                    ))
                  ])));
        });
  }

  Container _buildDot(bool isCurrent) {
    return Container(
      height: 10,
      width: isCurrent ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryColor),
    );
  }
}
