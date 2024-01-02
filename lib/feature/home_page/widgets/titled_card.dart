import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';

class TitledCard extends StatelessWidget {
  Widget child;
  String title;
  TextStyle? titleStyle;
  Color? color;
  TitledCard(
      {required this.child, this.title = '', this.titleStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      elevation: 0,
      //color: Colors.red.withOpacity(0.78),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: primaryColor),
                  padding:
                      EdgeInsets.only(left: 5, top: 8, bottom: 8, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$title",
                        style: titleStyle ??
                            display2.copyWith(
                                fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //Divider(thickness: 1.5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: child,
                )
              ],
            )),
      ),
    );
  }
}
