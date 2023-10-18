import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/app_utils.dart';

class BuildAppleGoogle extends StatelessWidget {
  const BuildAppleGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  width: AppUtils.sw(18, context),
                ),
                SizedBox(
                  width: AppUtils.sw(8, context),
                ),
                Text(
                  'Sign up with Google',
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
                  'Sign up with Apple',
                  style: GoogleFonts.exo(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: AppUtils.sw(12, context),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
