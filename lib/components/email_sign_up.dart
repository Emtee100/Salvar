import 'package:flutter/material.dart';

class Signupform extends StatefulWidget {
  const Signupform({super.key});

  @override
  State<Signupform> createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  final _formState = GlobalKey<FormState>();

  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
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

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formState,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: const Text("Welcome to Salvar, let's create your account.",style: TextStyle(
                fontSize: 15
              ),),
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
                  print('Hi');
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
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            )
          ],
        ));
  }
}
