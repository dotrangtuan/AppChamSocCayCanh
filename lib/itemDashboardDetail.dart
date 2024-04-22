import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/circularContainer.dart';
import 'package:flutter_application_1/model/app/content/item.dart';
import 'package:flutter_application_1/model/app/content/light.dart';
import 'package:flutter_application_1/model/app/content/mist_spray.dart';
import 'package:flutter_application_1/model/app/content/roof.dart';
import 'package:flutter_application_1/model/app/content/watering.dart';
import 'package:flutter_application_1/level_setting.dart';
import 'package:flutter_application_1/timer_setting.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'range_setting.dart';

class ItemDashboardDetail extends StatefulWidget {
  Item item;

  ItemDashboardDetail({super.key, required this.item});

  @override
  _ItemDashboardDetailState createState() => _ItemDashboardDetailState();
}

class _ItemDashboardDetailState extends State<ItemDashboardDetail> {
  int currentIndexPageCarouselSlider = 0; // tiêu đề cảm biến
  late List<Widget> contents; // thông số
  late List<Widget> itemSettings; // cài đặt
  late DatabaseReference _sensorRef;
  late StreamSubscription<DatabaseEvent> _sensorSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    print("init state con !!");

  }

  Future<void> init() async {
    _sensorRef  = FirebaseDatabase.instance.ref();

    // setState(() {
    //   initialized = true;
    // });

    _sensorSubscription = _sensorRef.onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          // _error = null;

          final value = event.snapshot.value;

          if (value != null) {
            // Map<dynamic, dynamic> dataConvert = value as Map<dynamic, dynamic>;
            final sensor = (value as dynamic)['sensor']; 

            if (widget.item is Watering) {
              (widget.item as Watering).sensorValue = sensor['do_am_dat'];
            } 

            if (widget.item is MistSpray) {
              (widget.item as MistSpray).tempValue = sensor['nhiet_do'];
              (widget.item as MistSpray).humidValue = sensor['do_am_moi_truong'];
            }
          }
        });
      },

      // onError: (Object o) {
      //   final error = o as FirebaseException;
      //   setState(() {
      //     _error = error;
      //   });
      // },
    );
   
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sensorSubscription.cancel();
    print("con bị hủy !");
  }

  @override
  Widget build(BuildContext context) {
    double heightContainer =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    if (widget.item is Watering) {
      Watering watering = widget.item as Watering;
      contents = [
        Text(watering.sensorTitle),
        SizedBox(
          height: 22,
        ),
        Container(
          child: CircularPercentIndicator(
            startAngle: 180,
            radius: 80,
            lineWidth: 20,
            percent: watering.sensorValue.toDouble() / 100,
            progressColor: Colors.green,
            backgroundColor: Colors.green.shade200,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              "${watering.sensorValue}%",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ];

      itemSettings = [
        RangeSettingContainer(
          rangeSetting: watering.rangeSetting,
        ),
        LevelSettingContainer(
          levelSetting: watering.speedSetting,
        ),
        TimerSettingContainer(
          timerSetting: watering.timerSetting,
        )
      ];
    }

    if (widget.item is Light) {
      Light light = widget.item as Light;
      contents = [
        Container(
          height: 200,
          child: Image.asset("images/brightness512.png"),
        )
      ];

      itemSettings = [
        LevelSettingContainer(
          levelSetting: light.adaptSetting,
        ),
        TimerSettingContainer(
          timerSetting: light.timerSetting,
        )
      ];
    }

    if (widget.item is Roof) {
      Roof roof = widget.item as Roof;
      contents = [
        Container(
          height: 200,
          child: Image.asset("images/roof512.png"),
        )
      ];

      itemSettings = [
        TimerSettingContainer(timerSetting: roof.timerSetting),
      ];
    }

    if (widget.item is MistSpray) {
      MistSpray mistSpray = widget.item as MistSpray;

      contents = [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(mistSpray.tempTitle),
                SizedBox(
                  height: 22,
                ),
                Container(
                  child: CircularPercentIndicator(
                    startAngle: 180,
                    radius: 60,
                    lineWidth: 16,
                    percent: mistSpray.tempValue.toDouble() / 100,
                    progressColor: Colors.green,
                    backgroundColor: Colors.green.shade200,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "${mistSpray.tempValue}\u2103",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(mistSpray.humidTitle),
                SizedBox(
                  height: 22,
                ),
                Container(
                  child: CircularPercentIndicator(
                    startAngle: 180,
                    radius: 60,
                    lineWidth: 16,
                    percent: mistSpray.humidValue.toDouble() / 100 ,
                    progressColor: Colors.green,
                    backgroundColor: Colors.green.shade200,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "${mistSpray.humidValue}%",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ];

      itemSettings = [
        RangeSettingContainer(
            rangeSetting: mistSpray.rangeSettings[0]), // thiet lap nhiet do
        RangeSettingContainer(rangeSetting: mistSpray.rangeSettings[1]),
        LevelSettingContainer(levelSetting: mistSpray.speedSetting),
        TimerSettingContainer(timerSetting: mistSpray.timerSetting)
      ];
    }

    // if (widget.item is Light) {
    //   sensorTitleText = Text((widget.item as Light).sensorTitle);
    //   itemsCarousel = [
    //     RangeSettingContainer(item: widget.item),
    //     TimerSettingContainer()
    //   ];
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.item.title),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // content
              height: 0.4 * heightContainer,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tự động"),
                      SizedBox(
                        width: 8,
                      ),
                      Switch(
                          value: widget.item.isAuto,
                          onChanged: (bool value) {
                            setState(() {
                              widget.item.toggleSwitch("auto");
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  for (var content in contents) content,
                ],
              ),
            ),
            Container(
              // setting
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid)),
                      child: Column(children: [
                        CarouselSlider(
                            items: itemSettings,
                            options: CarouselOptions(
                                enableInfiniteScroll: false,
                                viewportFraction: 1,
                                height: 270,
                                onPageChanged: (index, _) => {
                                      setState(() {
                                        currentIndexPageCarouselSlider = index;
                                      })
                                    })),
                        itemSettings.length > 1 ? 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < itemSettings.length; i++)
                              CircularContainer(
                                color: i == currentIndexPageCarouselSlider
                                    ? Colors.green
                                    : Colors.grey,
                              )
                          ],
                        ) : SizedBox(height: 8,)
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
