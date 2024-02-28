import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {

  var tfControl = TextEditingController();//herhaangi bir yerden veri okumamızı sağlıyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kullanıcı Etkileşimi"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek istiyor musunuz?"),
                  action: SnackBarAction(label: "Evet", onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text("Silindi")),
                    );
                  }),
                ),
              );
            }, child: Text("Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek istiyor musunuz?", style: TextStyle(color: Colors.blue),),
                  backgroundColor: Color(0xFFDBCEF6),
                  action: SnackBarAction(label: "Evet", textColor: Colors.red , onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: const Text("Silindi", style: TextStyle(color: Colors.white),),
                          backgroundColor: Color(0xFFDBCEF6),
                      ),
                    );
                  }),
                ),
              );
            }, child: Text("Snackbar (Özelleştirilmiş)")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Başlık"),
                      content: const Text("İçerik"),
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal çalıştı.");
                          Navigator.pop(context);//geri tuşunu çalıştırmış oluyor, böylece hiçbir şey yapmadan geri gitmiş olacak
                        }, child: const Text("İptal")),
                        TextButton(onPressed: (){
                          print("Tamam çalıştı.");
                        }, child: const Text("Tamam")),
                      ],
                    );
                  },
              );

            }, child: Text("Alert")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                return AlertDialog(
                  title: const Text("Kayıt İşlemi"),
                  content: TextField (
                    controller: tfControl,
                    decoration: InputDecoration(hintText: "Veri"),
                  ),
                  backgroundColor: Colors.grey,
                  actions: [
                    TextButton(onPressed: (){
                      print("İptal çalıştı.");
                      Navigator.pop(context);//geri tuşunu çalıştırmış oluyor, böylece hiçbir şey yapmadan geri gitmiş olacak
                    }, child: const Text("İptal",style: TextStyle(color: Colors.black))),
                    TextButton(onPressed: (){
                      print("Alınan veri ${tfControl.text}.");
                      Navigator.pop(context);
                      tfControl.text="";
                    }, child: const Text("Kaydet")),
                  ],
                );
              },
              );
            }, child: Text("Alert (Özelleştirilmiş)")),
          ],
        )
      ),
    );
  }
}
