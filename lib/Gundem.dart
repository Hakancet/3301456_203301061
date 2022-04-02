import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Gundem extends StatefulWidget {
  const Gundem({Key? key}) : super(key: key);

  @override
  State<Gundem> createState() => _GundemState();
}

class _GundemState extends State<Gundem> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('GÜNDEM')),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    Image.asset('assets/images/haberr.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('A HABER SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('GERÇEK VE DOĞRU HABERLER')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlac('https://www.ahaber.com.tr/');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 10,
                    ),
                    Image.asset('assets/images/hurr.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('HÜRRİYET'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlac('https://www.hurriyet.com.tr/');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 10,
                    ),
                    Image.asset('assets/images/milli.png'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('MİLLİYET'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlac('https://www.milliyet.com.tr/');
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
Future urlac ( String url) async{
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}