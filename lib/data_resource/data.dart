import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/model/light.dart';
import 'package:flutter_application_1/model/mist_spray.dart';
import 'package:flutter_application_1/model/roof.dart';
import 'package:flutter_application_1/model/setting/level_setting.dart';
import 'package:flutter_application_1/model/setting/range_setting.dart';
import 'package:flutter_application_1/model/setting/timer_setting.dart';
import 'package:flutter_application_1/model/watering.dart';

class Data {
  late List<Item> items;

  List<Item> getData() {
    items = [
      Watering(
          iconPath: 'images/watering-can128green.png',
          sensorTitle: "Độ ẩm đất",
          sensorValue: 55,
          title: 'Tưới cây',
          subtitle: 'Đang bật',
          isOnDevice: true, // có bật thiết bị không (thủ công)
          isAuto: true, // có đang ở chế độ auto không
          haveATimer: false, // có hẹn giờ không
          rangeSetting:
              RangeSetting(rangeValue: 50, settingTitle: "Thiết lập ngưỡng"),
          timerSetting: TimerSetting(
              timerBegin: TimeOfDay(hour: 15, minute: 30),
              timerEnd: TimeOfDay(hour: 16, minute: 40),
              settingTitle: "Hẹn giờ tưới cây"),
          speedSetting: LevelSetting(
              settingTitle: "Tốc độ bơm",
              lowLevelLabel: "1",
              mediumLevelLabel: "2",
              highLevelLabel: "3",
              value: 2)),
      Light(
          iconPath: 'images/brightness128yellow.png',
          title: 'Đèn',
          subtitle: 'Đang bật',
          isOnDevice: true,
          isAuto: true,
          haveATimer: true,
          timerSetting: TimerSetting(
              settingTitle: "Hẹn giờ bật/tắt đèn",
              timerBegin: TimeOfDay(hour: 14, minute: 20),
              timerEnd: TimeOfDay(hour: 10, minute: 30)),
          adaptSetting: LevelSetting(
              settingTitle: "Thiết lập độ nhạy",
              lowLevelLabel: "Gần tối",
              mediumLevelLabel: "Nhá nhem",
              highLevelLabel: "Tối",
              value: 1)),
      Roof(
          iconPath: 'images/roof128red.png',
          title: 'Mái che',
          subtitle: 'Đang bật',
          isOnDevice: true,
          isAuto: true,
          haveATimer: false,
          sensorValue: true, // có mưa
          timerSetting: TimerSetting(
              settingTitle: "Hẹn giờ đóng/mở mái che",
              timerBegin: TimeOfDay(hour: 14, minute: 20),
              timerEnd: TimeOfDay(hour: 10, minute: 30))),
      MistSpray(
          iconPath: 'images/pesticide.png',
          title: 'Phun sương',
          subtitle: 'Đang bật',
          isOnDevice: true,
          isAuto: true,
          haveATimer: true,
          humidValue: 57,
          tempValue: 32,
          speedSetting: LevelSetting(
              settingTitle: "Tốc độ phun",
              lowLevelLabel: "1",
              mediumLevelLabel: "2",
              highLevelLabel: "3",
              value: 2),
          timerSetting: TimerSetting(
              settingTitle: "Hẹn giờ bật/tắt phun",
              timerBegin: TimeOfDay(hour: 14, minute: 20),
              timerEnd: TimeOfDay(hour: 10, minute: 30)),
          rangeSettings: [
            RangeSetting(rangeValue: 23, settingTitle: "Thiết lập ngưỡng nhiệt độ"),
            RangeSetting(rangeValue: 60, settingTitle: "Thiết lập ngưỡng độ ẩm")
          ])
    ];
    return items;
  }
}
