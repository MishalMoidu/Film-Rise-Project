import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/services/api_services.dart';

final newMoviesProvider = FutureProvider((ref) async {
  return await ref.read(apiMovie).getNewMovies();
});
