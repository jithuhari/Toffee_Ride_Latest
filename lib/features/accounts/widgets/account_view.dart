import 'package:flutter/material.dart';
import 'package:toffee_ride/utils/utils.dart';

class AccountView extends StatelessWidget {
  const AccountView(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final String imagePath;
  final String name;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fill,
          height: 100,
          width: 100,
          alignment: Alignment.center,
        ),
        InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              height: 60,
              //width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isSelected ? Colors.green : primaryColor),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}
