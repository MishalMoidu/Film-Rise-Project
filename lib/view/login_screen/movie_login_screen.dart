import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/provider/login-provider/login_provider.dart';
import 'package:movie/utilities/app_utils.dart';
// ignore: unused_import
import 'package:movie/view/login_screen/widgets/movie_login_widget.dart';
import 'package:movie/view/login_screen/widgets/custom_shape_paint.dart';
import 'package:movie/view/sign_in/movie_signin_widget.dart';

class MovieLoginScreen extends StatefulWidget {
  const MovieLoginScreen({super.key});

  @override
  State<MovieLoginScreen> createState() => _MovieLoginScreenState();
}

class _MovieLoginScreenState extends State<MovieLoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _radiusAnimation = Tween(begin: 80.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double sw = (MediaQuery.of(context).size.width);
    double sh = (MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(sw, (sh * 0.40).toDouble()),
            painter: RPSCustomPainter(),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: AppUtils.sh(25, context),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: AppUtils.sw(200, context),
                          height: AppUtils.sh(200, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(_radiusAnimation.value),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff81bea9).withOpacity(0.8),
                                  offset: const Offset(-6.0, -6.0),
                                ),
                              ],
                              color: const Color(0xff056171)),
                        ),
                      ],
                    ),
                    Container(
                      width: AppUtils.sw(180, context),
                      height: AppUtils.sh(180, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(_radiusAnimation.value),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 228, 207, 174)
                                .withOpacity(0.8),
                            offset: const Offset(-6.0, -6.0),
                          ),
                        ],
                        color: const Color.fromARGB(255, 223, 148, 27),
                      ),
                    ),
                    Container(
                        width: AppUtils.sw(160, context),
                        height: AppUtils.sh(160, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(_radiusAnimation.value),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 148, 45, 93)
                                  .withOpacity(0.8),
                              offset: const Offset(-6.0, -6.0),
                            ),
                          ],
                          color: const Color.fromARGB(255, 241, 251, 125),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/images/movie_icon/Icon.png',
                          // fit: BoxFit.cover,
                          width: AppUtils.sw(130, context),
                        ))),
                  ],
                ),
                SizedBox(
                  height: AppUtils.sh(35, context),
                ),
                Text(
                  'Film Rise',
                  style: GoogleFonts.righteous(
                      color: const Color(0xFF3b9d9b),
                      fontSize: AppUtils.sw(35, context),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: AppUtils.sh(4, context),
                ),
                SizedBox(
                  height: sh * 0.6,
                  child: Consumer(builder: (_, ref, __) {
                    return PageView(
                      controller: ref.watch(pageController),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        LoginIn(
                          sh: sh,
                          sw: sw,
                        ),
                        const SignIn(),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
