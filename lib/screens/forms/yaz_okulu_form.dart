import 'package:flutter/material.dart';

class YazOkuluForm extends StatefulWidget {
  const YazOkuluForm({Key? key}) : super(key: key);

  @override
  _YazOkuluFormState createState() => _YazOkuluFormState();
}

class _YazOkuluFormState extends State<YazOkuluForm> {


  int currentStep = 0;
  bool isCompleted = false;
  String tarih = DateTime.now().day.toString() + "/" +
      DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// Veritabanından gelecekler
 String bolum = "BILISIM SISTEMLERI MUHENDISLIGI";
 String fakulte = "TEKNOLOJI FAKULTESI";
 String numara = "NUMARA ALANI";
 String isim = "ISIM ALANI";
 String eMail = "Degisken Alan";
 String adres = "Degisken Alan";
 String gsm = "Degisken Alan";


 String danismanAdSoyad = "Degisken Alan";
 String basvuruUni = "Degisken Alan";
 String ogrDanismani = "Degisken Alan";
 String bolumBaskani = "Degisken Alan";

  // const String yazOkulTarihleri = "Degisken Alan";
  // const String dersadkod = "Degisken Alan";
  // const String dersadkod2 = "Degisken Alan";
  // const String T1 = "Degisken Alan";
  // const String U1 = "Degisken Alan";
  // const String L1 = "Degisken Alan";
  // const String AKTS1 = "Degisken Alan";


  // const String T2 = "Degisken Alan";
  // const String U2 = "Degisken Alan";
  // const String L2 = "Degisken Alan";
  // const String AKTS2 = "Degisken Alan";



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
              // tarih = DateTime.now().day.toString() + "/" +
              //     DateTime.now().month.toString() + "/" +
              //     DateTime.now().year.toString();
            });
            // Bütün veriler çekiliyor

            // print(_oncekiUni);
            // print(_oncekiFakulte);
            // print(_oncekiBolum);
            // print("$_oncekiAd1 - T : $o_teorik_ders1 - U/L: $o_uygulama_lab_ders1 - K: $o_kredi1");
            // print("$_oncekiAd2 - T : $o_teorik_ders2 - U/L: $o_uygulama_lab_ders2 - K: $o_kredi2");
            // print("$_oncekiAd3 - T : $o_teorik_ders3 - U/L: $o_uygulama_lab_ders3 - K: $o_kredi3");
            // print("$_oncekiAd4 - T : $o_teorik_ders4 - U/L: $o_uygulama_lab_ders4 - K: $o_kredi4");
            // print("$_oncekiAd5 - T : $o_teorik_ders5 - U/L: $o_uygulama_lab_ders5 - K: $o_kredi5");
            // print("$_oncekiAd6 - T : $o_teorik_ders6 - U/L: $o_uygulama_lab_ders6 - K: $o_kredi6");
            //
            // print("------------------------------------");
            //
            // print("$_suankiAd1 - T : $s_teorik_ders1 - U/L: $s_uygulama_lab_ders1 - K: $s_kredi1");
            // print("$_suankiAd2  - T : $s_teorik_ders2 - U/L: $s_uygulama_lab_ders2 - K: $s_kredi2");
            // print("$_suankiAd3  - T : $s_teorik_ders3 - U/L: $s_uygulama_lab_ders3 - K: $s_kredi3");
            // print("$_suankiAd4  - T : $s_teorik_ders4 - U/L: $s_uygulama_lab_ders4 - K: $s_kredi4");
            // print("$_suankiAd5  - T : $s_teorik_ders5 - U/L: $s_uygulama_lab_ders5 - K: $s_kredi5");
            // print("$_suankiAd6  - T : $s_teorik_ders6 - U/L: $s_uygulama_lab_ders6 - K: $s_kredi6");

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
