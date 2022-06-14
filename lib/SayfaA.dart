import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil/Bilim.dart';
import 'package:mobil/Ekonomi.dart';
import 'package:mobil/Gundem.dart';
import 'package:mobil/HaberNot.dart';
import 'package:mobil/HikayeSayfa.dart';
import 'package:mobil/Kurucu.dart';
import 'package:mobil/Magazin.dart';
import 'package:mobil/Profil.dart';
import 'package:mobil/Iletisim.dart';
import 'package:mobil/Saglik.dart';
import 'package:mobil/Spor.dart';
import 'package:mobil/Teknoloji.dart';
import 'Istatistik.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class sayfa extends StatefulWidget {
  String? email;
  sayfa.withEmail(this.email);
  sayfa();

  @override
  State<sayfa> createState() => _sayfaState();
}

class _sayfaState extends State<sayfa> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HikayeSayfa(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      drawer: Drawer(
          backgroundColor: Colors.teal[200],
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/uygu.jpg'),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(Icons.attach_money),
                    title: const Text('EKONOMİ'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ekonomi()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(Icons.public),
                    title: const Text('GÜNDEM'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gundem()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(Icons.memory),
                    title: const Text('TEKNOLOJİ'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Teknoloji()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_bike),
                    title: const Text('SPOR'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Spor()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.straighten),
                    title: const Text('BİLİM'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bilim()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.healing),
                    title: const Text('SAĞLIK'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Saglik()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: const Text('MAGAZİN'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Magazin()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.add_circle),
                    title: const Text('HABER NOTLARIM'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Not()));
                    },
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.add_box),
                    title: Text('DAHA FAZLA...'),
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('PROFİL'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profil()));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('KURUCUMUZ'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Kurucu()));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.add_chart),
                          title: Text('HABER BİLGİLERİ'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => istatistik()));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.add_ic_call),
                          title: Text('İLETİŞİM'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Iletisim()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Center(child: Text('ANASAYFA')),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryCircle(
                  function: _openStory,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/haberuygulama.gif',
              height: 300.0,
              width: 500.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 45, right: 5),
            child: Text(
              'EN IYI HABER UYGULAMASINA HOSGELDINIZ',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Satisfy',
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StoryCircle extends StatelessWidget {
  final function;

  StoryCircle({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/haber.jpg')),
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}


