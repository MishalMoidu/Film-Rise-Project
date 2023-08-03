// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movie/provider/login-provider/login_provider.dart';
// import 'package:movie/view/home_screen/movie_home_screen_trending.dart';

// class LoginIn extends StatelessWidget {
//   const LoginIn({
//     super.key,
//     required this.sw,
//     required this.sh,
//   });

//   final double sw;
//   final double sh;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Text(
//             'Sign In Your Account',
//             style: GoogleFonts.exo(
//                 color: const Color(0xFF3b9d9b),
//                 fontSize: sw * (13 / Responsive.width),
//                 fontWeight: FontWeight.w500),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: sw * (20 / Responsive.width),
//                 vertical: sh * (10 / Responsive.height)),
//             child: SizedBox(
//               height: sh * (50 / Responsive.height),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                       onPressed: () {}, icon: Icon(Icons.email_outlined)),
//                   labelText: 'Enter Your EmailAddress',
//                   labelStyle: GoogleFonts.exo(
//                       color: const Color.fromARGB(255, 168, 168, 168)),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: Color(0xFF3b9d9b), width: 1),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: Color(0xFF3b9d9b), width: 1),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: sw * (20 / Responsive.width),
//                 vertical: sh * (10 / Responsive.height)),
//             child: SizedBox(
//               height: sh * (50 / Responsive.height),
//               child: TextField(
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.visibility_off_outlined)),
//                   labelText: 'Password',
//                   labelStyle: GoogleFonts.exo(
//                       color: const Color.fromARGB(255, 168, 168, 168)),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: Color(0xFF3b9d9b), width: 1),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: Color(0xFF3b9d9b), width: 1),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: sh * (10 / Responsive.height),
//           ),
//           SizedBox(
//             width: sw * (200 / Responsive.width),
//             height: sh * (40 / Responsive.height),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF3b9d9b),
//                   shape: BeveledRectangleBorder(
//                       borderRadius: BorderRadius.circular(10))),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       transitionDuration: Duration(milliseconds: 100),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) =>
//                               FadeTransition(
//                         opacity: animation,
//                         child: child,
//                       ),
//                       pageBuilder: (context, animation, secondaryAnimation) =>
//                           MovieHomeScreen(),
//                     ));
//               },
//               child: Text(
//                 'Continue',
//                 style: GoogleFonts.exo(
//                     color: const Color(0xffffffff),
//                     fontSize: sw * (18 / Responsive.width),
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: sh * (10 / Responsive.height),
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(child: DottedLine()),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'or',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color.fromARGB(255, 207, 207, 207),
//                   ),
//                 ),
//               ),
//               Expanded(child: DottedLine()),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: sw * (20 / Responsive.width),
//                 vertical: sh * (12 / Responsive.height)),
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color(0xFF3b9d9b),
//                   border: Border.all(color: const Color(0xffffffff))),
//               width: double.infinity,
//               height: 44,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/movie_icon/google.png',
//                     width: sw * (20 / Responsive.width),
//                   ),
//                   SizedBox(
//                     width: sw * (8 / Responsive.width),
//                   ),
//                   Text(
//                     'Sign up with Google',
//                     style: GoogleFonts.exo(
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         fontSize: sw * (12 / Responsive.width),
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: sw * (20 / Responsive.width),
//                 vertical: sh * (10 / Responsive.height)),
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color(0xFF3b9d9b),
//                   border: Border.all(color: const Color(0xffffffff))),
//               width: double.infinity,
//               height: sh * (44 / Responsive.height),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/movie_icon/apple1.png',
//                     width: sw * (20 / Responsive.width),
//                   ),
//                   SizedBox(
//                     width: sw * (8 / Responsive.width),
//                   ),
//                   Text(
//                     'Sign up with Apple',
//                     style: GoogleFonts.exo(
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         fontSize: sw * (12 / Responsive.width),
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Consumer(builder: (_, ref, __) {
//             return TextButton(
//               onPressed: () {
//                 ref.watch(pageController).animateToPage(
//                       1,
//                       duration: Duration(milliseconds: 300),
//                       curve: Curves.easeIn,
//                     );
//               },
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Don't i have a Account",
//                       style: GoogleFonts.exo(
//                           color: Color.fromRGBO(0, 0, 0, 1),
//                           fontSize: sw * (12 / Responsive.width),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const TextSpan(
//                       text: ' ? ',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: 'Sign Up',
//                       style: GoogleFonts.exo(
//                           color: const Color.fromRGBO(18, 57, 230, 1),
//                           fontSize: sw * (12 / Responsive.width),
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           })
//         ],
//       ),
//     );
//   }
// }
