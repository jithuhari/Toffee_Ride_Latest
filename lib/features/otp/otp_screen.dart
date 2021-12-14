import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/cornered_textfield.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/page_background.dart';
import 'package:toffee_ride/widgets/underline_button.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import 'otp_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  static const _maxCount = 20;
  int _counter = 0;
  bool _isCountDownStart = false;
  late Timer _timer;
  late AnimationController _controller;

  _startTimer() {
    setState(() {
      _counter = _maxCount;
      _isCountDownStart = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter--;
      if (_counter == 0) {
        setState(() {
          _isCountDownStart = false;
          timer.cancel();
        });
      } else {
        setState(() {});
      }
    });
  }

  _createAnimationController() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: _maxCount,
        ))
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: false);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    _createAnimationController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
        init: OtpController(),
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
                                  _otpTextField(context),
                                  const VerticalSpacer(height: 20),
                                  _submitButton(context),
                                  const VerticalSpacer(height: 20),
                                  Text(
                                    "OTP sent to ${controller.displayItem}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(color: primaryTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  const VerticalSpacer(height: 40),
                                  if (_isCountDownStart)
                                    SizedBox(
                                      height: 200.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Center(
                                            child: SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 10,
                                                color: primaryTextColor,
                                                value: _controller.value,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              "$_counter s",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(
                                                      color: primaryTextColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!_isCountDownStart)
                                    Column(
                                      children: [
                                        const VerticalSpacer(height: 50),
                                        Text(
                                          "Not yet received the OTP ?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: primaryTextColor),
                                        ),
                                        const VerticalSpacer(height: 10),
                                        UnderlineButton(
                                            context: context,
                                            title: "Tap here to resend",
                                            onTap: () {}),
                                      ],
                                    ),
                                  const Expanded(child: SizedBox()),
                                  UnderlineButton(
                                      context: context,
                                      title:
                                          "Not your ${controller.isEmail ? "email" : "mobile number"}? Re-enter",
                                      onTap: () => Get.back()
                                  ),
                                ]),
                          )))
                ])),
          );
        });
  }

  Widget _otpTextField(BuildContext context) {
    final OtpController _controller = Get.find();
    return CorneredTextField(
      context: context,
      controller: _controller.otpTextController,
      placeholder: "Enter OTP",
      keyboardType: TextInputType.phone,
    );
  }

  Widget _submitButton(BuildContext context) {
    final OtpController _controller = Get.find();

    return ElevatedButton(
      onPressed: () => _controller.isLoading 
        ? null 
        : _controller.onTappedSubmit(),
      style: elevatedButtonThemeDataWithPadding(context, 40).style,
      child: _controller.isLoading
          ? const CircularProgressIndicator()
          : const Text('Continue'),
    );
  }
}
