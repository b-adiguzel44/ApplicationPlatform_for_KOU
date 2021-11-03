import 'package:flutter/material.dart';

class DgsForm extends StatefulWidget {
  const DgsForm({Key? key}) : super(key: key);

  @override
  _DgsFormState createState() => _DgsFormState();
}

class _DgsFormState extends State<DgsForm> {


  int currentStep = 0;
  bool isCompleted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? universite = "KOCAELI UNIVERSITESI";    // yes
  String? fakulte = "TEKNOLOJI FAKULTESI";        // yes
  String? bolum = "BILSIM SISTEMLERI MUHENDISLIGI"; // yes
  String? ogrNo = "191307000";  // yes
  String? tarih = "TARIH DEGISKENI";      // Sistem otomatik yapıcak
  String? adSoyad = "Ad - Soyad"; // yes
  String? adres = "ADRES PARAMETRESI"; // yes
  String? gsm = "TELEFON NUMARASI"; // yes






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
      Text('Üniversite : $universite',
          style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(height: 5),
      Text('Fakülte : $fakulte',
          style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(height: 5),
      Text('Bölüm : $bolum',
          style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(height: 5),
      Text('Telefon(GSM) : $gsm',
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
        title : Text('Tamamlandı'),
        content: Container()
    ),
  ];

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dikey Geçiş Başvuru Form'), centerTitle: true),
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
              tarih = DateTime.now().day.toString() + "/" +
                  DateTime.now().month.toString() + "/" +
                  DateTime.now().year.toString();
            });
            // Bütün veriler çekiliyor
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

      )
    );
  }
}
