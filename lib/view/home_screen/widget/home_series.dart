import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/model/common_model/model_/series/series_model.dart';
import 'package:movie/provider/home-provider/series_provider.dart';
import 'package:movie/provider/home-provider/tv_shows_provider.dart';
import 'package:movie/utilities/keys.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';
import 'package:movie/widgets/detail_screen/movie_detail_screen2.dart';
import '../../../contants/app_contant.dart';
import '../../../utilities/app_utils.dart';

class MovieSeries extends ConsumerWidget {
  const MovieSeries({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = ref.watch(iconBool);
    int tabBarIndex = ref.watch(tabIndex);
    final data = tabBarIndex == 3
        ? ref.watch(seriesProvider)
        : ref.watch(tvShowsProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppUtils.sh(10, context)),
        child: data.when(
          data: (data) => buildListSeries(context, isLight, data, ref),
          error: (error, stackTrace) => Center(
            child: Text('ERROR \n $error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Column buildListSeries(
      BuildContext context, bool isLight, SeriesModel data, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: AppUtils.sh(24, context),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
              height: AppUtils.sh(420, context),
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                ref.read(carouselIndex.notifier).state = index;
              },
              enlargeStrategy: CenterPageEnlargeStrategy.height),
          itemCount: data.results!.length,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen2(
                      seriestool: data,
                      inx: index,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${AppUrls.imageUrl}/w500${data.results![index].posterPath!}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: AppUtils.sw(360, context) * 0.8,
                height: AppUtils.sh(120, context),
              ),
            );
          },
        ),
        SizedBox(
          height: AppUtils.sh(10, context),
        ),
        Text(
          data.results![ref.watch(carouselIndex)].name!,
          style: GoogleFonts.exo(
            fontSize: AppUtils.sw(18, context),
            fontWeight: FontWeight.w800,
            color: !isLight
                ? const Color(0xff0c1d1f)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SingleChildScrollView(
          child: buildGrid(context, data),
        ),
      ],
    );
  }

  GridView buildGrid(BuildContext context, SeriesModel data) {
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
                    MovieDetailScreen2(seriestool: data, inx: index),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "${AppUrls.imageUrl}/w500${data.results![index].posterPath!}",
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
