import 'package:flutter/material.dart';
import 'giris.dart';

class Karsilama extends StatefulWidget {
  const Karsilama({Key? key}) : super(key: key);

  @override
  State<Karsilama> createState() => _KarsilamaState();
}

class _KarsilamaState extends State<Karsilama> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => GirisSayfa()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/giriss.gif'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}
