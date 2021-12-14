import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/theme/theme.dart';
import 'package:toffee_ride/widgets/cornered_textfield.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import '../registration_controller.dart';

class RegistrationSetChildNameView extends StatelessWidget {
  const RegistrationSetChildNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          HeaderTitle(context: context, title: "My child's name is"),
          const VerticalSpacer(
            height: 40,
          ),
          Column(children: [
            _studentNameTextField(context),
            const SizedBox(
              height: 20,
            ),
            _submitButton(context)
          ])
        ],
      ),
    );
  }

  Widget _studentNameTextField(BuildContext context) {
    final RegistrationController _controller = Get.find();
    return CorneredTextField(
      context: context, 
      controller: _controller.studentNameController, 
      placeholder: "Enter your child's name",
      keyboardType: TextInputType.name,
    );
  }

  Widget _submitButton(BuildContext context) {
    final RegistrationController _controller = Get.find();

    return ElevatedButton(
      onPressed: () =>
          _controller.isLoading ? null : _controller.onTappedContinue(),
      style: elevatedButtonThemeDataWithPadding(context, 40).style,
      child: const Text('Continue'),
    );
  }
}
