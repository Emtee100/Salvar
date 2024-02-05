import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _SreenOneState();
}

class _SreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    //create a variable that will keep track of the screen width divided by 20 so that we can use it in the padding of buttons

    return Scaffold(
        body: SafeArea(
            //Stack that will carry all elements of the screen
            child: Stack(
      children: [
        //load the image
        Image.asset(
          'assets/intro.jpg',
          // its height should be the height of the screen
          height: MediaQuery.sizeOf(context).height,
          // make the image cover the entire screen.
          fit: BoxFit.cover,
        ),
        Positioned(
        //  top: 40,
          child: Column(
            children: [
              const Text(
                """Welcome to Salvar, the best way to save""",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
          
              // this is the button for signing in with email. It is a container whose child is a
              // row.
          
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign in with email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
          
          // button for signing in with email
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign in your phone number",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(color: Colors.white),
              )),
            ],
          ),
        )
      ],
    )));
  }
}
