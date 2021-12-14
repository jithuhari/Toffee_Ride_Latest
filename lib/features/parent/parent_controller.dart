import 'package:get/get.dart';

class ParentController extends GetxController {
  //classes
  final List<String> _sideMenus = [
    "Dashboard",
    "Buy Toffee Ride",
    "Profile",
    "Settings"
  ].obs;
  List<String> get sideMenus => _sideMenus;
}