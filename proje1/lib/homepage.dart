import "package:flutter/material.dart";

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

// ignore: camel_case_types
class _loginpageState extends State<loginpage> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.green[600],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
          ),
          SizedBox(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 70,
              ),
              child: Image.asset(
                "images/kou2.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            // alignment: Alignment.center,
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: const Text("Yaz Okulu Başvurusu"),
            ),
          ),
          SizedBox(
            width: 250,
            // alignment: Alignment.center,
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: const Text("Yatay Geçiş Başvurusu"),
            ),
          ),
          SizedBox(
            width: 250,
            // alignment: Alignment.center,
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: const Text("Dikey Geçiş Başvurusu"),
            ),
          ),
          SizedBox(
            width: 250,

            // alignment: Alignment.center,
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: const Text("ÇAP Geçiş Başvurusu"),
            ),
          ),
          SizedBox(
            width: 250,
            // alignment: Alignment.center,
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: const Text("Ders İntibakı Başvurusu"),
            ),
          ),
        ],
      ),
    );
  }
}
