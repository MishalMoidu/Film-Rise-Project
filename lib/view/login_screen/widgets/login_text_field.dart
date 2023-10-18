import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/app_utils.dart';

class BuildLoginTextField extends StatelessWidget {
  const BuildLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppUtils.sw(20, context),
            vertical: AppUtils.sh(13, context),
          ),
          child: SizedBox(
            height: AppUtils.sh(50, context),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined)),
                labelText: 'Enter Your EmailAddress',
                labelStyle: GoogleFonts.exo(
                    color: const Color.fromARGB(255, 168, 168, 168)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3b9d9b), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3b9d9b), width: 1),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppUtils.sw(20, context),
              vertical: AppUtils.sh(10, context)),
          child: SizedBox(
            height: AppUtils.sh(50, context),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined)),
                labelText: 'Password',
                labelStyle: GoogleFonts.exo(
                    color: const Color.fromARGB(255, 168, 168, 168)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3b9d9b), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3b9d9b), width: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
