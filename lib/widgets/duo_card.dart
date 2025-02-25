import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DuaCard extends StatefulWidget {
  double size;

  DuaCard({Key? key, required this.size}) : super(key: key);

  @override
  State<DuaCard> createState() => _DuaCardState();
}

class _DuaCardState extends State<DuaCard> {
  var iftorlik_check = false;
  var sahatlik_check = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return widget.size<500?Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: widget.size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saharlik (og'iz yopish) duosi",
                    style: GoogleFonts.lato(
                      fontSize: widget.size*0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon:
                        sahatlik_check
                            ? Icon(Icons.pause, color: Colors.black87)
                            : Icon(Icons.volume_up, color: Colors.black87),
                    onPressed: () async {
                      setState(() {
                        sahatlik_check = !sahatlik_check;
                        iftorlik_check =
                            iftorlik_check
                                ? iftorlik_check = !iftorlik_check
                                : iftorlik_check;
                      });
                      if (sahatlik_check) {
                        await assetsAudioPlayer.pause();
                        try {
                          await assetsAudioPlayer.open(
                            Audio('assets/audio/saharlik.mp3'),
                            showNotification: true,
                          );
                        } catch (e) {
                          print('Xatolik yuz berdi: $e');
                        } // `assets/audio/music.mp3` faylini o'ynatish
                      } else {
                        await assetsAudioPlayer.pause();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                """Navaytu an asuvma sovma shahri ramazona minal fajri ilal mag‘ribi, xolisan lillahi ta’aalaa Allohu akbar.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey),
              SizedBox(height: 8),
              Text(
                """Ma’nosi: Ramazon oyining ro‘zasini subhdan to kun botguncha tutmoqni niyat qildim. Xolis Alloh uchun Alloh buyukdir.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black87),
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Iftorlik (og'iz ochish) duosi",
                    style: GoogleFonts.lato(
                      fontSize: widget.size*0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon:
                        iftorlik_check
                            ? Icon(Icons.pause, color: Colors.black87)
                            : Icon(Icons.volume_up, color: Colors.black87),
                    onPressed: () async {
                      setState(() {
                        iftorlik_check = !iftorlik_check;
                        sahatlik_check =
                            sahatlik_check
                                ? sahatlik_check = !sahatlik_check
                                : sahatlik_check;
                      });
                      if (iftorlik_check) {
                        await assetsAudioPlayer.pause();

                        try {
                          await assetsAudioPlayer.open(
                            Audio('assets/audio/iftorlik.mp3'),
                            showNotification: true,
                          );
                        } catch (e) {
                          print('Xatolik yuz berdi: $e');
                        } // `assets/audio/music.mp3` faylini o'ynatish
                      } else {
                        await assetsAudioPlayer.pause();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                """Allohumma laka sumtu va bika aamantu va a’layka tavakkaltu va a’laa rizqika aftartu, fag‘firliy ma qoddamtu va maa axxortu birohmatika yaa arhamar roohimiyn.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey),
              SizedBox(height: 8),
              Text(
                """Ma’nosi: Ey Alloh, ushbu Ro‘zamni Sen uchun tutdim va Senga iymon keltirdim va Senga tavakkal qildim va bergan rizqing bilan iftor qildim. Ey mehribonlarning eng mehriboni, mening avvalgi va keyingi gunohlarimni mag‘firat qilgil.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    ):Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: widget.size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saharlik (og'iz yopish) duosi",
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon:
                    sahatlik_check
                        ? Icon(Icons.pause, color: Colors.black87)
                        : Icon(Icons.volume_up, color: Colors.black87),
                    onPressed: () async {
                      setState(() {
                        sahatlik_check = !sahatlik_check;
                        iftorlik_check =
                        iftorlik_check
                            ? iftorlik_check = !iftorlik_check
                            : iftorlik_check;
                      });
                      if (sahatlik_check) {
                        await assetsAudioPlayer.pause();
                        try {
                          await assetsAudioPlayer.open(
                            Audio('assets/audio/saharlik.mp3'),
                            showNotification: true,
                          );
                        } catch (e) {
                          print('Xatolik yuz berdi: $e');
                        } // `assets/audio/music.mp3` faylini o'ynatish
                      } else {
                        await assetsAudioPlayer.pause();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                """Navaytu an asuvma sovma shahri ramazona minal fajri ilal mag‘ribi, xolisan lillahi ta’aalaa Allohu akbar.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey),
              SizedBox(height: 8),
              Text(
                """Ma’nosi: Ramazon oyining ro‘zasini subhdan to kun botguncha tutmoqni niyat qildim. Xolis Alloh uchun Alloh buyukdir.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black87),
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Iftorlik (og'iz ochish) duosi",
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon:
                    iftorlik_check
                        ? Icon(Icons.pause, color: Colors.black87)
                        : Icon(Icons.volume_up, color: Colors.black87),
                    onPressed: () async {
                      setState(() {
                        iftorlik_check = !iftorlik_check;
                        sahatlik_check =
                        sahatlik_check
                            ? sahatlik_check = !sahatlik_check
                            : sahatlik_check;
                      });
                      if (iftorlik_check) {
                        await assetsAudioPlayer.pause();

                        try {
                          await assetsAudioPlayer.open(
                            Audio('assets/audio/iftorlik.mp3'),
                            showNotification: true,
                          );
                        } catch (e) {
                          print('Xatolik yuz berdi: $e');
                        } // `assets/audio/music.mp3` faylini o'ynatish
                      } else {
                        await assetsAudioPlayer.pause();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                """Allohumma laka sumtu va bika aamantu va a’layka tavakkaltu va a’laa rizqika aftartu, fag‘firliy ma qoddamtu va maa axxortu birohmatika yaa arhamar roohimiyn.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey),
              SizedBox(height: 8),
              Text(
                """Ma’nosi: Ey Alloh, ushbu Ro‘zamni Sen uchun tutdim va Senga iymon keltirdim va Senga tavakkal qildim va bergan rizqing bilan iftor qildim. Ey mehribonlarning eng mehriboni, mening avvalgi va keyingi gunohlarimni mag‘firat qilgil.""",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
