import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namoz_vaqtlari/models/namoz_time_model.dart';
import 'package:namoz_vaqtlari/widgets/RamadanTimeCard.dart';
import 'package:namoz_vaqtlari/widgets/duo_card.dart';
import 'package:namoz_vaqtlari/widgets/time_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isFavoritesSelected = true;

  late NamozTimeModel model;

  late Times currentTime;


  final List<String> viloyatlar = [
    'Toshkent',
    'Andijon',
    'Buxoro',
    'Jizzax',
    'Qashqadaryo',
    'Navoiy',
    'Namangan',
    'Qoraqalpog\'iston Respublikasi',
    'Samarqand',
    'Surxondaryo',
    'Sirdaryo',
    'Farg\'ona',
    'Xorazm',
  ];

  String? tanlanganViloyat = "Toshkent";

  //bu funksiya json file dagi ma'lumotni NamozModel ga o'girib beryabdi
  Future<void> getDataFromJson(String path) async {
    String data = await rootBundle.loadString(path);
    var list = jsonDecode(data);
    model = NamozTimeModel.fromJson(list);
    var ll = model.timesList;
    ll!.removeLast();
    model = NamozTimeModel(timesList: ll);
    print(model.timesList!);
  }

  //ayni damdagi namoz vaqtini aniqlab beryabdi
  Times? getCurrentTimes(int day) {
    for (Times data in model.timesList!) {
      print("$day ${data.kun}");
      if (data.kun == day.toString()) {
        print("ISHLADI ");
        var times = data!;
        print(times);
        return times;
      }
    }
    return null;
  }

  //ayni damdagi kun yordamida bizga Hafta kunini qaytaryabdi
  String getWeekdays(int id) {
    switch (id) {
      case 1:
        {
          return "Dushanba";
        }
      case 2:
        {
          return "Seshanba";
        }
      case 3:
        {
          return "Chorshanba";
        }
      case 4:
        {
          return "Payshanba";
        }
      case 5:
        {
          return "Juma";
        }
      case 6:
        {
          return "Shanba";
        }
      case 7:
        {
          return "Yakshanba";
        }
    }
    return "";
  }

  //ayni damdagi kun yordamida oyni qaytaryabdu
  String getMonth(int id) {
    switch (id) {
      case 1:
        {
          return "Yanvar";
        }
      case 2:
        {
          return "Fevral";
        }
      case 3:
        {
          return "Mart";
        }
      case 4:
        {
          return "Aprel";
        }
      case 5:
        {
          return "May";
        }
      case 6:
        {
          return "Iyun";
        }
      case 7:
        {
          return "Iyul";
        }
      case 8:
        {
          return "Avgust";
        }
      case 9:
        {
          return "Sentabr";
        }
      case 10:
        {
          return "Oktabr";
        }

      case 11:
        {
          return "Noyabr";
        }
      case 12:
        {
          return "Dekabr";
        }
    }
    return "";
  }

  var check = false;

  @override
  void initState() {
    super.initState();
    var path = "";
    switch (tanlanganViloyat) {
      case 'Toshkent':
        path = "assets/json/toshkent.json";
        break;
      case 'Andijon':
        path = "assets/json/andijon.json";
        break;
      case 'Buxoro':
        path = "assets/json/buxoro.json";
        break;
      case 'Jizzax':
        path = "assets/json/jizzax.json";
        break;
      case 'Qashqadaryo':
        path = "assets/json/qarshi.json";
        break;
      case 'Navoiy':
        path = "assets/json/navoiy.json";
        break;
      case 'Namangan':
        path = "assets/json/namangan.json";
        break;
      case 'Qoraqalpog\'iston Respublikasi':
        path = "assets/json/nukus.json";
        break;
      case 'Samarqand':
        path = "assets/json/samarqand.json";
        break;
      case 'Surxondaryo':
        path = "assets/json/surxandaryo.json";
        break;
      case 'Sirdaryo':
        path = "assets/json/qashqadaryo.json";
        break;
      case 'Farg\'ona':
        path = "assets/json/fargona.json";
        break;
      case 'Xorazm':
        path = "assets/json/xorazm.json";
        break;
      default:
        print('Noma\'lum viloyat.');
    }
    getDataFromJson(path).then((_) {
      setState(() {
        currentTime = getCurrentTimes(DateTime.now().day)!;
        print(currentTime);
        check = true;
      });
    });
  }

  void change() {
    check = false;
    var path = "";
    switch (tanlanganViloyat) {
      case 'Toshkent':
        path = "assets/json/toshkent.json";
        break;
      case 'Andijon':
        path = "assets/json/andijon.json";
        break;
      case 'Buxoro':
        path = "assets/json/buxoro.json";
        break;
      case 'Jizzax':
        path = "assets/json/jizzax.json";
        break;
      case 'Qashqadaryo':
        path = "assets/json/qashqadaryo.json";
        break;
      case 'Navoiy':
        path = "assets/json/navoiy.json";
        break;
      case 'Namangan':
        path = "assets/json/namangan.json";
        break;
      case 'Qoraqalpog\'iston Respublikasi':
        path = "assets/json/nukus.json";
        break;
      case 'Samarqand':
        path = "assets/json/samarqand.json";
        break;
      case 'Surxondaryo':
        path = "assets/json/surxandaryo.json";
        break;
      case 'Sirdaryo':
        path = "assets/json/sirdaryo.json";
        break;
      case 'Farg\'ona':
        path = "assets/json/fargona.json";
        break;
      case 'Xorazm':
        path = "assets/json/xorazm.json";
        break;
      default:
        print('Noma\'lum viloyat.');
    }
    getDataFromJson(path).then((_) {
      setState(() {
        currentTime = getCurrentTimes(DateTime.now().day)!;
        print(currentTime);
        check = true;
      });
    });
  }

  Widget swit(Size size) {
    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavoritesSelected = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color:
                      isFavoritesSelected ? Colors.black : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  "Kunlik",
                  style: TextStyle(
                    color: isFavoritesSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavoritesSelected = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color:
                      isFavoritesSelected ? Colors.grey.shade100 : Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  "Oylik",
                  style: TextStyle(
                    color:
                        !isFavoritesSelected
                            ? Colors.grey.shade100
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/ic_icon.png",
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 10),
                           size.width<920?Text(
                             "RAMAZON \nVAQTLARI",
                             textAlign: TextAlign.justify,
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontFamily: "Anton",
                             ),
                           ) :Text(
                              "RAMAZON VAQTLARI",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: "Anton",
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 15,
                        ),
                        child: size.width<500?Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton<String>(
                              value: tanlanganViloyat,

                              underline: SizedBox(),
                              icon: SizedBox(),
                              onChanged: (String? yangiQiymat) {
                                setState(() {
                                  tanlanganViloyat = yangiQiymat;
                                  change();
                                });
                              },
                              items:
                              viloyatlar.map<DropdownMenuItem<String>>((
                                  String viloyat,
                                  ) {
                                return DropdownMenuItem<String>(
                                  value: viloyat,
                                  child: Text(
                                    viloyat,

                                    style: TextStyle(
                                      fontSize: size.width*0.037,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                            Text(
                              "${getMonth(DateTime.now().month).toUpperCase()} ${DateTime.now().day},${DateTime.now().year}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Anton",
                              ),
                            ),
                          ],
                        ):Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton<String>(
                              value: tanlanganViloyat,

                              underline: SizedBox(),
                              icon: SizedBox(),
                              onChanged: (String? yangiQiymat) {
                                setState(() {
                                  tanlanganViloyat = yangiQiymat;
                                  change();
                                });
                              },
                              items:
                                  viloyatlar.map<DropdownMenuItem<String>>((
                                    String viloyat,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: viloyat,
                                      child: Text(
                                        viloyat,

                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),

                            Text(
                              "${getMonth(DateTime.now().month).toUpperCase()} ${DateTime.now().day},${DateTime.now().year}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: "Anton",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                swit(size),
                SizedBox(height: 20),
                isFavoritesSelected
                    ? daily(size)
                    : Column(
                      children: List.generate(
                        model.timesList!.length,
                        (index) =>
                            RamadanTimeCard(time: model.timesList![index]),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget daily(Size size) {
    print(size.width);
    if (size.width > 920) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            !check
                ? CircularProgressIndicator()
                : Container(
                  width: size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PrayerTimeCard(
                        prayerName: "Bomdod ('saharlik')",
                        time: currentTime.quyosh.toString(),
                        icon: Icons.wb_sunny,
                      ),
                      PrayerTimeCard(
                        prayerName: "Quyosh",

                        time: currentTime.peshin.toString(),
                        icon: Icons.wb_sunny,
                      ),
                      PrayerTimeCard(
                        prayerName: "Peshin",

                        time: currentTime.asr.toString(),
                        icon: Icons.wb_sunny,
                      ),
                      PrayerTimeCard(
                        prayerName: "Asr",

                        time: currentTime.shom.toString(),
                        icon: Icons.nightlight_round,
                      ),
                      PrayerTimeCard(
                        prayerName: "Shom ('iftorlik')",
                        time: currentTime.xufton.toString(),
                        icon: Icons.nightlight_round,
                      ),
                      PrayerTimeCard(
                        prayerName: "Xufton",

                        time: currentTime.qamar.toString(),
                        icon: Icons.nightlight_round,
                      ),
                    ],
                  ),
                ),
            Column(children: [DuaCard(size: size.width*0.5)]),
            // DuaCard(),
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            !check
                ? CircularProgressIndicator()
                : Container(
              width: size.width * 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrayerTimeCard(
                    prayerName: "Bomdod ('saharlik')",
                    time: currentTime.quyosh.toString(),
                    icon: Icons.wb_sunny,
                  ),
                  PrayerTimeCard(
                    prayerName: "Quyosh",

                    time: currentTime.peshin.toString(),
                    icon: Icons.wb_sunny,
                  ),
                  PrayerTimeCard(
                    prayerName: "Peshin",

                    time: currentTime.asr.toString(),
                    icon: Icons.wb_sunny,
                  ),
                  PrayerTimeCard(
                    prayerName: "Asr",

                    time: currentTime.shom.toString(),
                    icon: Icons.nightlight_round,
                  ),
                  PrayerTimeCard(
                    prayerName: "Shom ('iftorlik')",
                    time: currentTime.xufton.toString(),
                    icon: Icons.nightlight_round,
                  ),
                  PrayerTimeCard(
                    prayerName: "Xufton",

                    time: currentTime.qamar.toString(),
                    icon: Icons.nightlight_round,
                  ),
                ],
              ),
            ),
            Column(children: [DuaCard(size: size.width*0.9)]),
            // DuaCard(),
          ],
        ),
      );

    }
  }
}
