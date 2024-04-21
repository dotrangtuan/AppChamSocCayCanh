import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/itemDashboardDetail.dart';
import 'package:flutter_application_1/model/item.dart';


class ItemDashboard extends StatefulWidget {
  Item item;

  ItemDashboard(
      {super.key,required this.item});

  @override
  _ItemDashboardState createState() => _ItemDashboardState();
}

class _ItemDashboardState extends State<ItemDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDashboardDetail(
                      item: widget.item,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  child: Image.asset(widget.item.iconPath),
                ),
              ],
            ),
            Container(
              width: double.maxFinite,
              child: Text(
                widget.item.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Switch(
                    value: widget.item.isOnDevice,
                    onChanged: (bool value) {
                      setState(() {
                        widget.item.toggleSwitch("device");
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
