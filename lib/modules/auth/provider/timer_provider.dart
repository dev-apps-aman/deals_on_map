import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int secondsRemaining = 30;
  bool isResendButtonEnabled = false;
  Timer? _timer;

  void startTimer() {
    secondsRemaining = 30;
    isResendButtonEnabled = false;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        isResendButtonEnabled = true;
        _timer?.cancel();
        notifyListeners();
      }
    });
  }

  void resetTimer() {
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
