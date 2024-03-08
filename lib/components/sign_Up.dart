import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signupform extends StatefulWidget {
  const Signupform({super.key});

  @override
  State<Signupform> createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  final _formState = GlobalKey<FormState>();

  late final TextEditingController _passwordController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;

  //Firebase auth variable
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //this variable is set to false and it will be used to control the
  //visibility of the password once the suffix icon is pressed.
  bool _passwordVisible = false;

  //this variable is set to false and it will be used to control the
  //visibility of the confirm password text field once the suffix icon is pressed.
  bool _confirmPasswordVisible = false;

  //this function will change _passwordVisible value hence changing icon and obsure text
  void changePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  //this function will change _confirmpasswordVisible value hence changing icon and obsure text
  void changeconfirmPasswordVisibility() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  Country _selectedCountry = Country(
      phoneCode: "254",
      countryCode: "KE",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Kenya",
      example: "712345678",
      displayName: "Kenya",
      fullExampleWithPlusSign: "+254 712 345 678",
      displayNameNoCountryCode: "KE",
      e164Key: "");

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  //verify Number function
  void sendOtp(String number) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            print(error.code);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          context.go("/otp", extra: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formState,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Welcome to Salvar, let's create your account.",
                style: TextStyle(fontSize: 15),
              ),
            ),
            //full name textfield

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

            //email address textfield

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter an Email Address";
                    } else {
                      return null;
                    }
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                          padding:
                              const EdgeInsets.only(top: 13, left: 8, right: 8),
                          child: InkWell(
                            onTap: () => showCountryPicker(
                                countryListTheme: CountryListThemeData(
                                    bottomSheetHeight:
                                        MediaQuery.of(context).size.height / 2,
                                    inputDecoration: InputDecoration(
                                        labelText: "Search",
                                        hintText: "Search",
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                context: context,
                                showPhoneCode: true,
                                showSearch: true,
                                onSelect: (Country value) {
                                  setState(() {
                                    _selectedCountry = value;
                                  });
                                }),
                            child: Text(
                              "${_selectedCountry.flagEmoji} + ${_selectedCountry.phoneCode}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          )),
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a phone number";
                    } else if (_phoneNumberController.text.length > 9) {
                      return "Enter the phone number with the format 712345678";
                    } else if (_phoneNumberController.text.length < 9) {
                      return "A phone number should at least have 9 digits";
                    } else {
                      return null;
                    }
                  }),
            ),

            //password textfield

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: TextFormField(
                controller: _passwordController,
                obscureText: _passwordVisible ? false : true,
                decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () => changePasswordVisibility(),
                      child: _passwordVisible
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),

                // this function checks whether the password entered in the password field is the same as the
                // confirm password field and also that it is not empty.

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a password";
                  } else if (value != _confirmPasswordController.text) {
                    return "Passwords must be the same";
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //confirm password textfield

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: _confirmPasswordVisible ? false : true,
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    suffixIcon: GestureDetector(
                      onTap: () => changeconfirmPasswordVisibility(),
                      child: _confirmPasswordVisible
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),

                // this function checks whether the password entered in the confirm password field is the same as the
                // password field and also that it is not empty.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Passwords should match";
                  } else if (value != _passwordController.text) {
                    return "Passwords should match";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                if (_formState.currentState!.validate()) {
                  sendOtp("+${_selectedCountry.phoneCode}" +
                      " ${_phoneNumberController.text}");
                  
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
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            )
          ],
        ));
  }
}
