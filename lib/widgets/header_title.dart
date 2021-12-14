import 'package:flutter/material.dart';
import 'package:toffee_ride/utils/theme/theme_constants.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.context,
    required this.title,
  }) : super(key: key);

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline1
          ?.copyWith(color: primaryTextColor),
    );
  }
}