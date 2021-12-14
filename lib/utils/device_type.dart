import 'package:flutter/widgets.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  var isMobile = shortestSide < 600;
  if (isMobile) {
    return DeviceType.phone;
  }
  return DeviceType.tablet;
}
