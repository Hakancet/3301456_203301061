
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobil/giris.dart';
import 'package:uuid/uuid.dart';
import 'data/auth_services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late User user;
  var uuid = Uuid();
  int id = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthService authService = AuthService();

  @override


  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Center(child: Text('HIZLI KAYIT')),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/kayitol.gif'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("SÜPER HABERLER İÇİN KAYIT",
                                        style: TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                        controller: _nameController,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.deepOrange,
                                          ),
                                          labelText: 'KULLANICI ADI',
                                          hintText: 'örn: POLAT ALEMDAR ',
                                          hintStyle: TextStyle(color: Colors.black),
                                          focusColor: Colors.black,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black45,
                                              )),
                                        )),
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
                                          hintText: 'mailiniz@gmail.com ',
                                          hintStyle: TextStyle(color: Colors.black),
                                          focusColor: Colors.black,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black45,
                                              )),
                                        )),
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
                                          hintText: '1234 :) ',
                                          hintStyle: TextStyle(color: Colors.black),
                                          focusColor: Colors.black,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black45,
                                              )),
                                        )),
                                    TextField(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        cursorColor: Colors.black,
                                        controller: _passwordAgainController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.vpn_key,
                                            color: Colors.deepOrange,
                                          ),
                                          labelText: 'Parola Tekrar',
                                          hintText: '1234 :) ',
                                          hintStyle: TextStyle(color: Colors.black),
                                          focusColor: Colors.black,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              )),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black45,
                                              )),
                                        )),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    InkWell(
                                      onTap: () {

                                        setState(() {
                                          if (_nameController.text
                                              .toString()
                                              .isNotEmpty &&
                                              _emailController.text
                                                  .toString()
                                                  .isNotEmpty &&
                                              _passwordController.text
                                                  .toString()
                                                  .isNotEmpty &&
                                              _passwordAgainController.text
                                                  .toString()
                                                  .isNotEmpty) {
                                            if (_passwordController.text.toString() ==
                                                _passwordAgainController.text
                                                    .toString()) {
                                              if (_passwordController.text.length >=
                                                  6) {

                                                authService.signUp(
                                                    _emailController.text.toString(),
                                                    _passwordController.text.toString());

                                                authService.createPerson(
                                                  _nameController.text.toString(),
                                                  _emailController.text.toString(),
                                                  _passwordController.text.toString(),
                                                );

                                                /*addUser(
                                                    _nameController.text.toString(),
                                                    _emailController.text.toString(),
                                                    uniqueId.toString());*/

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GirisSayfa()));
                                              } else {
                                                var alert = AlertDialog(
                                                  actions: [
                                                    FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("OK"))
                                                  ],
                                                  title: Text("UYARI !"),
                                                  content: Text(
                                                      "Şifre en az 6 karakter olmalıdır!!"),
                                                );
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return alert;
                                                    });
                                              }
                                            } else {
                                              var alert2 = AlertDialog(
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("OK"))
                                                ],
                                                title: Text("UYARI"),
                                                content: Text("Şifreler Uyuşmuyor!"),
                                              );

                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return alert2;
                                                  });
                                            }
                                          } else {
                                            var alert3 = AlertDialog(
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("OK"))
                                              ],
                                              title: Text("UYARI"),
                                              content:
                                              Text("Boş bırakılan yerler var!"),
                                            );

                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return alert3;
                                                });
                                          }
                                        });

                                        //create user part
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            //color: colorPrimaryShade,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                              child: Text(
                                                "KAYDET",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
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
                ],
              ),
            ],
          ),
        ));
  }
}
