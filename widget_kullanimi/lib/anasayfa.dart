import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  //veri okumak istediğim yapıyı oluşturuyorum
  var tfController = TextEditingController();
  String alinanVeri = "";
  String resimAdi = "baklava.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),) ,
      body: Center(
        child: Column(
          children: [
            Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController, //bunun sayesinde verileri okuyacağız
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number, //böylece kullanıcı açtığında sayılardan oluşan bir klavye ile  karşılaşacak
                obscureText: true, //şifre girer gibi text i gizler
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                alinanVeri = tfController.text;
              });
            }, child: const Text("Veriyi Al")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "ayran.png";
                  });
                }, child: const Text("Resim 1")),
                //Image.asset("resimler/${resimAdi}"), //localden resim almak içindi
                SizedBox(
                  width: 48,
                    height: 48,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "kofte.png";
                  });
                }, child: const Text("Resim 2")),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
