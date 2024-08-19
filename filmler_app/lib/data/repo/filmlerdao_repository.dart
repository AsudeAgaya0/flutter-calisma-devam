import 'package:filmler_app/data/entity/filmler.dart';

//veritabanı kodları bu sayfada yer alacak
//dao: Database Access Object: veritabanı erişim nesnesi
class FilmlerDaoRepository {
  Future<List<Filmler>> filmleriYukle() async {
    var filmListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 10);
    var f2 = Filmler(
        id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 20);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 30);
    var f4 = Filmler(
        id: 4,
        ad: "The Hateful Eigth",
        resim: "thehatefuleight.png",
        fiyat: 40);
    var f5 =
        Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 50);
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 60);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }
}
