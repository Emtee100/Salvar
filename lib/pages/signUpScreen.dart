import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:salvar/components/sign_Up.dart';
//import 'package:salvar/components/phone_number.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create your account",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(child: Signupform()),
    );
  }
}
