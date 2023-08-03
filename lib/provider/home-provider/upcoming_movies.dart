import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/services/api_services.dart';

final upComingMovies = FutureProvider<MovieModel>((ref) async {
  return ref.read(apiMovie).getUpcomingMovies();
});
