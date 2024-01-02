import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:coding_challenge_kjbn/common/percentage_chart.dart';
import 'package:coding_challenge_kjbn/common/primary_button.dart';
import 'package:coding_challenge_kjbn/feature/home_page/model/home_model.dart';
import 'package:coding_challenge_kjbn/feature/home_page/repository/home_repository.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/dash_card.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/message_display.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/timer_widget.dart';
import 'package:coding_challenge_kjbn/feature/home_page/widgets/titled_card.dart';
import 'package:coding_challenge_kjbn/providers/odd_provider.dart';
import 'package:coding_challenge_kjbn/utils/delayed_animation.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// load Data here
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // Save data when the app is going into the background
      HomeRepository.saveData(Provider.of<OddProvider>(context).home);
    } else if (state == AppLifecycleState.resumed) {
      // Load data when the app is coming to the foreground
      HomeModel home = await HomeRepository.loadData();
      Provider.of<OddProvider>(context).setHomeDate(home);
    }
  }

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
            DelayedAnimation(
                delay: 4,
                child: Row(
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
                )),
            DelayedAnimation(
              delay: 3,
              child: MessageDisplay(),
            ),
            DelayedAnimation(
                delay: 2,
                child: TitledCard(
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
                )),
            const SizedBox(
              height: 25,
            ),
            DelayedAnimation(
                delay: 1,
                child: PrimaryButton(
                  title: '    Click Me    ',
                  onPressed: () {
                    Provider.of<OddProvider>(context, listen: false)
                        .onButtonPressed();
                  },
                  color: primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
