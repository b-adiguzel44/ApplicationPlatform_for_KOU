import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);



  // Home sayfasına giriş yapıldıktan sonra Mavi bir avatar gözüküyor olması lazım
  // TODO: Home ekranından sonra giriş yapan kullanıcı türüne (öğrenci/admin) göre ilgili sayfa ve kısımları buraya getir

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircleAvatar(
          radius: 50.0,
        ),
      ),
    );
  }
}
