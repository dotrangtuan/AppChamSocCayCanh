import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/app/setting/timer_setting.dart';

class TimerSettingContainer extends StatefulWidget {
  TimerSetting timerSetting;
  TimerSettingContainer({super.key, required this.timerSetting});

  @override
  _TimerSettingContainerState createState() => _TimerSettingContainerState();
}

class _TimerSettingContainerState extends State<TimerSettingContainer> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.timerSetting.settingTitle),
        SizedBox(
          height: 94,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Bắt đầu"),
                OutlinedButton(
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context, 
                          initialTime: widget.timerSetting.timerBegin, 
                          initialEntryMode: TimePickerEntryMode.dialOnly
                          );

                      if (timeOfDay != null) {
                        setState(() {
                          widget.timerSetting.timerBegin = timeOfDay;
                        });
                      }
                    },
                    child: Text("${widget.timerSetting.timerBegin.hour}:${widget.timerSetting.timerBegin.minute}")
                )
              ],
            ),
            Column(
              children: [
                Text("Kết thúc"),
                OutlinedButton(
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context, initialTime: widget.timerSetting.timerEnd, initialEntryMode: TimePickerEntryMode.dialOnly
                          );
                      if (timeOfDay != null) {
                        setState(() {
                          widget.timerSetting.timerEnd = timeOfDay;
                        });
                      }
                    },
                    child: Text("${widget.timerSetting.timerEnd.hour}:${widget.timerSetting.timerEnd.minute}"))
              ],
            )
          ],
        ), // Hiển thị giá trị tối đa
        SizedBox(
          height: 20,
        ),
        OutlinedButton(onPressed: () {}, child: Text("Lưu")),
      ],
    );
  }
}
