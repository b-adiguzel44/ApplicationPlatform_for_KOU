import 'package:flutter/material.dart';

class CapForm extends StatefulWidget {
  const CapForm({Key? key}) : super(key: key);

  @override
  _CapFormState createState() => _CapFormState();
}

class _CapFormState extends State<CapForm> {


  int currentStep = 0;
  bool isCompleted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Veritabanından gelecekler
  String suanki_fakulte = "TEKNOLOJI FAKULTESI";      //
  String suanki_bolum = "BILSIM SISTEMLERI MUHENDISLIGI";   //
  String program = "LISANS ";   //
  String suanki_ogrTur = "1.OGRETIM "; //
  String ogrNo = "191307000";  //
  String adSoyad = "Ad - Soyad";  //

  // PDF'te gözüküyor formda değil
  String cepTel = "213132211";  //
  String eposta = "test@test.com";    //
  String adres = "adres adres"; //

  String tarih = DateTime.now().day.toString() + "/" +
      DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();





  String? cap_fakulte;
  String? cap_bolum;
  String? cap_ogrTur;


  // Bu kısmın veritabanından gelmesi gerekiyor
  final fakulteler = [
    "Fakülte 1",
    "Fakülte 2",
    "Fakülte 3",
    "Fakülte 4",
    "Fakülte 5"
  ];

  // Bu kısmın seçilen fakültenin bölümüne göre gelmesi gerekiyor
  final bolumler = [
    "Bölüm 1",
    "Bölüm 2",
    "Bölüm 3",
    "Bölüm 4",
    "Bölüm 5",
  ];


  final ogrTurleri = [
    "I. Öğretim",
    "II. Öğretim",
  ];


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
              Text('Öğrenci Numarası : $ogrNo',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Fakülte : $suanki_fakulte',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Bölüm : $suanki_bolum',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Program Türü : $program',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('Öğretim Türü : $suanki_ogrTur',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ]
        )
    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title : Text('ÇAP yapılacak Eğitim Bilgileri'),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButton(
                hint: Text('Fakülte seçiniz: '),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                    color : Colors.black,
                    fontSize: 15
                ),
                value: cap_fakulte,
                onChanged: (String? value) {
                  setState(() {
                    cap_fakulte = value!;
                  });
                },
                items: fakulteler.map(buildMenuItem).toList(),
              ),
              SizedBox(height: 5),
              DropdownButton(
                hint: Text('Bölüm: '),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                    color : Colors.black,
                    fontSize: 15
                ),
                value: cap_bolum,
                onChanged: (String? value) {
                  setState(() {
                    cap_bolum = value!;
                  });
                },
                items: bolumler.map(buildMenuItem).toList(),
              ),
              SizedBox(height: 5),
              DropdownButton(
                hint: Text('Öğretim Türü: '),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                    color : Colors.black,
                    fontSize: 15
                ),
                value: cap_ogrTur,
                onChanged: (String? value) {
                  setState(() {
                    cap_ogrTur = value!;
                  });
                },
                items: ogrTurleri.map(buildMenuItem).toList(),
              ),


              ]
        )

    ),
    Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title : Text('Tamamlandı'),
        content: Container()
    ),
  ];

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('ÇAP Başvuru Form'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(24),
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
              print('Tamamlandı!');
              print(cap_ogrTur);
              print(cap_fakulte);
              print(cap_bolum);
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

        )
      ),
    );
  }
}
