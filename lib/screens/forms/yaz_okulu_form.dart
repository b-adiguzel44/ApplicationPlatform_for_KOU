import 'dart:async';

import 'package:flutter/material.dart';

class YazOkuluForm extends StatefulWidget {
  const YazOkuluForm({Key? key}) : super(key: key);

  @override
  _YazOkuluFormState createState() => _YazOkuluFormState();
}

class _YazOkuluFormState extends State<YazOkuluForm> {

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
  String adres = "ADRES ALAN";
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
              Text('Adres : $adres',
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Yaz Okulu Başvuru Form'), centerTitle: true),
        body: Stepper(
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

              // Bütün veriler çekiliyor

              print("\n\n --- KİŞİSEL BİLGİLER ----");
              print("AD SOYAD = $isim");
              print("OKUL NO = $numara");
              print("FAKÜLTE = $fakulte");
              print("BÖLÜM = $bolum");
              print("GSM NO = $gsm");
              print("E-MAİL = $eMail");
              print("ADRES = $adres");
              print("\n\n --- KİŞİSEL BİLGİLER ----");

              print("\n\n --- YAZ OKULU BİLGİLERİ ----");
              print(_bolumBaskani);
              print(_ogrDanismani);
              print(_basvuruUni);

              if(firstDate != null) {
                print("BAŞLANGIÇ : ${firstDate!.day}/${firstDate!.month}/${firstDate!.year}");
              }
              if(lastDate != null) {
                print("BİTİŞ : ${lastDate!.day}/${lastDate!.month}/${lastDate!.year}");
              }

              print("\n\n --- YAZ OKULU BİLGİLERİ ----");

              print("\n\n---KOÜ DERSLER--------");
              print(_kou_ders_ad_kod1);
              print("T : $k_teorik_ders1 - U: $k_uygulama_ders1 - L: $k_lab_ders1 - K: $k_kredi1");

              print(_kou_ders_ad_kod2);
              print("T : $k_teorik_ders2 - U: $k_uygulama_ders2 - L: $k_lab_ders2 - K: $k_kredi2");

              print(_kou_ders_ad_kod3);
              print("T : $k_teorik_ders3 - U: $k_uygulama_ders3 - L: $k_lab_ders3 - K: $k_kredi3");

              print("\n\n---KOÜ DERSLER--------");

              print("\n\n---YAZ OKULU DERSLER--------");
              print(_yaz_ders_ad_kod1);
              print("T : $y_teorik_ders1 - U: $y_uygulama_ders1 - L: $y_lab_ders1 - K: $y_kredi1");

              print(_yaz_ders_ad_kod2);
              print("T : $y_teorik_ders2 - U: $y_uygulama_ders2 - L: $y_lab_ders2 - K: $y_kredi2");

              print(_yaz_ders_ad_kod3);
              print("T : $y_teorik_ders3 - U: $y_uygulama_ders3 - L: $y_lab_ders3 - K: $y_kredi3");


              print("\n\n---YAZ OKULU DERSLER--------");

              print('Tamamlandı!');


              // print(tarih);

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

        )
    );
  }


}
