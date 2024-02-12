import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      alignment: AlignmentDirectional.center,
      children: [
        //load the image
        Image.asset(
          'assets/intro.jpg',
          // its height should be the height of the screen
          height: MediaQuery.sizeOf(context).height,
          // make the image cover the entire screen.
          fit: BoxFit.cover,
        ),

        // we'll use a positioned widget to position the Column to the bottom of the stack
        Positioned(
          bottom: 40,
          left: 0,

          // we'll use a ConstrainedBox to ensure that the column and its context do not go past the screen's width
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    """Welcome to Salvar, the best way to invest""",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // this is the button for signing in with email. It is a container whose child is a
                // row.

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don\'t have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: ()=>context.push("/signup"),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.orange),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
