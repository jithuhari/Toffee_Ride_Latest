import 'package:flutter/material.dart';
import 'package:toffee_ride/utils/theme/theme.dart';

class CorneredTextField extends StatelessWidget {
  const CorneredTextField({
    Key? key,
    required this.context,
    required this.controller,
    required this.placeholder,
    this.keyboardType
  }) : super(key: key);

  final BuildContext context;
  final TextEditingController controller;
  final String placeholder;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: Theme.of(context)
          .textTheme
          .headline2
          ?.copyWith(color: primaryTextColor),
      decoration: InputDecoration(
        hintText: placeholder,
      ),
      textInputAction: TextInputAction.next,
      controller: controller,
    );
  }
}
