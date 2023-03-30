import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keeptruckin/LoginRegisteration/register.dart';

class GetStarted extends StatelessWidget {
  GetStarted({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Image.asset(
                    'assets/semi.png',
                    scale: 2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                FloatingActionButton.extended(
                    onPressed: () async {
                      final GoogleSignInAccount? googleUser =
                          await GoogleSignIn(scopes: <String>["email"])
                              .signIn();

                      final GoogleSignInAuthentication googleAuth =
                          await googleUser!.authentication;

                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken,
                      );

                      try {
                        UserCredential uid =
                            await auth.signInWithCredential(credential);
                        // print(uid.user?.uid);
                        User user = FirebaseAuth.instance.currentUser!;
                        if (uid.additionalUserInfo!.isNewUser) {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>RegisterScreen()));
                        } else if (FirebaseAuth.instance.currentUser != null) {
                          final userSnapShot = await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get();

                          if (!userSnapShot.exists) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => RegisterScreen()));
                          } else {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (ctx) => HomeScreen()));
                          }
                        }
                      } catch (e) {
                        // Todo: Create toast message for error
                        log(e.toString());
                      }
                    },
                    label: Text('Sign up with Google'),
                    icon: Image.asset(
                      'assets/google.png',
                      scale: 8,
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
