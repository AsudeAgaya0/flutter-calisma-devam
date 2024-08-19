import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  //sayfama hangi türde geri dönüş yapılmasını istiyorsam o türde yazıyorum
  AnasayfaCubit()
      : super(
            <Filmler>[]); //super içi cubit türüyle aynı olmalı, eğer arayüze veri gönderilmeyecekse void tanımlaması yapılıp super(0) yazılabilir, 0'ın herhangi bir etkisi olmayacak

  var frepo = FilmlerDaoRepository();

  Future<void> filmleriYukle() async {
    var liste = await frepo.filmleriYukle();
    emit(
        liste); //emit:tetiklemek(onu dinleyen bir yer varsa tetiklemek için),anasayfaya veri göndermek için kullanıyoruz, kullanacağımız yerde de onu dinliyoruz
  }
}
