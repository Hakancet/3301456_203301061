import 'package:flutter/material.dart';

class Kurucu extends StatefulWidget {
  const Kurucu({Key? key}) : super(key: key);

  @override
  State<Kurucu> createState() => _KurucuState();
}

class _KurucuState extends State<Kurucu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Center(child: Text('KURUCUMUZ')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/hacker.jpg',
              height: 200.0,
              width: 400.0,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 45, right: 5),
            child: Text(
              ''''UYGULAMAMIZ BÜYÜK HABER TEŞKİLTANIN DÜNYA BARIŞINA HİZMET EDİLMESİ AMACIYLA 2022 YILINDA DÜNYA BAŞKENTİ ŞANLI KONYAMIZDA
YAPILMIŞTIR UYGULAMAYI YAPAN BÜYÜK YAZIMLIMCI H.Ç. BU UYGULAMA SAYENSİNDE NOBEL BARIŞ ÖDÜLÜNE LAYIK GÖRÜLMÜŞTÜR. 
AMAÇLARIMIZ
1-) DÜNYA DA HABERCİLİK ADINA GERÇEKLERİ YANSITMAMAK ( GERÇEKLER HER ZAMAN ÜZER )
2-) YALAN HABERİ KENDİMİZE GÖREV BİLMEK 
3-) HER ZAMAN HER FIRSATTA KENDİMİZLE ÖVÜNMEK''',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
