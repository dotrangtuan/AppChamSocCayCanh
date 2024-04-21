import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/setting/level_setting.dart';

class LevelSettingContainer extends StatefulWidget {
  LevelSetting levelSetting;
  LevelSettingContainer({super.key, required this.levelSetting});

  @override
  _LevelSettingContainerState createState() => _LevelSettingContainerState();
}

class _LevelSettingContainerState extends State<LevelSettingContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.levelSetting.settingTitle),
        SizedBox(
          height: 94,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(widget.levelSetting.lowLevelLabel),
                Radio(
                    value: 1, 
                    groupValue: widget.levelSetting.value,
                    onChanged: (value) {
                      setState(() {
                        widget.levelSetting.value = value!;
                      });
                    }),
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text(widget.levelSetting.mediumLevelLabel),
                Radio(
                    value: 2,
                    groupValue: widget.levelSetting.value,
                    onChanged: (value) {
                      setState(() {
                        widget.levelSetting.value = value!;
                      });
                    }),
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text(widget.levelSetting.highLevelLabel),
                Radio(
                    value: 3,
                    groupValue: widget.levelSetting.value,
                    onChanged: (value) {
                      setState(() {
                        widget.levelSetting.value = value!;
                      });
                    }),
              ],
            ),
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
