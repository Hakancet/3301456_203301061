import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobil/Kayit.dart';
import 'package:mobil/SayfaA.dart';
import 'data/auth_services.dart';

class GirisSayfa extends StatefulWidget {
  const GirisSayfa({Key? key}) : super(key: key);

  @override
  State<GirisSayfa> createState() => _GirisSayfaState();

  static withEmail(String string) {}
}

class _GirisSayfaState extends State<GirisSayfa> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric( vertical: 30 ,horizontal: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            ],
                          ),
                          Image.asset('assets/images/uygu.jpg', fit: BoxFit.cover),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "NEWS LAB",
                            style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'satisfy', decorationColor: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "EN DOĞRU VE GERÇEKÇİ HABERLER İÇİN HEMEN GEL :)",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextField(
                              controller: _emailController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.deepOrange,
                                ),
                                labelText: 'E-Mail',
                                hintText: 'mailiniz@gmail.com',
                                hintStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.deepOrange,
                                ),
                                labelText: 'Parola',
                                hintText: ' 123456 :) ',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                              )),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          InkWell(
                            onTap: () {
                              _authService
                                  .signIn(
                                  _emailController.text, _passwordController.text)
                                  .then((value) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => sayfa.withEmail(
                                            _emailController.text.toString())));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.deepOrange, width: 2),
                                  //color: colorPrimaryShade,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                    child: Text(
                                      "NEWS LAB GİRİŞ",
                                      style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.deepOrange, width: 2),
                                  //color: colorPrimaryShade,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                    child: Text(
                                      "%100 HEMEN KAYIT OL",
                                      style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}