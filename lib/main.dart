import 'package:dats/app.dart';
import 'package:dats/di/di_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDi();
  runApp(const App());
}