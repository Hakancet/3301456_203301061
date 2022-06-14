import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobil/giris.dart';


class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => kisi();
}

class kisi extends State<Profil> {
  var name;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text('PROFİL')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Divider(
             height: 20,
           ),
           Card(
             margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
             color: Colors.amber,
             child: Center(
               child: Text('MÜKEMMEL UYGULAMANIN MÜKEMMEL KULLANICISI                               ',
               style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600 , ),),
             ),
           ),
           Divider(
             height: 20,
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 20.0),
             color: Colors.black,
             padding: EdgeInsets.all(20.0),
             child: Row(
               children: [
                 Icon(Icons.email,
                 color: Colors.green,
                 ),
                 SizedBox(
                   width: 10.0,
                 ),
                 Text(
                   user!.email.toString(),
                   style: TextStyle(color: Colors.green,
                     fontSize: 20.0
                   ),
                 ),
               ],
             ),
           ),
           Divider(
             height: 20,
           ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.exit_to_app,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                    child: Text(
                      'ÇIKMAK İÇİN TIKLAYIN',
                      style: TextStyle(color: Colors.green,
                          fontSize: 20.0
                      ),
                    ),
                    onPressed: (){
                      FirebaseAuth.instance.signOut().then((value) => {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> GirisSayfa()), (Route<dynamic> route) => false)
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
