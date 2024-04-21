import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/model/setting/level_setting.dart';
import 'package:flutter_application_1/model/setting/range_setting.dart';
import 'package:flutter_application_1/model/setting/timer_setting.dart';



class Watering extends Item {
  String sensorTitle;
  int sensorValue;
  TimerSetting timerSetting;
  RangeSetting rangeSetting;
  LevelSetting speedSetting;
  bool haveATimer;

  Watering(
      {required super.iconPath,
      required super.title,
      required super.subtitle,
      required super.isOnDevice,
      required super.isAuto,
      required this.sensorTitle,
      required this.sensorValue,
      required this.haveATimer,
      required this.timerSetting,
      required this.speedSetting,
      required this.rangeSetting});
}
