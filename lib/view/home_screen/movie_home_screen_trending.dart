import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/utilities/app_utils.dart';
import 'package:movie/view/home_screen/widget/home_drawer.dart';
import 'package:movie/view/home_screen/widget/home_screen_widget.dart';
import 'package:movie/view/home_screen/widget/home_series.dart';
import 'package:movie/widgets/search_screen/movie_search_screen.dart';

final tabIndex = StateProvider((ref) => 0);

class MovieHomeScreen extends ConsumerWidget {
  MovieHomeScreen({super.key});

  final List<String> titles = [
    "Trending Now",
    "Latest Movies",
    "Movies",
    "Series",
    "TV Shows",
    "Up Coming Movies",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = ref.watch(iconBool);
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        backgroundColor: !isLight
            ? const Color.fromARGB(255, 241, 241, 241)
            : const Color(0xff0c1d1f),
        drawer: const HomeDrawer(),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor:
              isLight ? const Color(0xff0c1d1f) : const Color(0xFFFFFFFF),
          toolbarHeight: 35,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu,
                color: isLight
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color(0xff0c1d1f),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: isLight
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color(0xff0c1d1f),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreenMovie(),
                      ));
                },
              ),
            ),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: TabBar(
                isScrollable: true,
                labelColor: isLight
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color(0xff0c1d1f),
                labelStyle: GoogleFonts.exo(
                  fontSize: AppUtils.sw(14, context),
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: GoogleFonts.exo(
                  fontSize: AppUtils.sw(14, context),
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: isLight
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color(0xff0c1d1f),
                onTap: (value) {
                  ref.read(tabIndex.notifier).state = value;
                },
                tabs: const [
                  Tab(
                    text: 'Trending',
                  ),
                  Tab(
                    text: 'New',
                  ),
                  Tab(
                    text: 'Movies',
                  ),
                  Tab(
                    text: 'Series',
                  ),
                  Tab(
                    text: 'TV Shows',
                  ),
                  Tab(
                    text: 'Up Coming Movies',
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: (ref.watch(tabIndex) == 5 || ref.watch(tabIndex) < 3)
              ? HomeScreenWidget(
                  title: titles[ref.watch(tabIndex)],
                )
              : const MovieSeries(),
        ),
      ),
    );
  }
}
