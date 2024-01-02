import 'package:coding_challenge_kjbn/feature/home_page/model/home_model.dart';
import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';

enum MessageStatus {
  Unintialized,
  Matched,
  NotMatched,
  TimeOut,
}

class OddProvider with ChangeNotifier {
  HomeModel _home = HomeModel();
  HomeModel get home => _home;

  int attempts = 0;
  int success = 0;

  MessageStatus _msgStatus = MessageStatus.Unintialized;
  MessageStatus get msgStatus => _msgStatus;

//// Timer
  int _remainingTime = 5;
  Timer? _timer;

  int get remainingTime => _remainingTime;

  void startTimer() {
    debugPrint("Timer : Starting Timer");

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      debugPrint("Current Time ::  $remainingTime");
      if (_remainingTime > 0) {
        _remainingTime--;
        _home.currTimer = _remainingTime;
      } else {
        _resetTimer();
        startTimer();
      }
    });
    notifyListeners();
  }

  void _resetTimer() {
    debugPrint("Timer : Reseting Timer");

    _timer!.cancel();
    _remainingTime = 5;
    _home.currTimer = _remainingTime;
  }

  void dispose() {
    _timer!.cancel();
  }

  void onButtonPressed() {
    final now = DateTime.now();
    _home.second = now.second;
    _home.randomNum = Random().nextInt(60);
    attempts++;
    checkMatching();
    //getMessage();
    if (_timer == null) {
      debugPrint("Timer : First Start");

      // _resetTimer();
      startTimer();
    } else {
      debugPrint("Timer : Reset First Else");
      _resetTimer();

      startTimer();
    }
    // _resetTimer();
    debugPrint(
        'Seconds  : ${_home.second}  || Randome number : ${_home.randomNum}');
    notifyListeners();
  }

  void checkMatching() {
    if (_remainingTime > 0) {
      if (_home.second == home.randomNum) {
        _msgStatus = MessageStatus.Matched;
        success++;
      } else {
        _msgStatus = MessageStatus.NotMatched;
      }
    } else {
      _msgStatus = MessageStatus.TimeOut;
    }
    getMessage();
    notifyListeners();
  }

  /// bool get isMatch => _buttonPressedTimeSeconds == _randomNumber;
  Color msgBgColor = Colors.green;
  void getMessage() {
    if (_msgStatus == MessageStatus.Unintialized) {
      _home.msgTitle = "Let's Start";
      _home.msgSub = "Click on the Button to Start";
      msgBgColor = primaryColor;
    } else if (_msgStatus == MessageStatus.Matched) {
      _home.msgTitle = "Success 😊";
      _home.msgSub = "Score : ${success}/${attempts}";
      msgBgColor = Colors.green;
    } else if (_msgStatus == MessageStatus.NotMatched) {
      _home.msgTitle = "Sorry Try Again";
      _home.msgSub = "Attempts : ${attempts}";
      msgBgColor = Colors.orange;
    } else if (_msgStatus == MessageStatus.TimeOut) {
      _home.msgTitle = "Sorry! Timeout";
      _home.msgSub = "Attempts : ${attempts}";
      msgBgColor = Colors.red;
    }
  }
}
