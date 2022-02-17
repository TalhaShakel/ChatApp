// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:chattapp/Screens/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loginpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool sign = false;
  creatuser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      print("user is create");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => chatpage()));
    } catch (e) {
      print(e.toString());
    }
  }

  Future otp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // auth.verifyPhoneNumber(
    //   phoneNumber: phone,
    //   verificationCompleted:  (AuthCredential credential) async {
    //   var  result =await auth.signInWithCredential(credential);
    //   // Firebase
    //   },
    //   verificationFailed: verificationFailed,
    //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)

    // try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+923178825400',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: '+92 ${phone.text}',
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     if (e.code == 'invalid-phone-number') {
    //       print('The provided phone number is not valid.');
    //     }
    //   },
    //   codeSent: (String verificationId, int? resendToken) async {
    //     String smsCode = 'xxxx';

    //     // Create a PhoneAuthCredential with the code
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: verificationId, smsCode: smsCode);

    //     // Sign the user in (or link) with the credential
    //     await auth.signInWithCredential(credential);
    //   },
    //   timeout: const Duration(seconds: 60),
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
    // } catch (e) {
    // print(e.toString());
    // }
  }

  TextEditingController phone = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, right: 8.0, left: 8.0, bottom: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Username',
                            )))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 8.0, left: 8.0, bottom: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                            )))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Your password',
                            )))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 8.0, left: 8.0, bottom: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Phone Num',
                            )))),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        otp();
                        // creatuser();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                    ),
                  )),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginpage()));
                },
                child: Text(
                  'Allready have account',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
