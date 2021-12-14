import 'package:flutter/material.dart';
import 'package:toffee_ride/utils/utils.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({Key? key, required this.imagePath, required this.onPressed }) : super(key: key);

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
            color: primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            "assets/images/buttons/back.png",
          ),
        ),
      ),
      iconSize: 40,
      onPressed: onPressed,
    );
  }
}
