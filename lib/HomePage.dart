import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namoz_vaqtlari/models/ReadJsonModel.dart';
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

  List<ProvinceModel> province_list = [

    ProvinceModel("Toshkent viloyati", [
      DistrictModel("Toshkent", "assets/json/toshkent.json"),
      DistrictModel("Bekobod", "assets/json/bekobod.json"),
      DistrictModel("Olmaliq", "assets/json/olmaliq.json"),
      DistrictModel("Nurafshon", "assets/json/nurafshon.json"),
      DistrictModel("Angren", "assets/json/angren.json"),
      DistrictModel("Parkent", "assets/json/parkent.json"),
      DistrictModel("Bo'ka", "assets/json/bo'ka.json"),
      DistrictModel("Piskent", "assets/json/piskent.json"),
      DistrictModel("G'azalkent ", "assets/json/go'zalkent.json"),
      DistrictModel("Yangiyo'l", "assets/json/yangiyo'l.json"),
    ]),

    ProvinceModel("Sirdaryo viloyati", [
      DistrictModel("Guliston ", "assets/json/guliston.json"),
      DistrictModel("Boyovut", "assets/json/boyovut.json"),
      DistrictModel("Sardoba", "assets/json/sardoba.json"),
      DistrictModel("Paxtaobod", "assets/json/paxtaobod.json"),
      DistrictModel("Sirdaryo", "assets/json/sirdaryo.json"),
    ]),

    ProvinceModel("Namangan viloyati", [
      DistrictModel("Namangan", "assets/json/namangan.json"),
      DistrictModel("Pop", "assets/json/pop.json"),
      DistrictModel("Chortoq", "assets/json/chortoq.json"),
      DistrictModel("Uchqo'rg'on", "assets/json/uchqo'rg'on.json"),
      DistrictModel("Chust", "assets/json/chust.json"),
      DistrictModel("Mingbuloq", "assets/json/mingbuloq.json"),
    ]),
    ProvinceModel("Surxondaryo viloyati", [
      DistrictModel("Termiz", "assets/json/termiz.json"),
      DistrictModel("Sherobod", "assets/json/sherobod.json"),
      DistrictModel("Boysun", "assets/json/boysun.json"),
      DistrictModel("Sho'rchi", "assets/json/sho'rchi.json"),
      DistrictModel("Denov", "assets/json/denov.json"),
    ]),
    ProvinceModel("Xorazm viloyati", [
      DistrictModel("Urganch", "assets/json/urganch.json"),
      DistrictModel("Yangibozor", "assets/json/yangibozor.json"),
      DistrictModel("Hozorasp", "assets/json/hazorasp.json"),
      DistrictModel("Shovot", "assets/json/shovot.json"),
      DistrictModel("Xonqa", "assets/json/xonqa.json"),
      DistrictModel("Xiva", "assets/json/xiva.json"),
    ]),
    ProvinceModel("Buxoro viloyati", [
      DistrictModel("Buxoro", "assets/json/buxoro.json"),
      DistrictModel("Qorako'l", "assets/json/qorako'l.json"),
      DistrictModel("Gazli", "assets/json/gazli.json"),
      DistrictModel("Jondor", "assets/json/jondor.json"),
      DistrictModel("G'ijduvon", "assets/json/g'ijduvon.json"),
    ]),
    ProvinceModel("Jizzax viloyati", [
      DistrictModel("Jizzax", "assets/json/jizzax.json"),
      DistrictModel("G'allaorol", "assets/json/g'allaorol.json"),
      DistrictModel("Zomin", "assets/json/zomin.json"),
      DistrictModel("Do'stlik", "assets/json/do'stlik.json"),
      DistrictModel("Forish", "assets/json/forish.json"),
    ]),
    ProvinceModel("Qoraqalpog'iston Respublikasi", [
      DistrictModel("Nukus", "assets/json/nukus.json"),
      DistrictModel("To'rtko'l", "assets/json/to'rtko'l.json"),
      DistrictModel("Mo'ynoq", "assets/json/mo'ynoq.json"),
      DistrictModel("Qo'ng'irot", "assets/json/qo'ng'irot.json"),
      DistrictModel("Taxtako'pir", "assets/json/taxtako'pir.json"),
    ]),
    ProvinceModel("Qashqadaryo viloyati", [
      DistrictModel("Qarshi", "assets/json/qarshi.json"),
      DistrictModel("Shahrisabz", "assets/json/shaxrisabz.json"),
      DistrictModel("Dehqonobod", "assets/json/dexqonobod.json"),
      DistrictModel("G'uzor", "assets/json/g'uzor.json"),
      DistrictModel("Muborak", "assets/json/muborak.json"),
    ]),
    ProvinceModel("Farg'ona viloyati", [
      DistrictModel("Farg'ona", "assets/json/farg'ona.json"),
      DistrictModel("Quva", "assets/json/quva.json"),
      DistrictModel("Oltiariq", "assets/json/oltiariq.json"),
      DistrictModel("Marg'ilon", "assets/json/marg'ilon.json"),
      DistrictModel("Rishton", "assets/json/rishton.json"),
      DistrictModel("Qo'qon", "assets/json/qo'qon.json"),
      DistrictModel("Bog'dod", "assets/json/bog'dod.json"),

    ]),
    ProvinceModel("Navoiy viloyati", [
      DistrictModel("Navoiy", "assets/json/navoiy.json"),
      DistrictModel("Nurota", "assets/json/nurota.json"),
      DistrictModel("Zarafshon", "assets/json/zarafshon.json"),
      DistrictModel("Uchquduq", "assets/json/uchquduq.json"),
      DistrictModel("Konimex", "assets/json/konimex.json"),
    ]),
    ProvinceModel("Samarqand viloyati", [
      DistrictModel("Samarqand", "assets/json/samarqand.json"),
      DistrictModel("Kattaqo'rg'on", "assets/json/kattaqo'rg'on.json"),
      DistrictModel("Ishtixon", "assets/json/ishtixon.json"),
      DistrictModel("Jomboy", "assets/json/jomboy.json"),
      DistrictModel("Urgut", "assets/json/urgut.json"),
      DistrictModel("Mirbozor", "assets/json/mirbozor.json"),
    ]),
    ProvinceModel("Andijon viloyati", [
      DistrictModel("Andijon", "assets/json/andijon.json"),
      DistrictModel("Xo'jaobod", "assets/json/xo'jaobod.json"),
      DistrictModel("Poytug'", "assets/json/poytug'.json"),
      DistrictModel("Xonobod", "assets/json/xonobod.json"),
      DistrictModel("Asaka", "assets/json/asaka.json"),
      DistrictModel("Bo'ston", "assets/json/bo'ston.json"),

      DistrictModel("Shahrixon", "assets/json/shaxrihon.json"),
      DistrictModel("Marhamat", "assets/json/marhamat.json"),
    ]),
  ];
  var path = "";

  @override
  void initState() {
    super.initState();
    path = province_list[0].list[0].path;

    print(path);
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


  void showProvinceDistrictDialog(BuildContext context,
      List<ProvinceModel> provinces) {
    ProvinceModel? selectedProvince;
    DistrictModel? selectedDistrict;
    List<bool> expandedList = List.generate(
        provinces.length, (index) => false); // Track expanded items

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Hududni tanlash"),
              content: SizedBox(
                height: 400,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: provinces.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                color: selectedProvince == provinces[index]
                                    ? Colors.blue[100]
                                    : Colors.white,
                                child: ListTile(
                                  title: Text(provinces[index].province,
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                  onTap: () {
                                    setState(() {
                                      selectedProvince = provinces[index];
                                      selectedDistrict = null;
                                      expandedList[index] = !expandedList[index];
                                    });
                                  },
                                  trailing: IconButton(
                                    icon: Icon(expandedList[index]
                                        ? Icons.remove
                                        : Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        expandedList[index] =
                                        !expandedList[index];
                                      });
                                    },
                                  ),
                                ),
                              ),
                              if (expandedList[index] &&
                                  selectedProvince != null &&
                                  selectedProvince!.list.isNotEmpty)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: selectedProvince!.list.length,
                                  itemBuilder: (context, districtIndex) {
                                    return ListTile(
                                      tileColor: selectedDistrict ==
                                          selectedProvince!.list[districtIndex]
                                          ? Colors.green[200]
                                          : Colors.grey[200],
                                      title: Text(
                                          selectedProvince!.list[districtIndex]
                                              .name),
                                      onTap: () {
                                        setState(() {
                                          if (selectedProvince != null &&
                                              selectedProvince!
                                                  .list.isNotEmpty) {
                                            print(selectedProvince!
                                                .list[districtIndex].path);
                                            path = selectedProvince!
                                                .list[districtIndex].path;
                                            change();
                                            tanlanganViloyat = selectedProvince!
                                                .list[districtIndex].name;
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
                            SizedBox(width: 5),
                           size.width<920?Text(
                             "RAMAZON \nVAQTLARI",
                             textAlign: TextAlign.justify,
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 19,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showProvinceDistrictDialog(
                                    context, province_list);

                              },
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Hududni tanlang - ",
                                      style: TextStyle(
                                          fontSize: 13 , color: Colors.black)
                                  ),
                                  TextSpan(
                                    text: tanlanganViloyat,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                  )
                                ]),
                              ),
                            )
                            // DropdownButton<String>(
                            //   value: tanlanganViloyat,
                            //
                            //   underline: SizedBox(),
                            //   icon: SizedBox(),
                            //   onChanged: (String? yangiQiymat) {
                            //     setState(() {
                            //       tanlanganViloyat = yangiQiymat;
                            //       change();
                            //     });
                            //   },
                            //   items:
                            //       viloyatlar.map<DropdownMenuItem<String>>((
                            //         String viloyat,
                            //       ) {
                            //         return DropdownMenuItem<String>(
                            //           value: viloyat,
                            //           child: Text(
                            //             viloyat,
                            //
                            //             style: TextStyle(
                            //               fontSize: 19,
                            //               fontWeight: FontWeight.w800,
                            //               color: Colors.black,
                            //             ),
                            //           ),
                            //         );
                            //       }).toList(),
                            // ),
                            //
                            ,
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
