import 'package:go_router/go_router.dart';
//import 'package:salvar/components/sign_Up.dart';
import 'package:salvar/pages/authPage.dart';
import 'package:salvar/pages/homePage.dart';
//import 'package:salvar/pages/onBoardingScreen.dart';
import 'package:salvar/pages/otp_screen.dart';
import 'package:salvar/pages/signUpScreen.dart';

// This class consists of all routes and sub routes of the app.
// The class will be used to encapsulate these routes and prevent tampering
class GoRoutes {
  // create a router variable of type GoRouter that will contain the routes
  // it is made private to ensure that it is not tampered with from outside the class
  final GoRouter _router = GoRouter(routes: [
    // home page route
    GoRoute(path: "/", builder: (context, state) => const AuthPage()),
    // signup page route
    GoRoute(
        path: "/signup",
        builder: (context, state) => const Signup(),
        // routes: [
        //   GoRoute(path: "otp", builder: (context, state) => const OtpScreen()),
        // ]
        ),

        GoRoute(path: "/otp", builder: (context, state) => const OtpScreen()),
        GoRoute(path: "/home", builder: (context, state) => const HomePage()),
  ]);
  //getter function that will provide the router variable
  get routes => _router;
}
