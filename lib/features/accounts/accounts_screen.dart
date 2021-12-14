import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/accounts/widgets/account_view.dart';
import 'package:toffee_ride/widgets/header_title.dart';
import 'package:toffee_ride/widgets/page_background.dart';
import 'package:toffee_ride/widgets/vertical_spacer.dart';

import 'accounts_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 2 -
        100 -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    const double itemHeight = 160;

    return GetBuilder<AccountsController>(
        init: AccountsController(),
        builder: (controller) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(children: [
                const PageBackground(imagePath: "assets/images/sky_bg.png"),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderTitle(
                              context: context, title: "Select Account"),
                          const VerticalSpacer(height: 40),
                          Obx(() => GridView.count(
                              shrinkWrap: true,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              childAspectRatio: itemWidth / itemHeight,
                              physics: const ScrollPhysics(),
                              children: List.generate(
                                  controller.accounts
                                      .length, //this is the total number of cards
                                  (index) {
                                return AccountView(
                                    imagePath:
                                        "assets/images/${controller.accounts[index].gender?.toLowerCase() ?? 'girl'}.png",
                                    name: controller.accounts[index].name ??
                                        'boy',
                                    isSelected:
                                        index == controller.selectedIndex,
                                    onTap: () {
                                      controller.onSelectedAccount(index);
                                    });
                              })))
                        ]),
                  )),
                )
              ]));
        });
  }
}