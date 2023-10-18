import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/provider/login-provider/login_provider.dart';
import 'package:movie/utilities/app_utils.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';

import 'login_apple_google.dart';
import 'login_text_field.dart';

class LoginIn extends StatelessWidget {
  const LoginIn({
    super.key,
    required this.sw,
    required this.sh,
  });

  final double sw;
  final double sh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign In Your Account',
          style: GoogleFonts.exo(
              color: const Color(0xFF3b9d9b),
              fontSize: AppUtils.sw(13, context),
              fontWeight: FontWeight.w500),
        ),
        const BuildLoginTextField(),
        SizedBox(height: AppUtils.sh(10, context)),
        SizedBox(
          width: AppUtils.sw(200, context),
          height: AppUtils.sh(40, context),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3b9d9b),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 100),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MovieHomeScreen(),
                  ));
            },
            child: Text(
              'Continue',
              style: GoogleFonts.exo(
                  color: const Color(0xffffffff),
                  fontSize: AppUtils.sw(18, context),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: AppUtils.sh(10, context),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: DottedLine()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'or',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 207, 207, 207),
                ),
              ),
            ),
            Expanded(child: DottedLine()),
          ],
        ),
        const BuildAppleGoogle(),
        Consumer(builder: (_, ref, __) {
          return TextButton(
            onPressed: () {
              ref.watch(pageController).animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't i have a Account",
                    style: GoogleFonts.exo(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: AppUtils.sw(12, context),
                        fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(
                    text: ' ? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.exo(
                        color: const Color.fromRGBO(18, 57, 230, 1),
                        fontSize: AppUtils.sw(12, context),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
