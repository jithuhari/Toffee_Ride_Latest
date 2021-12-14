import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/cornered_textfield.dart';
import 'package:toffee_ride/widgets/country_dropdown.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/page_background.dart';
import 'package:toffee_ride/widgets/underline_button.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                      child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Obx(
                            () => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HeaderTitle(
                                      context: context, title: "Login Here"),
                                  const VerticalSpacer(height: 40),
                                  if (!controller.isEmail)
                                    Column(
                                      children: [
                                        _dropdownField(context),
                                        const VerticalSpacer(height: 20),
                                        _mobileTextField(context),
                                      ],
                                    ),
                                  if (controller.isEmail)
                                    _emailTextField(context),
                                  const VerticalSpacer(height: 20),
                                  _submitButton(context),
                                  const VerticalSpacer(height: 40),
                                  UnderlineButton(
                                      context: context,
                                      title: controller.isEmail
                                          ? "Login with mobile"
                                          : "Login with email",
                                      onTap: () => controller.onChangeLoginType()
                                  ),
                                  const Expanded(child: SizedBox()),
                                  UnderlineButton(
                                      context: context,
                                      title: "New user? Sign up now",
                                      onTap: () => Get.offNamed('/registration')
                                  ),
                                ]),
                          )))
                ])),
          );
        });
  }

  Widget _dropdownField(BuildContext context) {
    final LoginController _controller = Get.find();
    return Obx(() => CountryDropDown(
        context: context,
        selectedCountry: _controller.selectedCountry,
        countries: _controller.countries,
        onChanged: (newValue) =>
            newValue != null ? _controller.onSelectedCountry(newValue) : null));
  }

  Widget _mobileTextField(BuildContext context) {
    final LoginController _controller = Get.find();
    return CorneredTextField(
      context: context,
      controller: _controller.mobileNumberController,
      placeholder: "Enter mobile number",
      keyboardType: TextInputType.phone,
    );
  }

  Widget _emailTextField(BuildContext context) {
    final LoginController _controller = Get.find();
    return CorneredTextField(
      context: context,
      controller: _controller.emailController,
      placeholder: "Enter your email",
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _submitButton(BuildContext context) {
    final LoginController _controller = Get.find();

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
