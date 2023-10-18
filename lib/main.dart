// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';
import 'package:movie/view/home_screen/widget/home_series.dart';
import 'package:movie/view/login_screen/movie_login_screen.dart';
import 'package:movie/view/sign_in/movie_signin_widget.dart';
import 'package:movie/view/splash_screen/movie_splash_screen.dart';
import 'package:movie/widgets/detail_screen/movie_detail_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(iconBool)
          ? AppConstants.darkTheme
          : AppConstants.lightTheme,
      home: MovieHomeScreen(),
    );
  }
}
