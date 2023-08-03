import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/utilities/app_utils.dart';
import 'package:movie/utilities/keys.dart';
import 'package:movie/view/home_screen/movie_home_screen_trending.dart';

class MovieDetailScreen extends ConsumerWidget {
  const MovieDetailScreen({super.key, required this.provider});
  final Result provider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    int tabBarIndex = ref.watch(tabIndex);
    final bool isLight = ref.watch(iconBool);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            !isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color:
                  isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: isLight
                            ? const Color(0xFF5D5D5D)
                            : const Color(0xff0c1d1f).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset:
                            const Offset(2, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    "${AppUrls.imageUrl}/w780/${provider.backdropPath}",
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                    height: AppUtils.sh(230, context),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: AppUtils.sh(140, context),
                        width: AppUtils.sw(100, context),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: isLight
                                    ? const Color(0xFF5D5D5D)
                                    : const Color(0xff0c1d1f).withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    2, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.network(
                            "${AppUrls.imageUrl}/w500/${provider.posterPath}",
                            fit: BoxFit.cover,
                            width: AppUtils.sw(130, context),
                            height: AppUtils.sh(180, context),
                          ),
                        ),
                      ),

                      Positioned(
                        left: AppUtils.sw(150, context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              size: AppUtils.sw(26, context),
                            ),
                            SizedBox(
                              width: AppUtils.sw(7, context),
                            ),
                            Text(
                              DateFormat("yyyy/MMM/dd")
                                  .format(provider.releaseDate!),
                              style: GoogleFonts.exo(
                                  color: isLight
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xff0c1d1f),
                                  fontSize: AppUtils.sw(26, context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: AppUtils.sh(12, context),
                      // ),
                      Positioned(
                        left: AppUtils.sw(150, context),
                        top: AppUtils.sh(47, context),
                        child: Row(
                          children: [
                            SizedBox(
                              width: AppUtils.sw(7, context),
                            ),
                            Text(
                              provider.popularity!.toString(),
                              style: GoogleFonts.exo(
                                  color: isLight
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xff0c1d1f),
                                  fontSize: AppUtils.sw(25, context),
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: AppUtils.sw(150, context),
                        top: AppUtils.sh(87, context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: AppUtils.sw(30, context),
                              color: Colors.amber[500],
                            ),
                            SizedBox(
                              width: AppUtils.sw(7, context),
                            ),
                            Text(
                              "${provider.voteAverage!.toStringAsFixed(1)}/10",
                              style: GoogleFonts.exo(
                                  color: isLight
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xff0c1d1f),
                                  fontSize: AppUtils.sw(25, context),
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: AppUtils.sh(20, context),
              ),
              ListTile(
                title: Text(
                  provider.title!,
                  style: GoogleFonts.exo(
                      color: isLight
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xff0c1d1f),
                      fontSize: AppUtils.sw(26, context),
                      fontWeight: FontWeight.w900),
                ),
              ),
              Divider(
                color:
                    isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
              ),
              Text(provider.overview!)
            ],
          ),
        ),
      ),
    );
  }
}
