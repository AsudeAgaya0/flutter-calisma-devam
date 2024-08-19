import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    //uygulama yüklenir yüklenmez görmek istediğim için buraya ekledim
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: BlocBuilder<AnasayfaCubit, List<Filmler>>(
        //cubit içinden emit edileni dinlemek için blocbuilder kullanıldı
        //hangi cubitten veri geleceği ve tipinin ne olacağı eklenir
        builder: (context, filmlerListesi) {
          // snapshot bize verileri getirecek
          if (filmlerListesi.isNotEmpty) {
            return GridView.builder(
              itemCount: filmlerListesi
                  .length, //kaç tane film eklenmişse listeye onu verecek
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //bir satırda kaç tane nesne olacağını göstermek için
                crossAxisCount: 2,
                childAspectRatio: 1 /
                    1.8, //oranlama demek, yatay 1 ise yükseklik 1.8 olsun diyor
              ),
              itemBuilder: (context, indeks) {
                //itemcount kadar çalışacak
                // 0 1 2 3 4 5
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${film.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${film.fiyat} ₺",
                              style: TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print("${film.ad} sepete eklendi");
                                },
                                child: const Text("Sepet"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
