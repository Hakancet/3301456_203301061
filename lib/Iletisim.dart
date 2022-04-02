import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Iletisim extends StatefulWidget {
  const Iletisim({Key? key}) : super(key: key);

  @override
  State<Iletisim> createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  String url = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text('BİZE ULAŞIN')),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/uygu.jpg'),
              Divider(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                color: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 50,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      TextButton(
                        child: Text('uygulamamailideneme@gmail.com',
                          style: TextStyle(color: Colors.white,
                              fontSize:18.0,
                          ),),
                        onPressed: (){
                          Navigator.pop(context);
                          urlLauncher('mailto:uygulamadenememail@gmail.com?subject=SÜPER%20UYGULAMA&subject=ALLAHINA%20KURBAN%20BU%20NASIL%20UYGULAMA');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                color: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_forwarded,
                        size: 50,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      TextButton(
                        child: Text('+90 555 455 55 55',
                          style: TextStyle(color: Colors.white,
                            fontSize:25.0,
                          ),),
                        onPressed: (){
                          Navigator.pop(context);
                          urlLauncher('sms: 05554555555');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                color: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_forwarded,
                        size: 50,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      TextButton(
                        child: Text('+90 555 455 55 55',
                          style: TextStyle(color: Colors.white,
                            fontSize:25.0,
                          ),),
                        onPressed: (){
                          Navigator.pop(context);
                          urlLauncher('tel: 0555 455 55 55');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future urlLauncher ( String url) async{
  if(await launch(url)) {
    await launch(url);
  }else{
    debugPrint('Linki Açamadım');
  }

}