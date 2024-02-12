import 'package:flutter/material.dart';
import 'package:salvar/components/email_sign_up.dart';

class SignUpOption extends StatefulWidget {
  const SignUpOption({super.key});

  @override
  State<SignUpOption> createState() => _SignUpOptionState();
}

class _SignUpOptionState extends State<SignUpOption> {
  // this variable will tell us whether container wrapping Email address text
  // if it is true then the container should be visible else it will not be visible
  bool _isVisible1 = true;

  // this variable will tell us whether container wrapping Phone Number text
  // if it is true then the container should be visible else it will not be visible
  bool _isVisible2 = false;

  //this function is called when the email address container is tapped
  //and hence turns the value of _isVisible1 to true making the opacity value to be 1.0
  // it also turns the value of _isVisible2 to false making the container with the Phone
  // number text to false
  void onEmailClicked() {
    setState(() {
      _isVisible1 = true;
      _isVisible2 = false;
    });
  }

  //this function is called when the Phone Number container is tapped
  //and hence turns the value of _isVisible2 to true making the opacity value to be 1.0
  // it also turns the value of _isVisible1 to false making the container with the Email
  // address text to false
  void onPhoneNumberClicked() {
    setState(() {
      _isVisible2 = true;
      _isVisible1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondaryContainer),
          // space between the buttons and the outermost container
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            // slider that will switch between email password and phone number
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  // if the isVisible variable is true then the container should be seen else it should be hidden.

                  onTap: () => onEmailClicked(),

                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isVisible1 ? 1.0 : 0.0,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).colorScheme.background),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text("Email Address"),
                        )),
                  ),
                ),
                AnimatedOpacity(
                  // if _isVisible is true then the Container should not be seen else it should be seen.
                  opacity: _isVisible2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () => onPhoneNumberClicked(),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).colorScheme.background),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text("Phone Number"),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
