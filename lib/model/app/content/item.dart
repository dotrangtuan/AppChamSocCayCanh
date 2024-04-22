// các thành phần chung có trong app

import 'dart:ffi';

class Item {
  String iconPath;
  String title;
  bool isOnDevice;
  bool isAuto;
  Item(
      {required this.iconPath,
      required this.title,
      required this.isOnDevice,
      required this.isAuto
      });
  void toggleSwitch(String switchName) {
    if (switchName == "device") {
      isOnDevice = !isOnDevice;
    }

    if (switchName == "auto") {
      isAuto = !isAuto;
    }
    
  }
}
