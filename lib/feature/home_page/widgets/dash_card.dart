import 'dart:ui';

import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  String title;
  String sub;
  Color? color;
  DashCard({this.title = "", this.sub = "", this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: color ?? primaryColor,
                          style: BorderStyle.solid,
                          width: 4.0))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$title",
                      style: display1.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$sub",
                      style:
                          display3.copyWith(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
        ));
  }
}
