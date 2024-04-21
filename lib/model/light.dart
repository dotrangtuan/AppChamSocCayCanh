import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/model/setting/level_setting.dart';
import 'package:flutter_application_1/model/setting/timer_setting.dart';

class Light extends Item {

  String sensorTitle = "Cảm biến ánh sáng";
  TimerSetting timerSetting; 
  LevelSetting adaptSetting;
  bool haveATimer;
  

  Light(
      {required super.iconPath,
      required super.title,
      required super.subtitle,
      required super.isOnDevice,
      required super.isAuto,
      required this.timerSetting,
      required this.adaptSetting,
      required this.haveATimer
    });
}


