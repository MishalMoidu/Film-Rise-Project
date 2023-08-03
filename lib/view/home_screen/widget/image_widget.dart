import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/contants/app_contant.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/utilities/keys.dart';
import 'package:movie/widgets/detail_screen/movie_detail_screen.dart';
import '../../../utilities/app_utils.dart';

class BuildImage extends ConsumerWidget {
  const BuildImage({
    super.key,
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = ref.watch(iconBool);

    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(provider: result),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${AppUrls.imageUrl}/w500${result.posterPath!}"),
                    fit: BoxFit.cover,
                  )),
              width: AppUtils.sw(360, context) * 0.8,
              height: AppUtils.sh(420, context),
            ),
          ),
          Text(
            result.title!,
            textAlign: TextAlign.center,
            style: GoogleFonts.exo(
                fontSize: AppUtils.sw(26, context),
                fontWeight: FontWeight.w800,
                color: !isLight
                    ? const Color(0xff0c1d1f)
                    : const Color(0xFFFFFFFF)),
          ),
          Text(
            "Vote: ${result.voteAverage!.toStringAsFixed(2)}",
            style: GoogleFonts.exo(
                fontSize: AppUtils.sw(15, context),
                fontWeight: FontWeight.w500,
                color: !isLight
                    ? const Color(0xff0c1d1f)
                    : const Color(0xFFFFFFFF)),
          ),
          SizedBox(
            height: AppUtils.sh(10, context),
          ),
        ],
      ),
    );
  }
}
