import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_resource/data.dart';
import 'package:flutter_application_1/itemDashboard.dart';
import 'package:flutter_application_1/model/app/content/item.dart';
import 'package:flutter_application_1/model/app/content/light.dart';
import 'package:flutter_application_1/model/app/content/mist_spray.dart';
import 'package:flutter_application_1/model/app/content/roof.dart';
import 'package:flutter_application_1/model/app/setting/level_setting.dart';
import 'package:flutter_application_1/model/app/setting/range_setting.dart';
import 'package:flutter_application_1/model/app/setting/timer_setting.dart';
import 'package:flutter_application_1/model/app/content/watering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

 

class _HomeState extends State<Home> {

  late List<Item> data;

  late Object _sensorValue;
  late DatabaseReference _sensorRef;
  late StreamSubscription<DatabaseEvent> _sensorSubscription;
  bool initialized = false;
  FirebaseException? _error;

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
    if (kDebugMode) {
      print("init state !!");
    }
  }

  Future<void> init() async {
    _sensorRef  = FirebaseDatabase.instance.ref();
    data = await Data().getData();

    setState(() {
      initialized = true;
      
    });

    _sensorSubscription = _sensorRef.onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          _error = null;

          final value = event.snapshot.value;

          if (value != null) {
            // Map<dynamic, dynamic> dataConvert = value as Map<dynamic, dynamic>;
            // Sensor sensor = Sensor.fromMap(dataConvert['sensor']); 
            // (data[0] as Watering).sensorValue = sensor.do_am_dat;
          }
        });
      },

      onError: (Object o) {
        final error = o as FirebaseException;
        setState(() {
          _error = error;
        });
      },
    );
   
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sensorSubscription.cancel();
    if (kDebugMode) {
      print("dispose !!");
    }
  }

  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: !initialized ? Center(
        child: Text("Đang tải dữ liệu ..."),
      ) :

      ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                
                const SizedBox(height: 30),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hi Vũ Ngọc Minh!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Hãy chăm sóc cây của bạn',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: CircleAvatar(
                    radius: 30,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image.asset("images/tree.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 5)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('32\u2103'),
                    Text(
                      'Nhiệt độ',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('82%'),
                    Text(
                      'Độ ẩm không khí',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('40%'),
                    Text(
                      'Độ ẩm đất',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.cloud_rain,
                      size: 20,
                    ),
                    Text(
                      'Thời tiết',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                children: [
                  for (var e in data)
                    ItemDashboard(
                      item: e,
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// display sensor watering

