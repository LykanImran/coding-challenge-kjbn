import 'package:coding_challenge_kjbn/feature/home_page/model/home_model.dart';
import 'package:coding_challenge_kjbn/providers/odd_provider.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OddProvider>(
      builder: (context, oddProv, child) {
        int sec = oddProv.home.currTimer;
        debugPrint("Timer Rebuild ----------> ${sec}");
        return oddProv.msgStatus == MessageStatus.Unintialized
            ? MessageCard(
                title: "Let's Start 🎬",
                sub: "Click on the Button to Start",
                color: oddProv.msgBgColor,
              )
            : MessageCard(
                title: "${oddProv.home!.msgTitle}",
                sub: "${oddProv.home!.msgSub}",
                color: oddProv.msgBgColor,
              );
      },
    );
  }
}

class MessageCard extends StatelessWidget {
  String? title;
  String? sub;
  Color? color;
  MessageCard({this.title, this.sub, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              //height: MediaQuery.of(context).size.height * 0.11,
              decoration: BoxDecoration(
                  color: (color ?? primaryColor).withOpacity(0.15),
                  border: Border(
                      left: BorderSide(
                          color: color ?? primaryColor,
                          style: BorderStyle.solid,
                          width: 4.0))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$title",
                      style: display1.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$sub",
                      style: display3.copyWith(
                          fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )),
        ));
  }
}
