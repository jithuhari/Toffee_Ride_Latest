import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/theme/theme.dart';
import 'package:toffee_ride/widgets/cornered_textfield.dart';
import 'package:toffee_ride/widgets/country_dropdown.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/underline_button.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import '../registration_controller.dart';

class RegistrationCreateAccountView extends StatelessWidget {
  RegistrationCreateAccountView({Key? key}) : super(key: key);

  final RegistrationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => Column(
        children: [
          HeaderTitle(context: context, title: "Create Account"),
          const SizedBox(
            height: 40,
          ),
          Column(children: [
            if (!_controller.isEmail)
              Column(
                children: [
                  _dropdownField(context),
                  const VerticalSpacer(height: 20),
                  _mobileTextField(context),
                ],
              ),
            if (_controller.isEmail) _emailTextField(context),
            const VerticalSpacer(height: 20),
            _submitButton(context),
            const VerticalSpacer(height: 40),
            UnderlineButton(
                context: context,
                title: _controller.isEmail
                    ? "Signup with mobile"
                    : "Signup with email",
                onTap: () => _controller.onChangeRegistrationType()),
          ])
        ],
      )),
    );
  }

  Widget _dropdownField(BuildContext context) {
    final RegistrationController _controller = Get.find();
    return Obx(
      () => CountryDropDown(
        context: context,
        selectedCountry: _controller.selectedCountry,
        countries: _controller.countries, 
        onChanged: (newValue) => newValue != null ? _controller.onSelectedCountry(newValue) : null
      )
    );
  }

  Widget _mobileTextField(BuildContext context) {
    final RegistrationController _controller = Get.find();
    return CorneredTextField(
      context: context, 
      controller: _controller.mobileNumberController, 
      placeholder: "Enter mobile number",
      keyboardType: TextInputType.phone,
    );
  }

  Widget _emailTextField(BuildContext context) {
    final RegistrationController _controller = Get.find();
    return CorneredTextField(
      context: context, 
      controller: _controller.emailController, 
      placeholder: "Enter your email",
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _submitButton(BuildContext context) {
    final RegistrationController _controller = Get.find();

    return ElevatedButton(
      onPressed: () =>
          _controller.isLoading ? null : _controller.onTappedSubmit(),
      style: elevatedButtonThemeDataWithPadding(context, 40).style,
      child: _controller.isLoading
          ? const CircularProgressIndicator()
          : const Text("Continue"),
    );
  }
}