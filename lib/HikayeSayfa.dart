import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HikayeSayfa extends StatefulWidget {
  const HikayeSayfa({Key? key}) : super(key: key);

  @override
  State<HikayeSayfa> createState() => _HikayeSayfaState();
}

class _HikayeSayfaState extends State<HikayeSayfa> {
  int guncelhikaye = 0;
  final List<Widget> Hikayem = [
    Hikayem1(),
    Hikayem2(),
    Hikayem3(),
  ];

  List<double> IzlemeSure = [];

  @override
  void initState() {
    super.initState();

    // hikayelerin izlenmesi olarak 0'dan başladı
    for (int i = 0; i < Hikayem.length; i++) {
      IzlemeSure.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (IzlemeSure[guncelhikaye] + 0.01 < 1) {
          IzlemeSure[guncelhikaye] += 0.01;
        }
        else {
          IzlemeSure[guncelhikaye] = 1;
          timer.cancel();

          // hikaye oldukça diğer sayfaya geç
          if (guncelhikaye < Hikayem.length - 1) {
            guncelhikaye++;
            _startWatching();
          }
          // eğer hikeye biterse ekranı kapat
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    // Ekranı ikiye bölmek için kullanıldı
    if (dx < screenWidth / 2) {
      setState(() {
        // Eğer ilk hikaye değilse 0'dan büyük olmalıdır.
        if (guncelhikaye > 0) {
          // -1 değer alırsa 0. değere döner
          IzlemeSure[guncelhikaye - 1] = 0;
          IzlemeSure[guncelhikaye] = 0;

          // go to previous story
          guncelhikaye--;
        }
      });
    }
    // ekranın ikinci yarısı için kullanıldı
    else {
      setState(() {
        // if there are more stories left
        if (guncelhikaye < Hikayem.length - 1) {
          IzlemeSure[guncelhikaye] = 1;
          // diğer hikayeye geçer
          guncelhikaye++;
        }
        // eğer son hikayede ise hikaye biter
        else {
          IzlemeSure[guncelhikaye] = 1;
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            // story
            Hikayem[guncelhikaye],

            // progress bar
            Hikaye(
              IzlenmeDegeri: IzlemeSure,
            ),
          ],
        ),
      ),
    );
  }
}
class Hikaye extends StatelessWidget {
  List<double> IzlenmeDegeri = [];

  Hikaye({required this.IzlenmeDegeri});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: HikayeZaman(HikayeYuzdesi: IzlenmeDegeri[0]), // ilk hikaye değeri
          ),
          Expanded(
            child: HikayeZaman(HikayeYuzdesi: IzlenmeDegeri[1]), // ikinci hikaye
          ),
          Expanded(
            child: HikayeZaman(HikayeYuzdesi: IzlenmeDegeri[2]), // üçüncü hikaye
          ),
        ],
      ),
    );
  }
}
class Hikayem1 extends StatelessWidget {
  const Hikayem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image(
                image: ExactAssetImage('assets/images/hikayeselcuk.jpeg'),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                          Navigator.pop(context);
                          urlHikaye('https://www.selcuk.edu.tr/');
                      }, child: Text('DÜNYANIN EN İYİ ÜNİVERSİTESİ')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Hikayem2 extends StatelessWidget {
  const Hikayem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image(
                image: ExactAssetImage('assets/images/hikayegs.jpeg'),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlHikaye('https://www.galatasaray.org/anasayfa');
                      }, child: Text('EN İYİ TAKIM :)')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Hikayem3 extends StatelessWidget {
  const Hikayem3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image(
                image: ExactAssetImage('assets/images/hikayeobis.jpeg'),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 50,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlHikaye('https://obis.selcuk.edu.tr/');
                      }, child: Text('ÇOK SÜPER NOTLAR İÇİN TIKLAYIN')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HikayeZaman extends StatelessWidget {
  double HikayeYuzdesi = 0;

  HikayeZaman({required this.HikayeYuzdesi});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 5,
      percent: HikayeYuzdesi,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
    );
  }
}
Future urlHikaye ( String url) async{   // url_launcher kutuphanesi kullanılarak oluşturulup import edilmiştir
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}
