import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../contants/app_contant.dart';
import '../../../utilities/app_utils.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = ref.watch(iconBool);

    return Drawer(
      backgroundColor:
          !isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      AssetImage('assets/images/movie_user_image/userback.png'),
                  backgroundColor: Color.fromARGB(107, 255, 255, 255),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      'Name',
                      style: GoogleFonts.exo(
                          color: isLight
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xff0c1d1f),
                          fontSize: AppUtils.sw(14, context),
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Mohammed Mishal N',
                      style: GoogleFonts.exo(
                          color: isLight
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xff0c1d1f),
                          fontSize: AppUtils.sw(18, context),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                ),
                ListTile(
                  title: Text(
                    'Email',
                    style: GoogleFonts.exo(
                        color: isLight
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff0c1d1f),
                        fontSize: AppUtils.sw(14, context),
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'mishalluizao@gmail.com',
                    style: GoogleFonts.exo(
                        color: isLight
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff0c1d1f),
                        fontSize: AppUtils.sw(18, context),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: GoogleFonts.exo(
                        color: isLight
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff0c1d1f),
                        fontSize: AppUtils.sw(18, context),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                ),
                ListTile(
                  title: Text(
                    'Invite Friend',
                    style: GoogleFonts.exo(
                        color: isLight
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff0c1d1f),
                        fontSize: AppUtils.sw(18, context),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                ),
                ListTile(
                  title: Text(
                    'Help',
                    style: GoogleFonts.exo(
                        color: isLight
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff0c1d1f),
                        fontSize: AppUtils.sw(18, context),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Night Mode',
                        style: GoogleFonts.exo(
                            color: isLight
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xff0c1d1f),
                            fontSize: AppUtils.sw(18, context),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: LiteRollingSwitch(
                          value: ref.watch(iconBool),
                          textOn: 'Light Mode',
                          textOff: 'Dark Mode',
                          textOnColor: const Color(0xff0c1d1f),
                          textOffColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          iconOn: Icons.wb_sunny,
                          animationDuration: const Duration(milliseconds: 100),
                          colorOn: Colors.greenAccent,
                          iconOff: Icons.nights_stay,
                          colorOff: Colors.redAccent,
                          onChanged: (bool state) {
                            ref.read(iconBool.notifier).state = state;
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
