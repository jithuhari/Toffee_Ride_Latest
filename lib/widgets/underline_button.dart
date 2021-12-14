import 'package:flutter/material.dart';
import 'package:toffee_ride/utils/theme/theme_constants.dart';

class UnderlineButton extends StatelessWidget {
  const UnderlineButton(
      {Key? key, required this.context, required this.title, this.onTap})
      : super(key: key);

  final BuildContext context;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2?.copyWith(
            color: primaryTextColor, decoration: TextDecoration.underline),
      ),
    );
  }
}
