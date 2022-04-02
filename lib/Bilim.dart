import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Bilim extends StatefulWidget {
  const Bilim({Key? key}) : super(key: key);

  @override
  State<Bilim> createState() => _BilimState();
}

class _BilimState extends State<Bilim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('BİLİM')),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    Image.asset('assets/images/bbc.png'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('BBC SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlBilim('https://www.bbc.com/turkce/topics/c404v74nk56t');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 20,
                    ),
                    Image.asset('assets/images/bilim.png'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('BİLİM GENÇ SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlBilim('https://bilimgenc.tubitak.gov.tr/populer-bilim');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 20,
                    ),
                    Image.asset('assets/images/cnn.png'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('CNN BİLİM SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlBilim('https://www.cnnturk.com/haberleri/bilim');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 20,
                    ),
                    Image.asset('assets/images/ntv.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('NTV BİLİM SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlBilim('https://www.ntv.com.tr/bilim');
                    }, child: Text('HABER İÇİN TIKLAYIN'))
                  ],
                ),

              );
            }

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future urlBilim ( String url) async{
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}