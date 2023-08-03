import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/common_model/model_/search/search_model.dart';
import 'package:movie/services/api_services.dart';

final searchProvider =
    FutureProvider.family<SearchModel, String>((ref, userinput) {
  return ref.read(apiMovie).getSearchResult(userinput);
});

final textProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
