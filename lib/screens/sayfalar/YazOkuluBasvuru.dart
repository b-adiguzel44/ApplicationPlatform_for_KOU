import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';

class YazOkuluBasvuru extends StatefulWidget {
  const YazOkuluBasvuru({Key? key}) : super(key: key);

  @override
  _YazOkuluBasvuruState createState() => _YazOkuluBasvuruState();
}

class _YazOkuluBasvuruState extends State<YazOkuluBasvuru>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentStep = 0;
  bool isCompleted = false;
  final String tarih = DateTime.now().day.toString() + "/" +
      DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();


  // Diyalog Ekranı
  Widget _alertUser()
  {
    return AlertDialog(
      title: Icon(Icons.date_range),
      content: Text('Tarih Seçilmiştir'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Tamam"))
      ],
    );
  }


  // region Yaz okulu Başlangıç-Bitiş tarihleri fonksiyon

  // Yaz Okulu Başlangıç
  Future<void> _pickFirstDate(BuildContext context) async {

    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2022, 6),
      lastDate: DateTime(2022, 9),
      initialDate: DateTime(2022, 6),
      errorFormatText: "Hatalı format",
      errorInvalidText: "Geçersiz Tarih",
      fieldLabelText: "Tarih giriniz",
      helpText: "Yaz Okulu Başlangıç Tarihi",
      fieldHintText: "aa/gg/yyyy",
      cancelText: "İptal",
      confirmText: "Onayla",
    );

    if (date != null) {

      setState(() {

        firstDate = date;

      });


    }

  }

  // Yaz Okulu Bitiş
  Future<void> _pickLastDate(BuildContext context) async {

    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: firstDate ?? DateTime(2022, 6),
      lastDate: DateTime(2022, 9),
      initialDate: firstDate ?? DateTime(2022, 6),
      errorFormatText: "Hatalı format",
      errorInvalidText: "Geçersiz Tarih",
      fieldLabelText: "Tarih giriniz",
      helpText: "Yaz Okulu Bitiş Tarihi",
      fieldHintText: "aa/gg/yyyy",
      cancelText: "İptal",
      confirmText: "Onayla",
    );

    if (date != null) {

      setState(() {

        lastDate = date;

      });

    }

  }

  // endregion

// Veritabanından gelecekler
  String bolum = "BILISIM SISTEMLERI MUHENDISLIGI";
  String fakulte = "TEKNOLOJI FAKULTESI";
  String numara = "NUMARA ALANI";
  String isim = "AD-SOYAD ALANI";
  String eMail = "EMAIL ALAN";
  String f_adres = "ADRES ALAN";
  String gsm = "(0562) 3232 21312";

  // Yaz Okulu Başlangıç ve Bitiş Tarihleri (DateTime tipindeler string e çevirip alabiliriz)
  DateTime? firstDate;
  DateTime? lastDate;
  String? yazOkulBaslangic;
  String? yazOkulBitis;


  // Kullanıcının (Öğrenci) girmesi gereken bilgiler (Yaz Okulu Bilgileri)

  // region TextField Variables
  String? _basvuruUni = "Başvurulan Üni";       // ok
  String? _ogrDanismani = "Danışman AD SOYAD";    // ok
  String? _bolumBaskani = "Bölüm Başkanı AD SOYAD";   // ok

  String? _kou_ders_ad_kod1;  // ok
  String? _kou_ders_ad_kod2;  // ok
  String? _kou_ders_ad_kod3;  // ok

  String? _yaz_ders_ad_kod1;  // ok
  String? _yaz_ders_ad_kod2;  // ok
  String? _yaz_ders_ad_kod3;  // ok
  // endregion

  //region DropDownButton Value Variables (KOÜ'de sorumlu olduğu dersler)
  String? k_teorik_ders1;
  String? k_teorik_ders2;
  String? k_teorik_ders3;
  String? k_uygulama_ders1;
  String? k_uygulama_ders2;
  String? k_uygulama_ders3;
  String? k_lab_ders1;
  String? k_lab_ders2;
  String? k_lab_ders3;
  String? k_kredi1;
  String? k_kredi2;
  String? k_kredi3;
  //endregion

  //region DropDownButton Value Variables (Yaz okulunda sorumlu olduğu dersler)
  String? y_teorik_ders1;
  String? y_teorik_ders2;
  String? y_teorik_ders3;
  String? y_uygulama_ders1;
  String? y_uygulama_ders2;
  String? y_uygulama_ders3;
  String? y_lab_ders1;
  String? y_lab_ders2;
  String? y_lab_ders3;
  String? y_kredi1;
  String? y_kredi2;
  String? y_kredi3;
  //endregion

  // region TextField Widgets

  Widget _buildBasvuruUni() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Başvurulacak Üniversite'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _basvuruUni = value);
      },

      onChanged: (String? value) {
        setState(() => _basvuruUni = value);
      },
    );
  }

  Widget _buildOgrDanisman() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Danışman İsim-Soyisim'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _ogrDanismani = value);
      },

      onChanged: (String? value) {
        setState(() => _ogrDanismani = value);
      },
    );

  }

  Widget _buildBolumBaskan() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Bölüm Başkanı İsim-Soyisim'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _bolumBaskani = value);
      },

      onChanged: (String? value) {
        setState(() => _bolumBaskani = value);
      },
    );
  }

  Widget _buildKouDersAdKod1() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _kou_ders_ad_kod1 = value);
      },

      onChanged: (String? value) {
        setState(() => _kou_ders_ad_kod1 = value);
      },
    );
  }

  Widget _buildKouDersAdKod2() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _kou_ders_ad_kod2 = value);
      },

      onChanged: (String? value) {
        setState(() => _kou_ders_ad_kod2 = value);
      },
    );
  }

  Widget _buildKouDersAdKod3() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _kou_ders_ad_kod3 = value);
      },

      onChanged: (String? value) {
        setState(() => _kou_ders_ad_kod3 = value);
      },
    );
  }

  Widget _buildYazDersAdKod1() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _yaz_ders_ad_kod1 = value);
      },

      onChanged: (String? value) {
        setState(() => _yaz_ders_ad_kod1 = value);
      },
    );
  }

  Widget _buildYazDersAdKod2() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _yaz_ders_ad_kod2 = value);
      },

      onChanged: (String? value) {
        setState(() => _yaz_ders_ad_kod2 = value);
      },
    );
  }

  Widget _buildYazDersAdKod3() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: 'Ders Adı ve Kodu'
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }


        return null;
      },
      onSaved: (String? value) {
        setState(() => _yaz_ders_ad_kod3 = value);
      },

      onChanged: (String? value) {
        setState(() => _yaz_ders_ad_kod3 = value);
      },
    );
  }

  // endregion



  // DropDown Items
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

              Text('Ad - Soyad : $isim',
                style: TextStyle(fontWeight: FontWeight.w600),),
              SizedBox(height: 5),
              Text('Öğrenci Numarası : $numara',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Fakülte : $fakulte',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Bölüm : $bolum',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('GSM NO : $gsm',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('E-mail : $eMail',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Adres : $f_adres',
                  style: TextStyle(fontWeight: FontWeight.w600)),

            ]
        )
    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title : Text('Yaz Okulu Bilgileri'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildBasvuruUni(),
              SizedBox(height: 5),
              _buildOgrDanisman(),
              SizedBox(height: 5),
              _buildBolumBaskan(),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () async {
                    await _pickFirstDate(context);
                    showDialog(
                        context: context,
                        builder: (context) => _alertUser()
                    );
                  },
                  child: Text("Başlangıç Tarihini Seçiniz")),
              ElevatedButton(
                  onPressed: () async {
                    await _pickLastDate(context);
                    showDialog(
                        context: context,
                        builder: (context) => _alertUser()
                    );
                  },
                  child: Text("Bitiş Tarihini Seçiniz")),

            ]
        )

    ),
    Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title : Text('KOÜ $fakulte-$bolum bölümünde sorumlu olunan Dersler'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Kısaltmalar\nT: Teorik Ders Saati\nU: Uygulama Saati\nL: Laboratuvar Saati\nK: Kredi',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10),),
              SizedBox(height: 5),
              _buildKouDersAdKod1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("1. Ders")),
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
                      value: k_teorik_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          k_teorik_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_uygulama_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          k_uygulama_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_lab_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          k_lab_ders1 = value!;
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
                      value: k_kredi1,
                      onChanged: (String? value) {
                        setState(() {
                          k_kredi1 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildKouDersAdKod2(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("2. Ders")),
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
                      value: k_teorik_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          k_teorik_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_uygulama_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          k_uygulama_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_lab_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          k_lab_ders2 = value!;
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
                      value: k_kredi2,
                      onChanged: (String? value) {
                        setState(() {
                          k_kredi2 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildKouDersAdKod3(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("3. Ders")),
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
                      value: k_teorik_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          k_teorik_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_uygulama_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          k_uygulama_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: k_lab_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          k_lab_ders3 = value!;
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
                      value: k_kredi3,
                      onChanged: (String? value) {
                        setState(() {
                          k_kredi3 = value!;
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
        title : Text('Yaz Öğretimi Kapsamında Alınacak Dersler'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Kısaltmalar\nT: Teorik Ders Saati\nU: Uygulama Saati\nL: Laboratuvar Saati\nK: Kredi',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10),),
              SizedBox(height: 5),
              _buildYazDersAdKod1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("1. Ders")),
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
                      value: y_teorik_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          y_teorik_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_uygulama_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          y_uygulama_ders1 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_lab_ders1,
                      onChanged: (String? value) {
                        setState(() {
                          y_lab_ders1 = value!;
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
                      value: y_kredi1,
                      onChanged: (String? value) {
                        setState(() {
                          y_kredi1 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildYazDersAdKod2(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("2. Ders")),
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
                      value: y_teorik_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          y_teorik_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_uygulama_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          y_uygulama_ders2 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_lab_ders2,
                      onChanged: (String? value) {
                        setState(() {
                          y_lab_ders2 = value!;
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
                      value: y_kredi2,
                      onChanged: (String? value) {
                        setState(() {
                          y_kredi2 = value!;
                        });
                      },
                      items: krediler.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildYazDersAdKod3(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child:Text("3. Ders")),
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
                      value: y_teorik_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          y_teorik_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Uygulama
                  Expanded(
                    child: DropdownButton(
                      hint: Text('U'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_uygulama_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          y_uygulama_ders3 = value!;
                        });
                      },
                      items: saatler.map(buildMenuItem).toList(),
                    ),
                  ),
                  // Lab
                  Expanded(
                    child: DropdownButton(
                      hint: Text('L'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: 14
                      ),
                      value: y_lab_ders3,
                      onChanged: (String? value) {
                        setState(() {
                          y_lab_ders3 = value!;
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
                      value: y_kredi3,
                      onChanged: (String? value) {
                        setState(() {
                          y_kredi3 = value!;
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
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title : Text('Tamamlandı'),
        content: Container()
    ),
  ];

  //endregion

  // endregion


  late File file;
  late PlatformFile fileType;
  late String fileName;
  int currentStep2 = 0;
  bool isCompleted2 = false;
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

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

  String sayfaAdi = "Bilgiler";
  String? ad = "Emre",
      soyad = "Erken",
      ogrNo = "181307072",
      adres = "İzmit",
      mail = "181307072@kocaeli.edu.tr";
  @override
  Widget build(BuildContext context) {

    //fileName = file!= null ? basename(file!.path):"Dosya Seçilemedi";
    userModel _userModel = Provider.of<userModel>(context);


    ad = _userModel.user.ad;
    soyad = _userModel.user.soyad;
    adres = _userModel.user.adres;
    mail = _userModel.user.mail;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Yaz Okulu Başvuru"),
            backgroundColor: Colors.green,
            //centerTitle: true,
            //actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Çıkış",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))],
            elevation: 20,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Bilgiler',

                ),
                Tab(
                  icon: Icon(Icons.document_scanner),
                  text: 'Form',
                ),
                Tab(
                  icon: Icon(Icons.addchart),
                  text: 'Belgeler',
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  text: 'Onay',
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              buildPage('Bilgiler'),
              buildPage('Form'),
              buildPage('Belgeler'),
              buildPage('Onay'),
            ],
          ),
        ));
  }

  buildPage(String s) {

    if (s == "Bilgiler") {
      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Center(
              child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(children: <Widget>[
                        Text(
                          "KİŞİSEL BİLGİLER",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: mail,
                          decoration: InputDecoration(
                              labelText: 'Mail', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: ad,
                          decoration: InputDecoration(
                              labelText: 'Ad', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: soyad,
                          decoration: InputDecoration(
                              labelText: 'Soyad', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: adres,
                          decoration: InputDecoration(
                              labelText: 'Adres', border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SocailLoginButton(
                            yukseklik: 40,
                            textColor: Colors.white,
                            buttonColor: Colors.green,
                            buttonText: "Devam Et",
                            buttonIcon: Icon(null),
                            onPress: () {
                              _nextPage(1);
                            })
                      ])))));
    } else if (s == "Form") {

      //region Yaz Okul Build Widget

      return Scaffold(
          backgroundColor: Colors.green[100],
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
                  });
                  _nextPage(1);
                  // Bütün veriler çekiliyor
                  // print(tarih);

                  // İlgili verileri sunucuya gönder
                  // Firebase kodları vs.


                }
                // Son kısımda değilse ilerlemeye devam et
                else {
                  setState(() => currentStep += 1);
                }

              },
             // onStepTapped: (step) => setState(() => currentStep = step),
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
    } else if (s == "Belgeler") {
      bool sonuc= false;



      List<Step> getSteps() => [
        Step(
            state: currentStep2 > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep2 >= 0 ,
            title : Text('Basvuru Formu'),
            content: Column(
                children: <Widget>[SocailLoginButton(
                    yukseklik: 40,
                    textColor: Colors.white,
                    buttonColor: Colors.green,
                    buttonText: "Dosya Seç",
                    buttonIcon: Icon(null),
                    onPress: () {
                      dosyaSec();
                    }),
                  SocailLoginButton(
                      yukseklik: 40,
                      textColor: Colors.white,
                      buttonColor: Colors.green,
                      buttonText: "Dosya Yükle",
                      buttonIcon: Icon(null),
                      onPress: () {
                        dosyaYukle(context);
                        sonuc=true;
                        bildirim("Başarılı", "Dosya Yükleme İşlemi Gerçekleştirildi.");
                      }),])

        ),
        Step(
            state: currentStep2 > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep2 >= 1 ,
            title : Text('Üniversite Taban Puanları'),
            content: Column(
                children: <Widget>[SocailLoginButton(
                    yukseklik: 40,
                    textColor: Colors.white,
                    buttonColor: Colors.green,
                    buttonText: "Dosya Seç",
                    buttonIcon: Icon(null),
                    onPress: () {
                      dosyaSec();
                    }),
                  SocailLoginButton(
                      yukseklik: 40,
                      textColor: Colors.white,
                      buttonColor: Colors.green,
                      buttonText: "Dosya Yükle",
                      buttonIcon: Icon(null),
                      onPress: () {
                        dosyaYukle(context);
                        sonuc=true;
                        bildirim("Başarılı", "Dosya Yükleme İşlemi Gerçekleştirildi.");
                      }),])

        ),
        Step(
            state: currentStep2 > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep2 >= 2 ,
            title : Text('Ders İçerikleri'),
            content: Column(
                children: <Widget>[SocailLoginButton(
                    yukseklik: 40,
                    textColor: Colors.white,
                    buttonColor: Colors.green,
                    buttonText: "Dosya Seç",
                    buttonIcon: Icon(null),
                    onPress: () {
                      dosyaSec();
                    }),
                  SocailLoginButton(
                      yukseklik: 40,
                      textColor: Colors.white,
                      buttonColor: Colors.green,
                      buttonText: "Dosya Yükle",
                      buttonIcon: Icon(null),
                      onPress: () {
                        dosyaYukle(context);
                        sonuc=true;
                        bildirim("Başarılı", "Dosya Yükleme İşlemi Gerçekleştirildi.");
                      }),])

        ),
        Step(
            state: currentStep2 > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep2 >= 3 ,
            title : Text('Transkript'),
            content: Column(
                children: <Widget>[SocailLoginButton(
                    yukseklik: 40,
                    textColor: Colors.white,
                    buttonColor: Colors.green,
                    buttonText: "Dosya Seç",
                    buttonIcon: Icon(null),
                    onPress: () {
                      dosyaSec();
                    }),
                  SocailLoginButton(
                      yukseklik: 40,
                      textColor: Colors.white,
                      buttonColor: Colors.green,
                      buttonText: "Dosya Yükle",
                      buttonIcon: Icon(null),
                      onPress: () {
                        dosyaYukle(context);
                        sonuc=true;
                        bildirim("Başarılı", "Dosya Yükleme İşlemi Gerçekleştirildi.");

                      }),]
            )
        ),
        Step(
            state: currentStep2 > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep2 >= 4,
            title : Text('Tamamlandı'),
            content: Container()
        ),
      ];

      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Stepper(
            key: _formKey2,
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: currentStep2,
            onStepContinue: () {
              final isLastStep = currentStep2 == getSteps().length - 1;
              // Son kısma geldiysek
              if(isLastStep) {
                setState(() {
                  isCompleted2 = true;
                });
                // Bütün veriler çekiliyor
                print('Tamamlandı!');
                _nextPage(1);
                currentStep2 = 0;
              }
              // Son kısımda değilse ilerlemeye devam et
              else {
                if(sonuc==true){
                  setState(() => currentStep2 += 1);
                }
                else
                {
                  bildirim("Dosya Yükleme Hatası", "İlgili Dosya Yüklenmeden İlerlenemez.");
                }

              }

            },
            //onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel:
            // Eğer en başta isek "Cancel" tuşunu deaktif yap (null dönecek)
            // Öbür türlü devam et
            currentStep2 == 0 ? null : () => setState(() => currentStep2 -= 1),
            controlsBuilder: (context, {onStepContinue,onStepCancel}) {

              final isLastStep = currentStep2 == getSteps().length - 1;

              return Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[TextButton(onPressed: onStepContinue, child: Text(isLastStep ? "TAMAMLA" : "DEVAM"),style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.green)),),
                  ],
                ),
              );
            },

          )
      );
    } else {
      int currentstep1=2;

      List<Step> getSteps() => [
        Step(
            state: currentstep1 > 0 ? StepState.complete : StepState.indexed,
            isActive: currentstep1 >= 0 ,
            title : Text('Kişisel Bilgiler'),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[]
            )
        ),
        Step(
            state: currentstep1 > 0 ? StepState.complete : StepState.indexed,
            isActive: currentstep1 >= 0 ,
            title : Text('Form'),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[]
            )
        ),
        Step(
            state: currentstep1 > 1 ? StepState.complete : StepState.indexed,
            isActive: currentstep1 >= 1,
            title : Text('Belgeler'),
            content: Container()
        ),
      ];

      return Scaffold(
          backgroundColor: Colors.green[100],
          body: Stepper(
            key: _formKey,
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: currentstep1,
            onStepContinue: () {
              final isLastStep = currentstep1 == getSteps().length - 1;
              // Son kısma geldiysek
              if(isLastStep) {
                setState(() {
                  isCompleted = true;
                });
                userModel _userModel = Provider.of<userModel>(context);

                _userModel.basvuruKaydet(_userModel.user, "Yaz Okulu Basvurusu");

                bildirim("Başarılı", "Başvuru Oluşturuldu.");

                _nextPage(1);

              }
              // Son kısımda değilse ilerlemeye devam et
              else {
                setState(() => currentstep1 += 1);
              }

            },
            //onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel:
            // Eğer en başta isek "Cancel" tuşunu deaktif yap (null dönecek)
            // Öbür türlü devam et
            currentstep1 == 0 ? null : () => setState(() => currentstep1 -= 1),
            controlsBuilder: (context, {onStepContinue,onStepCancel}) {

              final isLastStep = currentstep1 == getSteps().length - 1;

              return Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                          child: Text(isLastStep ? "Başvuruyu Onayla" : "DEVAM"),
                          onPressed: onStepContinue,
                        )
                    ),
                  ],
                ),
              );
            },

          )
      );
    }

  }
  Future dosyaSec() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null) return ;
    final path = result.files.single.path!;
    fileType = result.files.first;
    setState(() =>file = File(path));



  }

  Future dosyaYukle(BuildContext context) async {
    final _userModel = Provider.of<userModel>(context);
    if (file != null) {
      await _userModel.uploadFile(
          _userModel.user.userID, fileType.extension!, file,fileType.name);


    }

  }
  void bildirim(String hata1, hata2) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[100],
            title: Text(hata1),
            content: Text(hata2),
            elevation: 20,
            actions: <Widget>[
              FlatButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.pop(context);

                },
              )
            ],
          );
        });
  }
}
