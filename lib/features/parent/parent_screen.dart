import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:toffee_ride/features/jithu/listen_and_spell/listen_and_spell_screen.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following.dart';
import 'package:toffee_ride/features/jithu/math_quiz/quiz_screen.dart';
import 'package:toffee_ride/features/jithu/rearrange_options/rearrange_options_controller.dart';
import 'package:toffee_ride/features/jithu/rearrange_options/rearrange_options_screen.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/neumorphic_view.dart';
import 'package:toffee_ride/widgets/responsive.dart';
import 'parent_controller.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentController>(
        init: ParentController(),
        builder: (controller) {
          return const Responsive(
            mobile: ParentMobileScreen(),
            tablet: ParentTabScreen(),
            desktop: ParentWebScreen(),
          );
        });
  }
}

class ParentMobileScreen extends StatelessWidget {
  const ParentMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentContainerScreen();
  }
}

class ParentTabScreen extends StatelessWidget {
  const ParentTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SideMenu(),
        ),
        Expanded(
          flex: 6,
          child: ParentContainerScreen(),
        ),
      ],
    );
  }
}

class ParentWebScreen extends StatelessWidget {
  const ParentWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SideMenu(),
        ),
        Expanded(
          flex: 8,
          child: ParentContainerScreen(),
        ),
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final ParentController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (Responsive.isMobile(context))
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).padding.left + 20,
                    top: MediaQuery.of(context).padding.top + 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Image.asset(
                          "assets/images/buttons/menu.png",
                        ),
                        iconSize: 40,
                        onPressed: () {
                          Get.back();
                        }),
                  ],
                ),
              ),
            Container(
              child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.sideMenus.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Ink(
                      color: (index % 2 == 1) ? secondaryLightColor : null,
                      child: ListTile(
                        title: Text(
                          _controller.sideMenus[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class ParentContainerScreen extends StatelessWidget {
  ParentContainerScreen({Key? key}) : super(key: key);

  final ParentController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue.shade100,
      drawer: Responsive.isMobile(context)
          ? ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: SideMenu(),
            )
          : null,
      appBar: AppBar(
        title: Text('Dashboard',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/buttons/menu.png",
            ),
            iconSize: 40,
            onPressed: () {
              Get.back();
            },
          )
        ],
        backgroundColor: secondaryColor,
        elevation: 60.0,
        leading: Responsive.isMobile(context)
            ? IconButton(
                icon: Image.asset(
                  "assets/images/buttons/menu.png",
                ),
                iconSize: 40,
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              )
            : null,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(QuizPAge());
          },
          child: NeumorphicContainer(
            color: Colors.lightBlue.shade100,
            child: Text(
              'Hello',
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
