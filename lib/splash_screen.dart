import 'package:coding_challenge_kjbn/feature/home_page/home_page.dart';
import 'package:coding_challenge_kjbn/utils/const.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Lottie.asset('$robotLot'),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Odd's Checker", style: display1),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Loading ... ', style: display2),
              Lottie.asset('$sandClockLot', width: 85),
            ],
          )
        ],
      ),
    );
  }
}
