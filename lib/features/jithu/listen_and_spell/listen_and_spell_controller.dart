import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ListenAndSpellController extends GetxController {
  List<String> alphabetsRow1 = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '⌫',
  ].obs;

  List<String> word = List<String>.empty(growable: true).obs;
  List<String> spellanswer = [
    'W',
    'E',
    'L',
    'C',
    'O',
    'M',
    'E',
  ].obs;

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

    // print(myFav);
    // if (listEquals(myFav, answer)) {
    //   print("success");
    // } else {
    //   print("fails");
    // }
  }
}
