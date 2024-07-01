import 'dart:math';

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
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    //veri alacağın zaman buraya yaz, veri tabanından vb.
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("Japonya");
    ulkelerListesi.add("Hindistan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfController,//bunun sayesinde verileri okuyacağız
                  decoration: const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,//böylece kullanıcı açtığında sayılardan oluşan bir klavye ile  karşılaşacak
                  obscureText: true, //şifre girer gibi text i gizler
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfController.text;
                    });
                  },
                  child: const Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "ayran.png";
                        });
                      },
                      child: const Text("Resim 1")),
                  //Image.asset("resimler/${resimAdi}"), //localden resim almak içindi
                  SizedBox(
                      width: 48,
                      height: 48,
                      child: Image.network(
                          "http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "kofte.png";
                        });
                      },
                      child: const Text("Resim 2")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: SwitchListTile(
                        title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,//ikon solda dursun dedik
                        value: switchKontrol,
                        onChanged: (veri) {
                          setState(() {
                            switchKontrol = veri;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    child: CheckboxListTile(
                        title: const Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (veri) {
                          setState(() {
                            checkboxKontrol = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: RadioListTile(
                        title: const Text(
                          "Barcelona",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (veri) {
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 180,
                    child: RadioListTile(
                        title: const Text(
                          "Real Madrid",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (veri) {
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = true;
                        });
                      },
                      child: const Text("Başla")),
                  Visibility(
                      visible: progressKontrol,
                      child: const CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = false;
                        });
                      },
                      child: const Text("Dur")),
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(
                  max: 100.0,
                  min: 0.0,
                  value: ilerleme,
                  onChanged: (veri) {
                    setState(() {
                      ilerleme = veri;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now())) //sistemin o anki saatini verecek
                            .then((value) {
                          tfSaat.text = "${value!.hour} : ${value!.minute}";
                        });
                      },
                      icon: const Icon(Icons.access_time)),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(hintText: "Tarih"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050))
                            .then((value) {
                          tfTarih.text =
                              "${value!.day}.${value.month}.${value.year}";
                        });
                      },
                      icon: const Icon(Icons.date_range)),
                ],
              ),
              DropdownButton(
                  value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke) {//bu şekilde yazınca tüm ülkeleri altta gösterecek, Dropdownmenuitem deseydi bir tanesini gösterecekti. map le listeyi sırayla getirmiş oldu
                    return DropdownMenuItem(
                      value: ulke,
                      child: Text(ulke),
                    );
                  }).toList(),
                  onChanged: (veri) {
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }),
              GestureDetector( //bu yapı dokunma hareketlerini algılıyor
                  onTap: () {
                    print("Tek tıklandı");
                  },
                  onDoubleTap: () {
                    print("Çift tıklandı");
                  },
                  onLongPress: (){
                    print("Uzun tıklandı");
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blueAccent,
                  )),
        
        
        
        
        
              ElevatedButton(
                  onPressed: () {
                    print("Switch durum: $switchKontrol");
                    print("Checkbox durum: $checkboxKontrol");
                    print("Radio durum: $radioDeger");
                    print("Slider durum: $ilerleme");
                  },
                  child: const Text("Göster")),
            ],
          ),
        ),
      ),
    );
  }
}
