import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Spor extends StatefulWidget {
  const Spor({Key? key}) : super(key: key);

  @override
  State<Spor> createState() => _SporState();
}

class _SporState extends State<Spor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('SPOR')),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                    children: [
                      Image.asset('assets/images/trtsporr.jpg'),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_down),
                        title: Text('TRT SPOR SİTESİ'),
                        subtitle: Text('YAZAR'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlSpor('https://www.trtspor.com.tr/');
                      }, child: Text('HABER İÇİN TIKLAYIN')),
                      Divider(
                        height: 20,
                      ),
                      Image.asset('assets/images/spor.jpg'),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_down),
                        title: Text('A SPOR HABER SİTESİ'),
                        subtitle: Text('YAZAR'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlSpor('https://www.aspor.com.tr/');
                      }, child: Text('HABER İÇİN TIKLAYIN')),
                      Divider(
                        height: 15,
                      ),
                      Image.asset('assets/images/sporr.png'),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_down),
                        title: Text('BEİN SPOR HABER SİTESİ'),
                        subtitle: Text('YAZAR'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlSpor('https://beinsports.com.tr/');
                      }, child: Text('HABER İÇİN TIKLAYIN')),
                      Divider(
                        height: 20,
                      ),
                      Image.asset('assets/images/fanatik.jpg'),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_down),
                        title: Text('FANATİK HABER SİTESİ'),
                        subtitle: Text('YAZAR'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        urlSpor('https://www.fanatik.com.tr/');
                      }, child: Text('HABER İÇİN TIKLAYIN')),
                    ]
                ),

              );
            }

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future urlSpor ( String url) async{
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}