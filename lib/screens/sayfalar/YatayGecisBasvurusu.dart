// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/screens/home/home.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';

class YatayGecisBasvuru extends StatefulWidget {
  const YatayGecisBasvuru({Key? key}) : super(key: key);

  @override
  _YatayGecisBasvuruState createState() => _YatayGecisBasvuruState();
}

class _YatayGecisBasvuruState extends State<YatayGecisBasvuru>
    with TickerProviderStateMixin {
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


  // region Yatay Geçiş Form Bileşenler


  // Stepper widget'ı
  int suankiStep = 0;

  String tarih = DateTime.now().day.toString() +
      "/" +
      DateTime.now().month.toString() +
      "/" +
      DateTime.now().year.toString();


  // Kişisel Bilgiler
  String? name = "AHMET";
  String? surname = "YILDIZ";
  String? tc_no = "21312312312";
  String? email = "abchwk@gmail.com";
  String? phone_number = "598278223";
  String? adress = "adres adress adress";
  String? birthdate = "12/08/2000";
  String? work_phone_number = "2737328772";

  // Öğrenime İlişkin Bilgiler
  String? university = "Kocaeli Üniversitesi";
  String? faculty = "<HERHANGİ BİR FAKÜLTE> Fakültesi";
  String? department = "<HERHANGİ BİR BÖLÜM> Bölümü";
  String? school_number = "181307059";
  String? _not_ortalamasi; // TextField
  String? _yerlestirme_puani; // TextField
  String? _yabanci_dil_puani; // TextField

  //region TextFormField Widgets
  Widget _buildNotOrtalamasi() {
    return TextFormField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Not Ortalamanız'),
      validator: (String? value) {
        // double? gpa = double.tryParse(value);

        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }

        // if(gpa != null && (gpa >= 4.00 || gpa <= 0.0)) {
        //   return "0-4 arası değer giriniz";
        // }

        if (value != null && value.length > 4) {
          return "Daha fazla karakter girilemez";
        }

        return null;
      },
      onSaved: (String? value) {
        setState(() => _not_ortalamasi = value);
      },
      onChanged: (String? value) {
        setState(() => _not_ortalamasi = value);
      },
    );
  }

  Widget _buildYerlestirmePuani() {
    return TextFormField(
      maxLength: 5,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Yerleştirme Puanınız'),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Boş geçilemez';
        }

        return null;
      },
      onSaved: (String? value) {
        setState(() => _yerlestirme_puani = value);
      },
      onChanged: (String? value) {
        setState(() => _yerlestirme_puani = value);
      },
    );
  }

  Widget _buildYabanciDilPuani() {
    return TextFormField(
      maxLength: 5,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Yabancı Dil Puanınız'),
      validator: (String? value) {
        return null;
      },
      onSaved: (String? value) {
        setState(() => _yabanci_dil_puani = value);
      },
      onChanged: (String? value) {
        setState(() => _yabanci_dil_puani = value);
      },
    );
  }
  //endregion

  //region DropDownMenu Items
  final kayit_yillari = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021"
  ];
  final ogretim_turleri = ["I. Öğretim", "II. Öğretim"];
  final basvuru_turleri = [
    "Kurum İçi Yatay Geçiş Başvurusu",
    "Kurumlar Arası Yatay Geçiş Başvurusu",
    "Merkezi Yerleştirme Puanıyla Yatay Geçiş Başvurusu",
    "Yurt Dışı Yatay Geçiş Başvurusu"
  ];
  final puan_turleri = ["TYT", "SÖZ", "SAY", "EA", "DİL"];
  final yabanci_diller = [
    "Yok",
    "İngilizce",
    "Fransızca",
    "Almanca",
    "Rusça",
    "Arapça"
  ];
  final yariyillar = [
    "Hazırlık",
    "1. Yarıyıl",
    "2. Yarıyıl",
    "3. Yarıyıl",
    "4. Yarıyıl",
    "5. Yarıyıl",
    "6. Yarıyıl",
    "7. Yarıyıl",
    "8. Yarıyıl",
  ];

  // DropDownMenu Selected Value Variables
  String? kayit_yili;
  String? ogretim_turu;
  String? basvuru_turu;
  String? puan_turu;
  String? yabanci_dil;
  String? yariyil;

  //endregion

  // DropDownButton widget'i için eleman oluşturma
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  //region Step Bölümler
  List<Step> createSteps() => [
    Step(
      state: suankiStep > 0 ? StepState.complete : StepState.indexed,
      isActive: suankiStep >= 0,
      title: Text('Başvuru Türü'),
      content: DropdownButton(
        hint: Text('Başvuru türünüz: '),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 30,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 15),
        value: basvuru_turu,
        onChanged: (String? value) {
          setState(() {
            basvuru_turu = value!;
          });
        },
        items: basvuru_turleri.map(buildMenuItem).toList(),
      ),
    ),
    Step(
        state: suankiStep > 1 ? StepState.complete : StepState.indexed,
        isActive: suankiStep >= 1,
        title: Text('Kişisel Bilgiler'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'AD : $name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              'SOYAD : $surname',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text('TC Kimlik Numarası : $tc_no',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('E-Posta Adresi : $email',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('Telefon(GSM) : $phone_number',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('Adres : $adress',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('Doğum Tarihi : $birthdate',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('Telefon(EV/İŞ) : $work_phone_number',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        )),
    Step(
        state: suankiStep > 2 ? StepState.complete : StepState.indexed,
        isActive: suankiStep >= 2,
        title: Text('Öğrenime İlişkin Bilgiler'),
        content: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Kayıtlı olunan üniversite: $university',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Fakülte: $faculty',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Bölüm: $department',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Okul Numarası: $school_number',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("Öğretim Türü")),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      hint: Text('Öğretim türünüz'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      value: ogretim_turu,
                      onChanged: (String? value) {
                        setState(() {
                          ogretim_turu = value!;
                        });
                      },
                      items: ogretim_turleri.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("Yarıyıl")),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      hint: Text('Yarıyıl'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      value: yariyil,
                      onChanged: (String? value) {
                        setState(() {
                          yariyil = value!;
                        });
                      },
                      items: yariyillar.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("Yerleştirildiğiniz Yıl")),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      hint: Text('Yıl'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      value: kayit_yili,
                      onChanged: (String? value) {
                        setState(() {
                          kayit_yili = value!;
                        });
                      },
                      items: kayit_yillari.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildNotOrtalamasi(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Text("Kayıtlı Olduğunuz Programın Puan Türü")),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      hint: Text('Puan Türü'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      value: puan_turu,
                      onChanged: (String? value) {
                        setState(() {
                          puan_turu = value!;
                        });
                      },
                      items: puan_turleri.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildYerlestirmePuani(),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: Text("Yabancu Dil Sınav Türü")),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      hint: Text('Sınav Türü'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 15,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      value: yabanci_dil,
                      onChanged: (String? value) {
                        setState(() {
                          yabanci_dil = value!;
                        });
                      },
                      items: yabanci_diller.map(buildMenuItem).toList(),
                    ),
                  ),
                ],
              ),
              _buildYabanciDilPuani()
            ],
          ),
        )),
    Step(
        state: suankiStep > 3 ? StepState.complete : StepState.indexed,
        isActive: suankiStep >= 3,
        title: Text('Tamamlandı'),
        content: Column(
          children: <Widget>[],
        ))
  ];

  //endregion

  //endregion






  @override
  Widget build(BuildContext context) {




    userModel _userModel = Provider.of<userModel>(context);
    ad = _userModel.user.ad;
    soyad = _userModel.user.soyad;
    adres = _userModel.user.adres;
    mail = _userModel.user.mail;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Yatay Geçiş Başvuru"),
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
    int currentStep = 0;
    bool isCompleted = false;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

      // yakup abi barış abi
      // return Scaffold();

      // TODO : TextFieldlar çalışmıyor (keyboard özelliği nümerik olduğu için olabilir)(Klayvede bir yere tıklayınca kapanıyor)
      //region Yatay Geçiş Başvurusu Build Widget

      return Scaffold(
          body: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.green)
            ),
            child: Stepper(
              key: _formKey,
              type: StepperType.vertical,
              steps: createSteps(),
              currentStep: suankiStep,
              onStepContinue: () {
                final isLastStep = suankiStep == createSteps().length - 1;

                // Son kısma geldiysek
                if (isLastStep) {
                  // setState(() => isCompleted = true);

                  // İlgili verileri sunucuya gönder
                  // Firebase kodları vs.


                }
                // Son kısımda değilse ilerlemeye devam et
                else {
                  setState(() => suankiStep += 1);
                }
              },
              onStepTapped: (step) => setState(() => suankiStep = step),
              onStepCancel:
              // Eğer en başta isek "Cancel" tuşunu deaktif yap (null dönecek)
              // Öbür türlü devam et
              suankiStep == 0 ? null : () => setState(() => suankiStep -= 1),
              controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                final isLastStep = suankiStep == createSteps().length - 1;

                return Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? "TAMAMLA" : "DEVAM"),
                            onPressed: onStepContinue,
                          )),
                      const SizedBox(width: 12),
                      if (suankiStep != 0)
                        Expanded(
                            child: ElevatedButton(
                              child: Text("İPTAL"),
                              onPressed: onStepCancel,
                            ))
                    ],
                  ),
                );
              },
            ),
          )
      );

      //endregion



    } else if (s == "Belgeler") {

      List<Step> getSteps() =>
          [Step(title: Text('Dilekçe1'), content: Container())];

      return Scaffold(
          body: Container(
              margin: const EdgeInsets.all(24),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  setState(() {
                    currentStep += 1;
                  });
                },
              )));
    } else {
      List<Step> getSteps() => [
            Step(isActive: currentStep >= 0,
                title: Text('Dilekçe1'), content: Container()),
            Step(isActive: currentStep >= 1,
                title: Text('Dilekçe2'), content: Container()),
            Step(isActive: currentStep >= 2,
                title: Text('Dilekçe3'), content: Container())
          ];

      return Scaffold(
          body: Container(
              margin: const EdgeInsets.all(24),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  setState(() {
                    currentStep += 1;
                  });
                },
              )));
    }
  }
}
