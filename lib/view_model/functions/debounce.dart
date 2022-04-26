import 'package:flutter/foundation.dart';
import 'dart:async';

class Debounce {
  final int delay;
  VoidCallback? action;
  Timer? _timer;
  bool isBusy = false;

  Debounce({
    this.delay = 300,
  });

  runAfter({required VoidCallback action, int? rate}) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: rate ?? delay), action);
  }

  runBefore({required VoidCallback action, int? rate}) {
    try {
      if (!isBusy) {
        isBusy = true;
        Timer(Duration(milliseconds: rate ?? delay), () => isBusy = false);
        action();
      }
    } catch (e) {
      print(e);
    }
  }
}
