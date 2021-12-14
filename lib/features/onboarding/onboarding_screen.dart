import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/page_background.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const PageBackground(imagePath: "assets/images/onboarding_bg.jpg"),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () => { Get.offNamed('/login') },
                    child: const Text("Login"),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: onboardingImages.length,
                    itemBuilder: (context, index) => OnboardPage(
                          title: onboardingTitles[index],
                          mainTitle: onboardingMainTitles[index],
                          description: onboardingDescription[index],
                          image: onboardingImages[index],
                        )),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onboardingImages.length,
                          (index) => _buildDot(index)))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () => { Get.offNamed('/registration') },
                  style: elevatedButtonThemeData(context).style,
                  child: const Text("Get Started"),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  Container _buildDot(int index) {
    return Container(
      height: 10,
      width: _currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryColor),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title;
  final String mainTitle;
  final String description;
  final String image;

  const OnboardPage(
      {Key? key,
      required this.title,
      required this.mainTitle,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 250,
            height: 250,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: primaryColor)),
          Text(mainTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: primaryColor)),
          const SizedBox(
            height: 15,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: primaryTextColor),
          )
        ],
      ),
    );
  }
}
