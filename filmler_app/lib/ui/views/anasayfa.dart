import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Filmler>> filmleriYukle() async {
    var filmListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 10);
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 20);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 30);
    var f4 = Filmler(id: 4, ad: "The Hateful Eigth", resim: "thehatefuleight.png", fiyat: 40);
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 50);
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 60);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriYukle(),
        builder: (context, snapshot){ // snapshot bize verileri getirecek
          if(snapshot.hasData){
            var filmlerlistesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerlistesi!.length,//kaç tane film eklenmişse listeye onu verecek
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //bir satırda kaç tane nesne olacağını göstermek için
                crossAxisCount: 2,
                childAspectRatio: 1/1.8, //oranlama demek, yatay 1 ise yükseklik 1.8 olsun diyor
              ),
              itemBuilder: (context, indeks){//itemcount kadar çalışacak
                // 0 1 2 3 4 5
                var film = filmlerlistesi[indeks];
                return GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));},
                  child: Card(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${film.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${film.fiyat} ₺", style: TextStyle(fontSize: 24),),
                            ElevatedButton(onPressed: (){
                              print("${film.ad} sepete eklendi");
                            }, child: const Text("Sepet"))
                  
                          ],
                        )
                      ],
                    ),
                  ),
                );

              },
            );

          }else{
            return const Center();
          }

        },
      ),
    );
  }
}
