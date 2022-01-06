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
          body: SafeArea(
            child: Container(
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
                            fontSize: MediaQuery.of(context).size.height * .06,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(.3),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                itemCount: controller.word.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 0, 6, 2),
                                    child: Text(
                                      controller.word[index],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                },
                              )),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: controller.spellanswer.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              height: 5,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                          itemCount: controller.alphabetsRow1.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 9),
                          itemBuilder: (context, index) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (index != 26) {
                                          controller.word.add(
                                            controller.alphabetsRow1[index],
                                          );
                                        } else {
                                          controller.word.removeLast();
                                        }
                                      });
                                    },
                                    child: Text(
                                      controller.alphabetsRow1[index],
                                      style: TextStyle(fontSize: 25),
                                    )),
                              );
                            });
                          },
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
          ),
        );
      },
    );
  }
}
