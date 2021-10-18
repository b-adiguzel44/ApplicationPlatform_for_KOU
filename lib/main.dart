import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kou_basvuru_platform/screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// This widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper()
    );
  }
}

