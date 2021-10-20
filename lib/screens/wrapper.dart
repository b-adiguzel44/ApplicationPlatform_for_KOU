import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/authenticate/authenticate.dart';
import 'package:kou_basvuru_platform/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}
