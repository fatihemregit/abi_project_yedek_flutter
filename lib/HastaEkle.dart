
import 'package:abi_project/HastaDao.dart';
import 'package:flutter/material.dart';

class HastaEkle extends StatefulWidget {
  const HastaEkle({Key? key}) : super(key: key);

  @override
  State<HastaEkle> createState() => _HastaEkleState();
}

class _HastaEkleState extends State<HastaEkle> {

  var tfIsim = TextEditingController();
  var tfTc = TextEditingController();
  var tfHastaNumarasi = TextEditingController();
  String islemAdi = "İşlem Seçmek İçin Tıkla";
  int islemTur = 0;

  void temizle(){
    tfTc.text = "";
    tfIsim.text = "";
    tfHastaNumarasi.text = "";
    islemAdi = "İşlem Seçmek İçin Tıkla";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hasta Ekleme Menüsü"),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Hasta İsim soyisim textfield
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfIsim,
                  decoration: InputDecoration(
                    label: Text("Hasta İsim Soyisim"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              //Hasta Tc textfield
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfTc,
                  decoration: InputDecoration(
                    label: Text("Hasta Tc"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              //Hasta No textfield
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfHastaNumarasi,
                  decoration: InputDecoration(
                    label: Text("Hasta No"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              //İşlem Seçtirme popup
              PopupMenuButton(
                child: Text(islemAdi),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("İşlem 1"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("İşlem 2"),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("İşlem 3"),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Text("İşlem 4"),
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: Text("İşlem 5"),
                  ),
                  PopupMenuItem(
                    value: 6,
                    child: Text("İşlem 6"),
                  ),
                  PopupMenuItem(
                    value: 7,
                    child: Text("İşlem 7"),
                  ),
                ],
                onSelected: (itemid){
                  if(itemid == 1){
                    islemAdi = "İşlem 1";
                    setState(() {
                    });
                    islemTur = 1;
                  }
                  if(itemid == 2){
                    islemAdi = "İşlem 2";
                    setState(() {
                    });
                    islemTur = 2;
                  }
                  if(itemid == 3){
                    islemAdi = "İşlem 3";
                    setState(() {
                    });
                    islemTur = 3;
                  }
                  if(itemid == 4){
                    islemAdi = "İşlem 4";
                    setState(() {
                    });
                    islemTur = 4;
                  }
                  if(itemid == 5){
                    islemAdi = "İşlem 5";
                    setState(() {
                    });
                    islemTur = 5;
                  }
                  if(itemid == 6){
                    islemAdi = "İşlem 6";
                    setState(() {
                    });
                    islemTur = 6;
                  }
                  if(itemid == 7){
                    islemAdi = "İşlem 7";
                    setState(() {
                    });
                    islemTur = 7;
                  }
                },
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Kaydet",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: (){
                      String tam_ad = tfIsim.text;
                      String tc = tfTc.text;
                      int hasta_no = int.parse(tfHastaNumarasi.text);
                      int islem_tur = islemTur;
                      HastaDao().hastaKayit(tam_ad, tc, hasta_no, islem_tur);
                      print("${tfIsim.text} Adlı ${tfTc.text} tc li ${tfHastaNumarasi.text} no lu ${islemAdi} li hasta kaydedildi ");
                      setState(() {
                        temizle();
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text("Temizle",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: (){
                      print("Temizlendi");
                      setState(() {
                        temizle();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
