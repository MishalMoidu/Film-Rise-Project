import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';
// ignore: unused_import
import 'package:movie/view/login_screen/movie_login_screen.dart';
import 'package:movie/view/sign_in/widget/movie_signin_text_field_items.dart';
import '../../provider/login-provider/login_provider.dart';
import '../../utilities/app_utils.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create Your Account',
          style: GoogleFonts.exo(
              color: const Color(0xFF3b9d9b),
              fontSize: AppUtils.sw(13, context),
              fontWeight: FontWeight.w500),
        ),
        const BuildTextFieldItems(),
        SizedBox(
          height: AppUtils.sh(0, context),
        ),
        SizedBox(
          width: AppUtils.sw(200, context),
          height: AppUtils.sh(40, context),
          child: Consumer(builder: (_, ref, __) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3b9d9b),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                ref.watch(pageController).animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieHomeScreen(),
                    ));
              },
              child: Text(
                'Continue',
                style: GoogleFonts.exo(
                    color: const Color(0xffffffff),
                    fontSize: AppUtils.sw(18, context),
                    fontWeight: FontWeight.w500),
              ),
            );
          }),
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
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppUtils.sw(20, context),
              vertical: AppUtils.sh(12, context)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF3b9d9b),
                border: Border.all(color: const Color(0xffffffff))),
            width: double.infinity,
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/movie_icon/google.png',
                  width: AppUtils.sw(20, context),
                ),
                SizedBox(
                  width: AppUtils.sw(8, context),
                ),
                Text(
                  'Sign with Google',
                  style: GoogleFonts.exo(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: AppUtils.sw(12, context),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppUtils.sw(20, context),
              vertical: AppUtils.sh(10, context)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF3b9d9b),
                border: Border.all(color: const Color(0xffffffff))),
            width: double.infinity,
            height: AppUtils.sh(44, context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/movie_icon/apple1.png',
                  width: AppUtils.sw(20, context),
                ),
                SizedBox(
                  width: AppUtils.sw(8, context),
                ),
                Text(
                  'Sign In with Apple',
                  style: GoogleFonts.exo(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: AppUtils.sw(12, context),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Consumer(builder: (_, ref, __) {
          return TextButton(
            onPressed: () {
              ref.watch(pageController).animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already have a Account",
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
                    text: 'Sign In',
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
