import 'package:flutter/material.dart';
import 'package:movie/view/login-screen/movie_login_screen.dart';

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
      backgroundColor: Color(0xffffffff),
      body: Center(
          child: Container(
              child: Image.asset('assets/images/splash_gif/Splashscreen.gif'))),
    );
  }

  Future<void> gotologinpage() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (login) => MovieLoginScreen(),
      ),
      (route) => false,
    );
  }
}
