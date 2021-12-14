import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/theme/theme.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import '../registration_controller.dart';

class RegistrationSelectGenderView extends StatelessWidget {
  RegistrationSelectGenderView({Key? key}) : super(key: key);

  final RegistrationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          HeaderTitle(context: context, title: "My child is a"),
          const VerticalSpacer(
            height: 40,
          ),
          Column(
            children: List.generate(
                _controller.genders.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/${_controller.genders[index].toLowerCase()}.png",
                            fit: BoxFit.fill,
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                          ),
                          InkWell(
                            onTap: () {
                              _controller
                                  .onSelectedGender(_controller.genders[index]);
                            },
                            child: Obx(() => Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _controller.genders[index] ==
                                          _controller.selectedGender
                                      ? Colors.green
                                      : primaryColor),
                              child: Center(
                                child: Text(
                                  _controller.genders[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
