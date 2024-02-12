import 'package:flutter/material.dart';

class PhoneSignup extends StatefulWidget {
  const PhoneSignup({super.key});

  @override
  State<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: const Text("Welcome to Salvar, let's create your account.",style: TextStyle(
              fontSize: 15
          ),),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: _fullNameController,
              decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your full names";
                } else {
                  return null;
                }
              }),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your full names";
                } else {
                  return null;
                }
              }),
        ),
      ],
    ));
  }
}
