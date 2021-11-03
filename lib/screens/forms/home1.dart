import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/screens/forms/ders_intibak_form.dart';
import 'package:kou_basvuru_platform/screens/forms/dgs_form.dart';
import 'package:kou_basvuru_platform/screens/forms/yataygecis_form.dart';
import 'package:kou_basvuru_platform/screens/forms/yaz_okulu_form.dart';
import 'package:kou_basvuru_platform/screens/forms/cap_form.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          margin: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YazOkuluForm()));
                  },
                  icon: Icon(Icons.add),
                  label: Text('Yaz Okulu Form')),
              SizedBox(height: 15),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DgsForm()));
                  },
                  icon: Icon(Icons.add),
                  label: Text('DGS Form')),
              SizedBox(height: 15),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YG_Form()));
                  },
                  icon: Icon(Icons.add),
                  label: Text('Yatay Geçiş Form')),
              SizedBox(height: 15),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DersIntibakForm()));
                  },
                  icon: Icon(Icons.add),
                  label: Text('Ders İntibakı Form')),
              SizedBox(height: 15),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CapForm()));
                  },
                  icon: Icon(Icons.add),
                  label: Text('ÇAP Form')),
            ],
          ),
        ),
      ),
    );
  }
}
