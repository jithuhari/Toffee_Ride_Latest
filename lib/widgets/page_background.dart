import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({
    Key? key,
    required this.imagePath
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
