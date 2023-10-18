import 'package:flutter/material.dart';
import 'package:movie/view/login_screen/movie_login_screen.dart';

// ignore: unused_import
import '../sign_in/movie_signin_widget.dart';

class MovieSplashScreen extends StatefulWidget {
  const MovieSplashScreen({super.key});

  @override
  State<MovieSplashScreen> createState() => _MovieSplashScreenState();
}

class _MovieSplashScreenState extends State<MovieSplashScreen> {
  @override
  void initState() {
    super.initState();
    gotologinpage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
          child: Container(
              child: Image.asset('assets/images/splash_gif/Splashscreen.gif'))),
    );
  }

  Future<void> gotologinpage() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (login) => const MovieLoginScreen(),
      ),
      (route) => false,
    );
  }
}
