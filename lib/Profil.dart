import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => kisi();
}

class kisi extends State<Profil> {
  @override
  Widget build(BuildContext context) {
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
            CircleAvatar(
              radius: 90.0,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/images/polat.jpg'),
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
                   'polatalemdardead@gmail.com',
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
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.black,
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.phone,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '+90 565 342 6592',
                    style: TextStyle(color: Colors.green,
                        fontSize: 20.0
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
