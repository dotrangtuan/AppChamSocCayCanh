import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/app/setting/range_setting.dart';

import 'model/app/content/item.dart';

class RangeSettingContainer extends StatefulWidget {
  RangeSetting rangeSetting;
  RangeSettingContainer({Key? key, required this.rangeSetting}) : super(key: key);

  @override
  _RangeSettingContainerState createState() => _RangeSettingContainerState();
}

class _RangeSettingContainerState extends State<RangeSettingContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.rangeSetting.settingTitle),
        SizedBox(height: 72,),
        Text("${widget.rangeSetting.rangeValue}"),
         // Hiển thị giá trị tối đa
        Slider(
          value: widget.rangeSetting.rangeValue.toDouble(),
          min: 0,
          max: 100,
          onChanged: (value) {
            setState(() {
              widget.rangeSetting.rangeValue = value.ceil();
            });
          },
        ),
        
        SizedBox(
          height: 40,
        ),
        OutlinedButton(onPressed: () {}, child: Text("Lưu")),
      ],
    );
  }
}
