import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int sayac = 0;
  bool kontrol = false;

  @override
  void initState() { //sayfa ilk açıldığında çalışır, ön kodları veya kurulum kodları burada yazılabilir çünkü başta bir kere çalışır bir daha çalışmaz. ara yüzle ilgili güncelleme varsa build içine yazılır
    super.initState();
    print("initState() çalıştı");
  }

  Future<int> toplama(int sayi1, int sayi2) async{
    int toplam = sayi1 + sayi2;
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa") ,) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç: ${sayac}"),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac++;
              });
            }, child: const Text("Tıkla")),
            ElevatedButton(onPressed: (){
              var kisi1 = Kisiler(ad: "Asude", yas: 25, boy: 1.79, bekar: true);
              // butona tıklandığında yönlendireceği sayfayı vermiş olduk, içine veri göndermeyeceğimiz herhangi bir veri katarımı olmayacağı zaman const ekledik
              Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(kisi: kisi1)));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(kisi: kisi1)))
              //     .then((value) { //böylece bu sayfaya geri dönülüp dönülmediğini anlamış oluyoruz
              //   print("Anasayfaya dönüldü");////////////bunu kontrol et çünkü oyun ekranında bitti ye tıklanınca da yazıyor?????????????
              // });
            }, child: const Text("Başla")),
            Visibility(visible: kontrol, child: Text("Merhaba")),
            Text(kontrol ? "Merhaba" : "Güle Güle" , style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),
            ((){
              if(kontrol){
                return const Text("Merhaba", style: TextStyle(color: Colors.green),);
              }else{
                return const Text("Güle Güle", style: TextStyle(color: Colors.amber),);
              }
            }()),
            ElevatedButton(onPressed: (){
              setState(() {
                kontrol = true;
              });
            }, child: const Text("Durum 1 True")),
            ElevatedButton(onPressed: (){
              setState(() {
                kontrol = false;
              });
            }, child: const Text("Durum 2 False")),
            FutureBuilder<int>( //arayüze veri aktarırken bu yapıyı kullanıyoruz
                future: toplama(10, 20), 
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return const Text("Hata oluştu");
                  }
                  if(snapshot.hasData){
                    return Text("Sonuç: ${snapshot.data}");
                  }else{
                    return const Text("Sonuç yok");
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
