import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/model/common_model/model_/search/search_model.dart';
import 'package:movie/provider/search-provider/search_provider.dart';
import 'package:movie/utilities/app_utils.dart';
import 'package:movie/utilities/keys.dart';
import 'package:movie/widgets/detail_screen/movie_detail_screen_search.dart';

// ignore: must_be_immutable
class SearchScreenMovie extends ConsumerWidget {
  SearchScreenMovie({
    super.key,
  });

  AsyncValue<SearchModel>? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = ref.watch(iconBool);

    return Scaffold(
      backgroundColor:
          !isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
      appBar: AppBar(
        backgroundColor:
            !isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color:
                  isLight ? const Color(0xFFFFFFFF) : const Color(0xff0c1d1f),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppUtils.sh(5, context),
              ),
              Text('Search For A Movie',
                  style: GoogleFonts.exo(
                    fontSize: AppUtils.sw(20, context),
                    fontWeight: FontWeight.w800,
                    backgroundColor: !isLight
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xff0c1d1f),
                  )),
              SizedBox(
                height: AppUtils.sh(5, context),
              ),
              TextField(
                controller: ref.watch(textProvider),
                style: TextStyle(
                    color: !isLight
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xff0c1d1f)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isLight
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xff0c1d1f),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: GoogleFonts.exo(
                      fontSize: AppUtils.sw(15, context),
                      fontWeight: FontWeight.w800,
                      color: !isLight
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xff0c1d1f)),
                  counterStyle: GoogleFonts.exo(
                      fontSize: AppUtils.sw(15, context),
                      fontWeight: FontWeight.w800,
                      color: !isLight
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xff0c1d1f)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (ref.watch(textProvider).text != "") {
                        ref.watch(searchProvider(ref.watch(textProvider).text));
                      }
                    },
                    icon: Icon(
                      Icons.search,
                      color: !isLight
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xff0c1d1f),
                    ),
                  ),
                  hintStyle: GoogleFonts.exo(
                      fontSize: AppUtils.sw(15, context),
                      fontWeight: FontWeight.w800,
                      color: !isLight
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xff0c1d1f)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(
                height: AppUtils.sh(30, context),
              ),
              ref.watch(textProvider).text == ""
                  ? const SizedBox()
                  : ref
                      .watch(searchProvider(ref.watch(textProvider).text))
                      .when(
                        data: (data) => ListView.builder(
                          itemCount: data.results!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => MovieDetailScreen2(
                            //           inx: index,seriestool: ),
                            //     )),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailSearchScreen(
                                        data: data,
                                        index: index,
                                      ),
                                    ));
                              },
                              child: ListTile(
                                leading: data.results![index].posterPath ==
                                            null &&
                                        data.results![index].profilePath == null
                                    ? const Icon(Icons.block_sharp)
                                    : Image(
                                        image: NetworkImage(
                                            "${AppUrls.imageUrl}/w500${data.results![index].posterPath ?? data.results![index].profilePath}"),
                                        fit: BoxFit.cover,
                                        width: AppUtils.sw(40, context),
                                        height: AppUtils.sh(100, context),
                                      ),
                                title: Text(
                                  data.results![index].title ??
                                      data.results![index].name!,
                                  style: GoogleFonts.exo(
                                    fontSize: AppUtils.sw(20, context),
                                    fontWeight: FontWeight.w800,
                                    color: isLight
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xff0c1d1f),
                                  ),
                                ),
                                subtitle: data.results![index].releaseDate !=
                                        null
                                    ? Text(
                                        // "22/22/2222"
                                        DateFormat("yyyy/MMM/dd").format(
                                            data.results![index].releaseDate!),
                                        style: GoogleFonts.exo(
                                            color: isLight
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xff0c1d1f),
                                            fontSize: AppUtils.sw(13 , context),
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Text(''),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                      data.results![index].voteAverage == null
                                          ? ""
                                          : data.results![index].voteAverage
                                              .toString(),
                                      style: GoogleFonts.exo(
                                        fontSize: AppUtils.sw(14, context),
                                        fontWeight: FontWeight.w800,
                                        color: isLight
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xff0c1d1f),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text(
                            'Somthing went wrong...',
                            style: GoogleFonts.exo(
                              fontSize: AppUtils.sw(20, context),
                              fontWeight: FontWeight.w800,
                              color: isLight
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xff0c1d1f),
                            ),
                          ),
                        ),
                        loading: () => Center(
                          child: Text(
                            'Loading...',
                            style: GoogleFonts.exo(
                              fontSize: AppUtils.sw(20, context),
                              fontWeight: FontWeight.w800,
                              color: isLight
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xff0c1d1f),
                            ),
                          ),
                        ),
                      ),
              // data == null
              //     ? const SizedBox()
              //     : data!.isLoading
              //         ? Center(
              //             child: Text(
              //               'Loading...',
              //               style: GoogleFonts.exo(
              //                 fontSize: AppUtils.sw(20, context),
              //                 fontWeight: FontWeight.w800,
              //                 color: isLight
              //                     ? const Color(0xFFFFFFFF)
              //                     : const Color(0xff0c1d1f),
              //               ),
              //             ),
              //           )
              //         : data!.hasValue
              //             ? ListView.builder(
              //                 itemCount: 2,
              //                 shrinkWrap: true,
              //                 itemBuilder: (context, index) => ListTile(
              //                   leading: Image(
              //                     image: const AssetImage(
              //                         'assets/images/movie_images/new_list/king.jpeg'),
              //                     fit: BoxFit.cover,
              //                     width: AppUtils.sw(40, context),
              //                     height: AppUtils.sh(100, context),
              //                   ),
              //                   title: Text(
              //                     'msdsds',
              //                     style: GoogleFonts.exo(
              //                       fontSize: AppUtils.sw(20, context),
              //                       fontWeight: FontWeight.w800,
              //                       color: isLight
              //                           ? const Color(0xFFFFFFFF)
              //                           : const Color(0xff0c1d1f),
              //                     ),
              //                   ),
              //                   subtitle: Text(
              //                     'asdasd',
              //                     style: GoogleFonts.exo(
              //                       fontSize: AppUtils.sw(14, context),
              //                       fontWeight: FontWeight.w800,
              //                       color: isLight
              //                           ? const Color(0xFFFFFFFF)
              //                           : const Color(0xff0c1d1f),
              //                     ),
              //                   ),
              //                   trailing: const Text('sdssd'),
              //                 ),
              //               )
              //             : Center(
              //                 child: Text(
              //                   'Somthing went wrong...',
              //                   style: GoogleFonts.exo(
              //                     fontSize: AppUtils.sw(20, context),
              //                     fontWeight: FontWeight.w800,
              //                     color: isLight
              //                         ? const Color(0xFFFFFFFF)
              //                         : const Color(0xff0c1d1f),
              //                   ),
              //                 ),
              //               ),
            ],
          ),
        ),
      ),
    );
  }
}
