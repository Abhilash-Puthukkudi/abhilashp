import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int seconds;
  late Timer _timer;

  Debouncer({required this.seconds}) {
    _timer = Timer(Duration(seconds: seconds), () {});
  }

  void run(VoidCallback action) {
    // Cancel the previous debounce timer to start a new one
    _timer.cancel();

    // Set up a new debounce timer
    _timer = Timer(Duration(seconds: seconds), action);
  }

  void dispose() {
    // Cancel the debounce timer when the debouncer is disposed
    _timer.cancel();
  }
}
