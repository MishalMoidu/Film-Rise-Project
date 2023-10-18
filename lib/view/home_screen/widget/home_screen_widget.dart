import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/provider/home-provider/movie_movies_provider.dart';
import 'package:movie/provider/home-provider/new_provider.dart';
import 'package:movie/provider/home-provider/trending_provider.dart';
import 'package:movie/provider/home-provider/upcoming_movies.dart';
import 'package:movie/utilities/app_utils.dart';
import 'package:movie/utilities/keys.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';
import 'package:movie/view/home_screen/widget/image_widget.dart';
import 'package:movie/widgets/detail_screen/movie_detail_screen.dart';

class HomeScreenWidget extends ConsumerWidget {
  const HomeScreenWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tabBarIndex = ref.watch(tabIndex);
    final bool isLight = ref.watch(iconBool);

    final data = tabBarIndex == 0
        ? ref.watch(trendingProvider(ref.watch(trendingSwitch)))
        : tabBarIndex == 1
            ? ref.watch(newMoviesProvider)
            : tabBarIndex == 2
                ? ref.watch(moiveProvider)
                : ref.watch(upComingMovies);

    return data.when(
      data: (data) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppUtils.sh(10, context)),
        child: Column(
          children: [
            SizedBox(
              height: AppUtils.sh(24, context),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                  height: AppUtils.sh(500, context),
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              itemCount: data.results!.length,
              itemBuilder: (context, index, realIndex) {
                return BuildImage(
                  result: data.results![index],
                );
              },
            ),
            SizedBox(
              height: AppUtils.sh(10, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.exo(
                    fontSize: AppUtils.sw(18, context),
                    fontWeight: FontWeight.w800,
                    color: !isLight
                        ? const Color(0xff0c1d1f)
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                tabBarIndex == 0
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: !isLight
                                  ? const Color(0xff0c1d1f)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              width: AppUtils.sw(2, context)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: LiteRollingSwitch(
                          value: ref.watch(trendingSwitch),
                          textOn: 'Today',
                          textOff: 'This Week',
                          width: AppUtils.sw(120, context),
                          textOnColor: const Color(0xff0c1d1f),
                          textOffColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          iconOn: Icons.arrow_forward_ios_outlined,
                          animationDuration: const Duration(milliseconds: 100),
                          colorOn: Colors.greenAccent,
                          iconOff: Icons.arrow_back_ios_new,
                          colorOff: Colors.redAccent,
                          onChanged: (state) {
                            ref.read(trendingSwitch.notifier).state = state;
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              height: AppUtils.sh(10, context),
            ),
            gridviewlbuilder(context, data)
          ],
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Text('ERROR \n $error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  GridView gridviewlbuilder(BuildContext context, MovieModel data) {
    return GridView.builder(
      itemCount: data.results!.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: AppUtils.sh(250, context),
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailScreen(provider: data.results![index]),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "${AppUrls.imageUrl}/w500${data.results![index].posterPath}",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
