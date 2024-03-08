// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salvar/pages/homePage.dart';
import 'package:salvar/pages/onBoardingScreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    //create a UI based on the authentication state of the app
    return Scaffold(
      body: StreamBuilder<User?>(
          //the stream below helps us get auth state changes from firebase
          // they tell us if user is signed in or not
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is signed in
            if (snapshot.hasData) {
              return const HomePage();
            }
            //user is not signed in
            else {
              return const ScreenOne();
            }
          }),
    );
  }
}
