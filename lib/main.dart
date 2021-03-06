import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil/SayfaA.dart';
import 'package:mobil/data/auth_services.dart';
import 'package:mobil/karsilama.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAO6Wscw94H6fW9BybTlea7UIm5a5UXHPc",
          appId: "1:488480931635:android:21e29ab603b9762d380846",
          messagingSenderId: "",
          projectId: "newslab2-f1cef")
  );
  runApp(const MyApp());
}
var auth = AuthService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS LAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OturumuAc(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[ CircleAvatar(
            radius: 90.0,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/images/haber.jpg'),
          ),
            Text(
              ' NEWS LAB',
              style: TextStyle(
                fontFamily: 'Satisfy',
                fontSize: 16, color: Colors.blue,
              ),
            ),
            Text(
              'GÜNLÜK HABER UGULAMANIZ',
              style: TextStyle(
              fontFamily: 'Satisfy',
                fontSize: 16, color: Colors.blue,
              ),
            ),
            Container(
              width: 20.0,
              child: Divider(
                height: 20.0,
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.trending_flat,
                      size: 50,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      child: Text(' DEVAM ETMEK İÇİN BUTONA BASINIZ',
                      style: TextStyle(color: Colors.green,
                      fontSize:15.0
                      ),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Karsilama()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Widget OturumuAc() {
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return sayfa();
        } else if (snapshot.hasError) {
          return Center(child: Text("HATA ALDIK :("));
        } else {
          return Anasayfa();
        }
      });
}