import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/services/api_services.dart';

final trendingProvider =
    FutureProvider.family<MovieModel, bool>((ref, isDay) async {
  return await ref.read(apiMovie).getTrendingMovies(isDay);
});

final trendingSwitch = StateProvider<bool>((ref) => true);
