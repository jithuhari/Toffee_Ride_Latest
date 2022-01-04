import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/features/jithu/listen_and_spell/listen_and_spell_controller.dart';

class ListenAndSpell extends StatefulWidget {
  const ListenAndSpell({Key? key}) : super(key: key);

  @override
  _ListenAndSpellState createState() => _ListenAndSpellState();
}

class _ListenAndSpellState extends State<ListenAndSpell> {
  String text = '';
  final listenAndSpellController = Get.put(ListenAndSpellController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return GetBuilder<ListenAndSpellController>(
      init: ListenAndSpellController(),
      builder: (controller) {
        return Scaffold(
            body: Obx(
          () => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Sky.png'),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Listen and spell the word by clicking on the letters below.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .05,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ListView.builder(
                            //     itemCount: controller.alphabetsRow1.length,
                            //     shrinkWrap: true,
                            //     //scrollDirection: Axis.horizontal,
                            //     itemBuilder: (context, index) {
                            //    return
                            Text(
                              text,
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 5,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            )
                            // })
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .1,
                        child: Row(
                          children: [
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.alphabetsRow1.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            text =
                                                controller.alphabetsRow1[index];
                                          });
                                        },
                                        child: Text(
                                            controller.alphabetsRow1[index])),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Container(
                        //width: 1000,
                        height: MediaQuery.of(context).size.height * .1,
                        child: Row(
                          children: [
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.alphabetsRow2.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            text =
                                                controller.alphabetsRow2[index];
                                          });
                                        },
                                        child: Text(
                                            controller.alphabetsRow2[index])),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Container(
                        //width: 1000,
                        height: MediaQuery.of(context).size.height * .1,
                        child: Row(
                          children: [
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.alphabetsRow3.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            text =
                                                controller.alphabetsRow3[index];
                                          });
                                        },
                                        child: Text(
                                            controller.alphabetsRow3[index])),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              width: 50,
                              height: 50,
                              image: AssetImage(
                                  'assets/images/newicons/Back_150.png')),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage(
                                      'assets/images/newicons/ToffeeShot_150.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage(
                                      'assets/images/newicons/Done_150.png')),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
