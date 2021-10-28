import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/sayfalar/authenticate.dart';
import 'package:kou_basvuru_platform/screens/wrapper.dart';
import 'package:kou_basvuru_platform/services/fake_auth.dart';
import 'package:provider/provider.dart';
import 'package:kou_basvuru_platform/services/auth.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
    return ChangeNotifierProvider<userModel>(
      create: (context)=> userModel(),
      child: MaterialApp( home: Authenticate()),

    );
  }
}

