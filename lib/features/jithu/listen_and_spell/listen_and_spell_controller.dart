import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ListenAndSpellController extends GetxController {
  List<String> alphabetsRow1 = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
  ].obs;
  List<String> alphabetsRow2 = [
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
  ].obs;
  List<String> alphabetsRow3 = [
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    '<-',
  ].obs;
  List<String> answer = [
    'Let\'s',
    'I\'m',
    'Don\'t',
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void reorder(oldIndex, newIndex) {
    // if (newIndex > oldIndex) {
    //   newIndex = -1;
    // }
    final index1 = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final user1 = alphabetsRow1.removeAt(oldIndex);
    alphabetsRow1.insert(index1, user1);

    final index2 = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final user2 = alphabetsRow2.removeAt(oldIndex);
    alphabetsRow2.insert(index2, user2);

    final index3 = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final user3 = alphabetsRow3.removeAt(oldIndex);
    alphabetsRow3.insert(index3, user3);

    // print(myFav);
    // if (listEquals(myFav, answer)) {
    //   print("success");
    // } else {
    //   print("fails");
    // }
  }
}
