import 'package:chattapp/Screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'chat.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    signinGoogle() async {
      try {
        await signInWithGoogle;
      } catch (e) {
        print(e.toString());
      }
    }

    signin() async {
      FirebaseAuth auth = FirebaseAuth.instance;

      try {
        await auth.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => chatpage()));
        print("user is log in");
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      body: Column(
        children: [
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
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    signin();
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    signInWithGoogle();
                    // signinGoogle();
                  },
                  child: Text(
                    'Log In with google',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                ),
              )),
        ],
      ),
    );
  }
}
