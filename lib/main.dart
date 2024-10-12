import 'package:flutter/material.dart';
import 'package:machine_test/app/app.dart';
import 'package:machine_test/app/injector/injector.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}
