import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

// Orientation options
// Extend it and handle more options, if you need them
enum ScreenOrientation {
  portraitOnly,
  landscapeOnly,
  rotating,
}

// This function helps to build RouteSettings object for the orientation
RouteSettings rotationSettings(
    RouteSettings settings, ScreenOrientation rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}

// NavigatorObserver which tracks the orientation
class NavigatorObserverWithOrientation extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final _routeName = previousRoute?.settings.name;
    if (_routeName == '/') {
      _setOrientation(ScreenOrientation.rotating);
      return;
    }

    if (_routeName == '/home') {
      _setOrientation(ScreenOrientation.landscapeOnly);
      return;
    }

    if (_routeName == '/parent') {
      _setOrientation(ScreenOrientation.portraitOnly);
      return;
    }

    _setOrientation(ScreenOrientation.portraitOnly);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final _routeName = route.settings.name;
    if (_routeName == '/') {
      _setOrientation(ScreenOrientation.rotating);
      return;
    }

    if (_routeName == '/home') {
      _setOrientation(ScreenOrientation.landscapeOnly);
      return;
    }

    if (_routeName == '/parent') {
      _setOrientation(ScreenOrientation.portraitOnly);
      return;
    }
    _setOrientation(ScreenOrientation.portraitOnly);
  }
}

// Set orientation
void _setOrientation(ScreenOrientation orientation) {
  List<DeviceOrientation> orientations;
  switch (orientation) {
    case ScreenOrientation.portraitOnly:
      orientations = [
        DeviceOrientation.portraitUp,
      ];
      break;
    case ScreenOrientation.landscapeOnly:
      orientations = [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
    case ScreenOrientation.rotating:
      orientations = [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
  }
  SystemChrome.setPreferredOrientations(orientations);
}
