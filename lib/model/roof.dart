import 'dart:ffi';

import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/model/setting/timer_setting.dart';

class Roof extends Item {
  String sensorTitle = "Cảm biến mưa";
  bool sensorValue; // cần để hiển thị thời tiết trong app :))
  TimerSetting timerSetting;
  bool haveATimer;

  Roof(
      {required super.iconPath,
      required super.title,
      required super.subtitle,
      required super.isOnDevice,  
      required super.isAuto,
      required this.timerSetting,
      required this.sensorValue,
      required this.haveATimer
      });
}

