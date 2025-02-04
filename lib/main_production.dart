import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantelpro/app/app.dart';
import 'package:plantelpro/bootstrap.dart';
import 'package:plantelpro/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(() => const App());
}
