import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTP Verification",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          child: Text(
            "We have sent a verification SMS. Please enter it here.",
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Pinput(
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: GestureDetector(
            onTap: () {
              // if (_formState.currentState!.validate()) {
              //   context.push("/otp");
              // }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Verify OTP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
