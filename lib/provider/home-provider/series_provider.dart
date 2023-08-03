import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/common_model/model_/series/series_model.dart';
import 'package:movie/services/api_services.dart';

final seriesProvider = FutureProvider<SeriesModel>((ref) async {
  return ref.read(apiMovie).getSeriesMovies();
});

final carouselIndex = StateProvider((ref) => 0);
