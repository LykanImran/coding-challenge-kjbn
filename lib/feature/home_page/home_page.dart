import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:coding_challenge_kjbn/common/percentage_chart.dart';
import 'package:coding_challenge_kjbn/common/primary_button.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/dash_card.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/message_display.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/timer_widget.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/titled_card.dart';
import 'package:coding_challenge_kjbn/providers/odd_provider.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("HomePage :: build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Odds Checker"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                DashCard(
                  title:
                      '${Provider.of<OddProvider>(context).home.second ?? 0}',
                  sub: 'Current Second',
                ),
                DashCard(
                  title:
                      '${Provider.of<OddProvider>(context).home.randomNum ?? 0}',
                  sub: 'Random Number',
                ),
              ],
            ),
            MessageDisplay(),
            TitledCard(
              title: 'Timer',
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Consumer<OddProvider>(
                  builder: (context, oddProv, child) {
                    int sec = oddProv.home.currTimer;
                    debugPrint("Timer Rebuild ----------> ${sec}");
                    return TimerWidget(
                      value: sec, // 40% filled
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryButton(
              title: '    Click Me    ',
              onPressed: () {
                Provider.of<OddProvider>(context, listen: false)
                    .onButtonPressed();
              },
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
