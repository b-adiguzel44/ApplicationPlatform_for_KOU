import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Çalışıyore :D',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 60.0),
        ),

      ),
    );
  }
}
