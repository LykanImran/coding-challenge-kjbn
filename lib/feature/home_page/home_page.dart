import 'package:coding_challenge_kjbn/common/percentage_chart.dart';
import 'package:coding_challenge_kjbn/common/primary_button.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/dash_card.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/message_display.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/titled_card.dart';
import 'package:coding_challenge_kjbn/providers/odd_provider.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late OddProvider oddProv;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
    oddProv = Provider.of<OddProvider>(context, listen: true);
    //  oddProv.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Home page :: build : ${oddProv.home.currTimer.toDouble()}");

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
                  title: '${oddProv.home.second ?? 0}',
                  sub: 'Current Second',
                ),
                DashCard(
                  title: '${oddProv.home.randomNum ?? 0}',
                  sub: 'Random Number',
                ),
              ],
            ),
            MessageDisplay(),
            TitledCard(
                title: 'Timer',
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: PercentageChart(
                    percentage: oddProv.home.currTimer.toDouble(),
                    rankKey: "timer",
                    fontSize: 30,
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            PrimaryButton(
              title: '    Click Me    ',
              onPressed: () {
                oddProv.onButtonPressed();
              },
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
