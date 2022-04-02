import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class Teknoloji extends StatefulWidget {
  const Teknoloji({Key? key}) : super(key: key);

  @override
  State<Teknoloji> createState() => _TeknolojiState();
}

class _TeknolojiState extends State<Teknoloji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('TEKNOLOJİ')),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    Image.asset('assets/images/teknoshift.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('SHİFTDELETE.NET SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlTekno('https://shiftdelete.net/teknoloji-haberleri');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 20,
                    ),
                    Image.asset('assets/images/webteknoo.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('WEBTWKNO HABER SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlTekno('https://www.webtekno.com/');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 15,
                    ),
                    Image.asset('assets/images/donanim.png'),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_down),
                      title: Text('DONANIM HABER SİTESİ'),
                      subtitle: Text('YAZAR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(('AÇIKLAMA HABER AÇIKLAMASI')
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      urlTekno('https://www.donanimhaber.com/teknoloji-haberleri');
                    }, child: Text('HABER İÇİN TIKLAYIN')),
                    Divider(
                      height: 20,
                    ),
                ]
                ),

              );
            }

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future urlTekno ( String url) async{
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}