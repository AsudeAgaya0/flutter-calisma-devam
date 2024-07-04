import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async{
    print("Kisi $aramaKelimesi");
  }

  Future<List<Kisiler>> kisileriYukle() async{
    var kisiListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "123");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_tel: "456");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Veli", kisi_tel: "789");

    kisiListesi.add(k1);
    kisiListesi.add(k2);
    kisiListesi.add(k3);

    return kisiListesi;
  }
  
  Future<void> sil(int kisi_id) async{
    print("Kişi sil : $kisi_id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
            TextField(decoration: InputDecoration(hintText: "Ara"),
            onChanged: (aramaSonucu){
              ara(aramaSonucu);
            },) : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu=false;
            });
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
        //performanslı şekilde arayüzde göstermek için future builder
      body: FutureBuilder<List<Kisiler>> (
        future: kisileriYukle(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var kisiListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisiListesi!.length,
              itemBuilder: (context, indeks){//kaç kişi  varsa aşağıdaki yapıyı o kadar çalıştıracak, indekslerle kişi listesini veriyor
                var kisi = kisiListesi[indeks];
                return GestureDetector( //card ın kendisinde dokunma özelliği olmadığından ekledik
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
                        .then((value){
                          print("Anasayfaya geri dönüldü");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad, style: TextStyle(fontSize: 20, color: Colors.green),),
                                Text(kisi.kisi_tel, style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${kisi.kisi_ad} silinsin mi?"),
                                action: SnackBarAction(label: "Evet", onPressed: (){
                                  sil(kisi.kisi_id);
                                }),
                              )
                            );

                          }, icon: Icon(Icons.clear), color: Colors.black54,),
                        ],
                      ),
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

      // ElevatedButton(onPressed: (){
      //   var kisi=Kisiler(kisi_id: 1, kisi_ad: "Asude", kisi_tel: "102938");
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi))).then((value) {print("Ana sayfaya dönüldü");});
      // }, child: Text("Detay"),
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
                .then((value) {
                  print("Sayfaya dönüldü");
            });
          },
      child: const Icon(Icons.add),
      ),
    );
  }
}
