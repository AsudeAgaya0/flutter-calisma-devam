import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> kaydet(String kisi_adi, String kisi_tel) async{
    print("Kişi bilgileri ${kisi_adi} $kisi_tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi, decoration: const InputDecoration(hintText: "Kişi ad"),),
              TextField(
                controller: tfKisiTel,
                decoration: const InputDecoration(hintText: "Kişi tel"),
                keyboardType: TextInputType.number,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.digitsOnly
                // ],//yalnızca sayı girebilmesi için
              ),
              ElevatedButton(onPressed: (){
                kaydet(tfKisiAdi.text, tfKisiTel.text);
              }, child: const Text("Kaydet")),

            ],
          ),
        ),
      ),
    );
  }
}
