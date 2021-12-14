import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/controllers/app_controller.dart';
import 'package:toffee_ride/repository/repository.dart';
import 'package:toffee_ride/utils/utils.dart';

void main() {
  initialize();
  runApp(const MyApp());
}

void initialize() {
  Get.put<ApiRepository>(ApiRepositoryImpl(), permanent: true);
  Get.put<AssetRepository>(AssetRepositoryImpl(), permanent: true);
  Get.put<DbRepository>(DbRepositoryImpl(), permanent: true);
  Get.put(AppController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Toffee Ride",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      navigatorObservers: [
        DismissKeyboardNavigationObserver(),
        NavigatorObserverWithOrientation()
      ],
      getPages: routes(),
    );
  }
}

class DismissKeyboardNavigationObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.didStartUserGesture(route, previousRoute);
  }
}
