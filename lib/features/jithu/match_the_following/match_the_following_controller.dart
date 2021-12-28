import 'package:get/get.dart';

class MatchTheFollowingController extends GetxController {
  List<String> myFav = [
    'Eagle',
    'Lion',
    'Sheep',
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
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final user = myFav.removeAt(oldIndex);
    myFav.insert(index, user);
  }
}
