import 'package:flutter_application_1/model/app/content/item.dart';
import 'package:flutter_application_1/model/app/setting/level_setting.dart';
import 'package:flutter_application_1/model/app/setting/range_setting.dart';
import 'package:flutter_application_1/model/app/setting/timer_setting.dart';

class MistSpray extends Item {
  String tempTitle = "Nhiệt độ môi trường";
  String humidTitle = "Độ ẩm không khí";
  int tempValue;
  int humidValue;
  List<RangeSetting> rangeSettings; // có hai cảm biến nên cần 2 ngưỡng
  TimerSetting timerSetting;
  LevelSetting speedSetting;
  bool haveATimer;

  MistSpray(
      {required super.iconPath,
      required super.title,
      required super.isOnDevice,
      required super.isAuto,
      required this.humidValue,
      required this.tempValue,
      required this.timerSetting,
      required this.rangeSettings,
      required this.speedSetting,
      required this.haveATimer
      }); // phun sương
}
