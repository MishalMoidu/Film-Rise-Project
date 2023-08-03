import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/common_model/model_/series/series_model.dart';
import '../../services/api_services.dart';

final tvShowsProvider = FutureProvider<SeriesModel>((ref) async {
  return ref.read(apiMovie).getTVshowsMovies();
});
