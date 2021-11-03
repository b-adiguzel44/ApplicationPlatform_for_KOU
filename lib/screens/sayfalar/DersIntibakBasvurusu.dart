import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';
class DersIntibakBasvuru extends StatefulWidget {
  const DersIntibakBasvuru({Key? key}) : super(key: key);

  @override
  _DersIntibakBasvuruState createState() => _DersIntibakBasvuruState();
}

class _DersIntibakBasvuruState extends State<DersIntibakBasvuru> with TickerProviderStateMixin {


  //region Ders İntibak Form Bileşenler

  int currentStep = 0;
  bool isCompleted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // Veritabanından gelecekler
  String adSoyad = "Ad - Soyad"; // yes
  String f_ogrNo = "191307000";  // yes
  String bolum = "ŞUANKİ HALEN KAYIT OLDUĞU BÖLÜM"; // yes
  String gsm = "TELEFON NUMARASI"; // yes
  String eposta = "test@test.com";    // yes
  String f_adres = "YAZIŞMA ADRESİ";    // yes

  // TextFields
  String? _oncekiBolum;
  String? _oncekiFakulte;
  String? _oncekiUni;

  // Önceden Alınan Ders TextFields
  String? _oncekiAd1;
  String? _oncekiAd2;
  String? _oncekiAd3;
  String? _oncekiAd4;
  String? _oncekiAd5;
  String? _oncekiAd6;

  // ŞUANKİ HALEN KAYIT OLDUĞU BÖLÜM bölümünden alınan dersler TextFields
  String? _suankiAd1;
  String? _suankiAd2;
  String? _suankiAd3;
  String? _suankiAd4;
  String? _suankiAd5;
  String? _suankiAd6;

  //region TextFormFields Widgets

  //region Önceki Üniversitede Alınan Dersler (TextFields)
  Widget _buildoncekiUni() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Önceki Üniversiteniz'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiUni = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiUni = value);
      },
    );
  }
  Widget _buildoncekiFakulte() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Önceki Fakülteniz'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiFakulte = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiFakulte = value);
      },
    );
  }
  Widget _buildoncekiBolum() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Önceki Bölümünüz'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiBolum = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiBolum = value);
      },
    );
  }

  Widget _buildoncekiAd1() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd1 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd1 = value);
      },
    );
  }
  Widget _buildoncekiAd2() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd2 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd2 = value);
      },
    );
  }
  Widget _buildoncekiAd3() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd3 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd3 = value);
      },
    );
  }
  Widget _buildoncekiAd4() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd4 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd4 = value);
      },
    );
  }
  Widget _buildoncekiAd5() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd5 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd5 = value);
      },
    );
  }
  Widget _buildoncekiAd6() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _oncekiAd6 = value);
      },

      onChanged: (String? value) {
        setState(() => _oncekiAd6 = value);
      },
    );
  }
  //endregion

  //region $bolum Bölümünden Muaf Olunmak İstenen Dersler

  Widget _buildSsuankiAd1() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd1 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd1 = value);
      },
    );
  }
  Widget _buildSsuankiAd2() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd2 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd2 = value);
      },
    );
  }
  Widget _buildSsuankiAd3() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd3 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd3 = value);
      },
    );
  }
  Widget _buildSsuankiAd4() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd4 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd4 = value);
      },
    );
  }
  Widget _buildSsuankiAd5() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd5 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd5 = value);
      },
    );
  }
  Widget _buildSsuankiAd6() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _suankiAd6 = value);
      },

      onChanged: (String? value) {
        setState(() => _suankiAd6 = value);
      },
    );
  }

  //endregion

  //endregion

  String tarih = DateTime.now().day.toString() + "/" +
      DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();


  //region DropDownButton value çekmek için (ÖNCEKİ DERSLER)
  String? o_teorik_ders1;
  String? o_teorik_ders2;
  String? o_teorik_ders3;
  String? o_teorik_ders4;
  String? o_teorik_ders5;
  String? o_teorik_ders6;
  String? o_uygulama_lab_ders1;
  String? o_uygulama_lab_ders2;
  String? o_uygulama_lab_ders3;
  String? o_uygulama_lab_ders4;
  String? o_uygulama_lab_ders5;
  String? o_uygulama_lab_ders6;
  String? o_kredi1;
  String? o_kredi2;
  String? o_kredi3;
  String? o_kredi4;
  String? o_kredi5;
  String? o_kredi6;
  //endregion

  //region DropDownButton value çekmek için (ŞUANKİ MUAF OLMAK İSTENEN DERSLER)
  String? s_teorik_ders1;
  String? s_teorik_ders2;
  String? s_teorik_ders3;
  String? s_teorik_ders4;
  String? s_teorik_ders5;
  String? s_teorik_ders6;
  String? s_uygulama_lab_ders1;
  String? s_uygulama_lab_ders2;
  String? s_uygulama_lab_ders3;
  String? s_uygulama_lab_ders4;
  String? s_uygulama_lab_ders5;
  String? s_uygulama_lab_ders6;
  String? s_kredi1;
  String? s_kredi2;
  String? s_kredi3;
  String? s_kredi4;
  String? s_kredi5;
  String? s_kredi6;
  //endregion

  final saatler = ["0", "1", "2", "3", "4", "5"];
  final krediler = ["1", "2", "3", "4", "5"];



  // DropDownButton widget'i için eleman oluşturma
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
          value: item,
          child: Text(item)
      );


  //region Step Bölümler
  List<Step> getSteps() => [
    Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0 ,
        title : Text('Kişisel Bilgiler'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Ad - Soyad : $adSoyad',
                style: TextStyle(fontWeight: FontWeight.w600),),
              SizedBox(height: 5),
              Text('Öğrenci Numarası : $f_ogrNo',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Bölüm : $bolum',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('GSM NO : $gsm',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('E-mail : $eposta',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Adres : $f_adres',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),

            ]
        )
    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title : Text('Önceki Üniversitede Alınan Dersler'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildoncekiUni(),
              _buildoncekiFakulte(),
              _buildoncekiBolum(),
              SizedBox(height: 30),
              Text('Kısaltmalar\nT: Teorik Ders Saati\nU/L: Uygulama/Laboratuvar Saati\nK: Kredi',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10),),
              SizedBox(height: 5),
              _buildoncekiAd1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("1. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi1,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi1 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildoncekiAd2(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("2. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi2,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi2 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildoncekiAd3(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("3. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi3,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi3 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildoncekiAd4(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("4. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders4,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders4 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders4,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders4 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi4,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi4 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildoncekiAd5(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("5. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders5,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders5 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders5,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders5 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi5,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi5 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildoncekiAd6(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("6. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_teorik_ders6,
                      onChanged: (String? value) {
                        setState(() {
                          o_teorik_ders6 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_uygulama_lab_ders6,
                      onChanged: (String? value) {
                        setState(() {
                          o_uygulama_lab_ders6 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: o_kredi6,
                      onChanged: (String? value) {
                        setState(() {
                          o_kredi6 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),


            ]
        )

    ),
    Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title : Text('$bolum Bölümünden Muaf Olunmak İstenen Dersler'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Kısaltmalar\nT: Teorik Ders Saati\nU/L: Uygulama/Laboratuvar Saati\nK: Kredi',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10),),
              SizedBox(height: 5),
              _buildSsuankiAd1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("1. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi1,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi1 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildSsuankiAd2(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("2. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi2,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi2 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildSsuankiAd3(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("3. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi3,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi3 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildSsuankiAd4(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("4. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders4,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders4 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders4,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders4 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi4,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi4 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildSsuankiAd5(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("5. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders5,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders5 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders5,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders5 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi5,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi5 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildSsuankiAd6(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("6. Ders")),
                  // Teorik
                  Expanded(
                    child: DropdownButton(
                      hint: Text('T'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_teorik_ders6,
                      onChanged: (String? value) {
                        setState(() {
                          s_teorik_ders6 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama/Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U/L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_uygulama_lab_ders6,
                      onChanged: (String? value) {
                        setState(() {
                          s_uygulama_lab_ders6 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Kredi
                  Expanded(
                    child: DropdownButton(
                      hint: Text('K'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: s_kredi6,
                      onChanged: (String? value) {
                        setState(() {
                          s_kredi6 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),


            ]
        )
    ),
    Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title : Text('Tamamlandı'),
        content: Container()
    ),
  ];

  //endregion


  //endregion


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }



  String sayfaAdi="Bilgiler";
  String? ad="Emre",soyad="Erken",ogrNo="181307072",adres="İzmit",mail="181307072@kocaeli.edu.tr";


  @override
  Widget build(BuildContext context) {



    userModel _userModel = Provider.of<userModel>(context);
    ad =_userModel.user.ad;
    soyad=_userModel.user.soyad;
    adres=_userModel.user.adres;
    mail=_userModel.user.mail;

    return DefaultTabController(length: 4,
        child: Scaffold(
          appBar: AppBar(title: Text("Ders İntibak Başvuru"),
            backgroundColor: Colors.green,
            //centerTitle: true,
            //actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Çıkış",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))],
            elevation: 20,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [Tab(icon: Icon(Icons.person),text: 'Bilgiler',),
                Tab(icon: Icon(Icons.document_scanner),text: 'Form',),
                Tab(icon: Icon(Icons.addchart),text: 'Belgeler',),
                Tab(icon: Icon(Icons.assignment_turned_in_outlined),text: 'Onay',)],)
            ,),
          body: TabBarView(controller:_tabController,
            children: [buildPage('Bilgiler'),
              buildPage('Form'),
              buildPage('Belgeler'),
              buildPage('Onay'),],)
          ,));

  }

  buildPage(String s){

    if(s=="Bilgiler")
    {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          children: <Widget>[
                            Text("KİŞİSEL BİLGİLER",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 30,),
                            TextFormField(
                              enabled: false,
                              initialValue: mail,
                              decoration: InputDecoration(labelText: 'Mail',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: ad,
                              decoration: InputDecoration(labelText: 'Ad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: soyad,
                              decoration: InputDecoration(labelText: 'Soyad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: adres,
                              decoration: InputDecoration(labelText: 'Adres',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),

                            SizedBox(height: 10,),
                            SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() {
                                  _nextPage(1);

                                }
                            )
                          ]
                      )
                  )
              )
          )
      );
    } else if(s=="Form")
    {

      //region Ders İntibak Build Widget

      return Scaffold(
          body: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary: Colors.green)
            ),
            child: Stepper(
              key: _formKey,
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {

                final isLastStep = currentStep == getSteps().length - 1;

                // Son kısma geldiysek
                if(isLastStep) {
                  setState(() {
                    isCompleted = true;
                    tarih = DateTime.now().day.toString() + "/" +
                        DateTime.now().month.toString() + "/" +
                        DateTime.now().year.toString();
                  });
                  // Bütün veriler çekiliyor

                  print(_oncekiUni);
                  print(_oncekiFakulte);
                  print(_oncekiBolum);
                  print("$_oncekiAd1 - T : $o_teorik_ders1 - U/L: $o_uygulama_lab_ders1 - K: $o_kredi1");
                  print("$_oncekiAd2 - T : $o_teorik_ders2 - U/L: $o_uygulama_lab_ders2 - K: $o_kredi2");
                  print("$_oncekiAd3 - T : $o_teorik_ders3 - U/L: $o_uygulama_lab_ders3 - K: $o_kredi3");
                  print("$_oncekiAd4 - T : $o_teorik_ders4 - U/L: $o_uygulama_lab_ders4 - K: $o_kredi4");
                  print("$_oncekiAd5 - T : $o_teorik_ders5 - U/L: $o_uygulama_lab_ders5 - K: $o_kredi5");
                  print("$_oncekiAd6 - T : $o_teorik_ders6 - U/L: $o_uygulama_lab_ders6 - K: $o_kredi6");

                  print("------------------------------------");

                  print("$_suankiAd1 - T : $s_teorik_ders1 - U/L: $s_uygulama_lab_ders1 - K: $s_kredi1");
                  print("$_suankiAd2  - T : $s_teorik_ders2 - U/L: $s_uygulama_lab_ders2 - K: $s_kredi2");
                  print("$_suankiAd3  - T : $s_teorik_ders3 - U/L: $s_uygulama_lab_ders3 - K: $s_kredi3");
                  print("$_suankiAd4  - T : $s_teorik_ders4 - U/L: $s_uygulama_lab_ders4 - K: $s_kredi4");
                  print("$_suankiAd5  - T : $s_teorik_ders5 - U/L: $s_uygulama_lab_ders5 - K: $s_kredi5");
                  print("$_suankiAd6  - T : $s_teorik_ders6 - U/L: $s_uygulama_lab_ders6 - K: $s_kredi6");

                  print('Tamamlandı!');


                  print(tarih);

                  // İlgili verileri sunucuya gönder
                  // Firebase kodları vs.

                  // Form sayfasından çıkartıyorum
                  Navigator.pop(context);
                }
                // Son kısımda değilse ilerlemeye devam et
                else {
                  setState(() => currentStep += 1);
                }

              },
              onStepTapped: (step) => setState(() => currentStep = step),
              onStepCancel:
              // Eğer en başta isek "Cancel" tuşunu deaktif yap (null dönecek)
              // Öbür türlü devam et
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
              controlsBuilder: (context, {onStepContinue,onStepCancel}) {

                final isLastStep = currentStep == getSteps().length - 1;

                return Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? "TAMAMLA" : "DEVAM"),
                            onPressed: onStepContinue,
                          )
                      ),
                      const SizedBox(width: 12),
                      if(currentStep != 0)
                        Expanded(
                            child: ElevatedButton(
                              child: Text("İPTAL"),
                              onPressed: onStepCancel,
                            )
                        )
                    ],
                  ),
                );
              },

            ),
          )
      );

      //endregion

    }
    else if(s=="Belgeler")
    {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: ad,
                              decoration: InputDecoration(labelText: 'Ad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: soyad,
                              decoration: InputDecoration(labelText: 'Soyad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: adres,
                              decoration: InputDecoration(labelText: 'Adres',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: mail,
                              decoration: InputDecoration(labelText: 'Mail',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() { _nextPage(1);}
                            )
                          ]
                      )
                  )
              )
          )
      );
    }
    else
    {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10), padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: ad,
                              decoration: InputDecoration(labelText: 'Ad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: soyad,
                              decoration: InputDecoration(labelText: 'Soyad',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: adres,
                              decoration: InputDecoration(labelText: 'Adres',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              enabled: false,
                              initialValue: mail,
                              decoration: InputDecoration(labelText: 'Mail',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 10,),
                            SocailLoginButton(yukseklik:40, textColor: Colors.white,
                                buttonColor:Colors.green,
                                buttonText: "Devam Et",
                                buttonIcon: Icon(null),
                                onPress:() { _nextPage(1);}
                            )
                          ]
                      )
                  )
              )
          )
      );
    }
  }
}
