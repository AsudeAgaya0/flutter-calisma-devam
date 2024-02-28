import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:calisma_yapisi/kisiler.dart';

class OyunEkrani extends StatefulWidget {
  //bana gönderilmesini istediğim değişkenleri de burada tanımlıyorum ama tek tek yapmaktansa nesne tabanlı çalış
  // String ad;
  // int yas;
  // double boy;
  // bool bekar;
  //OyunEkrani({required this.ad, required this.yas, required this.boy, required this.bekar});

  Kisiler kisi;
  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}
//üst sınıfın değişkenlerine alt sınıftan widget keyword u ile erişebiliyoruz
class _OyunEkraniState extends State<OyunEkrani> {

  // Future<bool> geriDonusTusu(BuildContext context) async{
  //   print("Navigation geri tuşu seçildi");
  //   return false;//böylece telefonun kendi geri dönme tuşuna basınca geri dönmeyecek, fakat şöyle bir durum var ki aşağıda willpopscope yerine artık popscope kullanıldığı için benim buraya yazdım true ve false dan ziyade canPop çalışıyor, console ekranında bu fonksiyonunda çalıştığını görüyorum yine de
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oyun Ekranı"),
        leading: IconButton(onPressed: (){
          print("Appbar geri tuşu seçildi");
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new)),

      ) ,
      body: PopScope( //WillPopScope yerine kullanılıyor artık, amacı: sistemin bask gesture(geri hareketlerini) i yönetir
        canPop: true, //geri hareketleri devre dışı bırakmak için kullanılır, true ise geri hareketler her zamanki gibi çalışır
        onPopInvoked: (didPop){ //onPopInvoked: başarılı olsun veya olmasın geri hareketlerin çalıştığında rapor verir, didPop:
          //geriDonusTusu(context);
          print("popScope çalıştı");
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}", style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SonucEkrani()));//push olunca sonraki sayfaya gidiyor ve kendini backstack ten silmiyor ama pushReplacement deyince kendini backstack ten siliyor. böylece sonraki sayfadan geri dönünce oyun ekraına uğramadan bir önceki sayfaya dönecek
              }, child: const Text("Bitti")),
            ],
          ),
        ),
      ),
    );
  }
}
