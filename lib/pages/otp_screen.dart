import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinputState = GlobalKey<FormState>();
  late final TextEditingController _pinputController;


  // // creating a reference to the GoRoutes class so as to avoid
  // //the use of the context across async gaps
  //  final goRouter = GoRoutes().routes;
  @override
  void initState() {
    _pinputController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _pinputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String verificationId = GoRouterState.of(context).extra! as String;
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Form(
            key: _pinputState,
            child: Pinput(
              length: 6,
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
              validator: (String? input) {
                if (input == null) {
                  return "Enter the OTP sent";
                } else {
                  return null;
                }
              },
              controller: _pinputController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: GestureDetector(
            onTap: () async {
              if (_pinputState.currentState!.validate()) {
                // sms code that will be tracked by the _pinputController is stored in code variable
                final String smsCode = _pinputController.text;

                // create a credential used to sign in to the app
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: smsCode);

                // sign in the user
                await FirebaseAuth.instance.signInWithCredential(credential).then((value){
                  context.pop();
                  //context.pop();
                });

              }
              
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
