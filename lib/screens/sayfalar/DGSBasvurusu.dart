import 'package:flutter/material.dart';
import 'package:kou_basvuru_platform/models/user_Model.dart';
import 'package:kou_basvuru_platform/widget/social_login_button.dart';
import 'package:provider/provider.dart';
class DGSBasvuru extends StatefulWidget {
  const DGSBasvuru({Key? key}) : super(key: key);

  @override
  _DGSBasvuruState createState() => _DGSBasvuruState();
}

class _DGSBasvuruState extends State<DGSBasvuru> with TickerProviderStateMixin {



  // region DGS FORM için gerekli bileşenler

  int currentStep = 0;
  bool isCompleted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? universite = "KOCAELI UNIVERSITESI";    // yes
  String? fakulte = "TEKNOLOJI FAKULTESI";        // yes
  String? bolum = "BILSIM SISTEMLERI MUHENDISLIGI"; // yes
  String? f_ogrNo = "191307000";  // yes
  String? tarih = "TARIH DEGISKENI";      // Sistem otomatik yapıcak
  String? adSoyad = "Ad - Soyad"; // yes
  String? f_adres = "ADRES PARAMETRESI"; // yes
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
              Text('Öğrenci Numarası : $f_ogrNo',
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
              Text('Adres : $f_adres',
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


  // endregion


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
          appBar: AppBar(title: Text("DGS Başvuru"),
            backgroundColor: Colors.green,
            //centerTitle: true,
           // actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Çıkış",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))],
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
      // yakup abi barış abi
      // return Scaffold();

      // region DGS FORM - Build Widget


      return Scaffold(
          // appBar: AppBar(title: Text('Dikey Geçiş Başvuru Form'), centerTitle: true),
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
                  print('Tamamlandı!');

                  // İlgili verileri sunucuya gönder
                  // Firebase kodları vs.

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

      // endregion


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
