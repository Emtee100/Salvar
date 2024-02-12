import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvar/components/email_sign_up.dart';
import 'package:salvar/components/phone_number.dart';
import 'package:salvar/components/signUpCategory.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create your account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Email Address",
            ),
            Tab(
              text: "Phone Number",
            )
          ]),
        ),
        body: const TabBarView(
            children: [
              SingleChildScrollView(child: Signupform()),
              SingleChildScrollView(child: PhoneSignup())
            ]),
      ),
    );
  }
}
