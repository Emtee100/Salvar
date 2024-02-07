import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          //title of the page
          Padding(
            padding: EdgeInsets.only(top: 30,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
// welcome text
          Text(
            "Welcome to Salvar, let's create your account",
            style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
          ),

const SizedBox(height: 20,),
// slider that will switch between email password and phone number
Container(child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    const Text("Email Address"),
    const Text("Phone Number")
  ],
),)
        //UI based on the current option of sign up
        ],
      ),
    ));
  }
}
