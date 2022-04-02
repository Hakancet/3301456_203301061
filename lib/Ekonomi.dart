import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ekonomi extends StatefulWidget {
  const Ekonomi({Key? key}) : super(key: key);

  @override
  State<Ekonomi> createState() => _EkonomiState();
}

class _EkonomiState extends State<Ekonomi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('EKONOMİ')),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 1,  // SAYFADAKİ HABER BAŞLIKLARINI TEK BİR KEZ GÖSTERİR
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  Image.asset('assets/images/habert.jpg'),
                  ListTile(
                    leading: Icon(Icons.arrow_circle_down),
                    title: Text('HABER TÜRK SİTESİ'),
                    subtitle: Text('YAZAR'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    urlEkonomi('https://www.haberturk.com/ekonomi');
                  }, child: Text('HABER İÇİN TIKLAYIN')),
                  Divider(
                    height: 10,
                  ),
                  Image.asset('assets/images/bloom.jpg'),
                  ListTile(
                    leading: Icon(Icons.arrow_circle_down),
                    title: Text('BLOOMBERG HABER SİTESİ'),
                    subtitle: Text('YAZAR'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    urlEkonomi('https://www.bloomberght.com/');
                  }, child: Text('HABER İÇİN TIKLAYIN')),
                  Divider(
                    height: 10,
                  ),
                  Image.asset('assets/images/trt.png'),
                  ListTile(
                    leading: Icon(Icons.arrow_circle_down),
                    title: Text('TRT HABER SİTESİ'),
                    subtitle: Text('YAZAR'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    urlEkonomi('https://www.trthaber.com/haber/ekonomi/');
                  }, child: Text('HABER İÇİN TIKLAYIN')),
                ],
              ),

            );
        }

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future urlEkonomi ( String url) async{   // url_launcher kutuphanesi kullanılarak oluşturulup import edilmiştir
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}