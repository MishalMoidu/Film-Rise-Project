import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/common_model/model_/movie_/movie_model.dart';
import 'package:movie/model/common_model/model_/search/search_model.dart';
import 'package:movie/model/common_model/model_/series/series_model.dart';
import 'package:retry/retry.dart';

class ApiServer {
  static Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org',
      queryParameters: {"api_key": "3c83739a94194b133b4eaa4f60197c90"}));

  Future<MovieModel> getTrendingMovies(bool isDay) async {
    try {
      Response response = await retry(
        () => dio.get('/3/trending/movie/${isDay ? "day" : "week"}'),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return MovieModel();
    }
    return MovieModel();
  }

  Future<MovieModel> getNewMovies() async {
    try {
      Response response = await retry(
        () => dio.get('/3/movie/now_playing'),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return MovieModel();
    }
    return MovieModel();
  }

  Future<MovieModel> getMovieMovies() async {
    try {
      Response response = await dio.get('/3/discover/movie');
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return MovieModel();
    }
    return MovieModel();
  }

  Future<SeriesModel> getTVshowsMovies() async {
    try {
      Response response = await dio.get('/3/discover/tv');
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return seriesModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return SeriesModel();
    }
    return SeriesModel();
  }

  Future<SeriesModel> getSeriesMovies() async {
    try {
      Response response = await dio.get('/3/tv/popular');
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return seriesModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return SeriesModel();
    }
    return SeriesModel();
  }

  Future<MovieModel> getUpcomingMovies() async {
    try {
      Response response = await dio.get('/3/movie/upcoming');
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
    } on DioException catch (e) {
      log(e.toString());
      return MovieModel();
    }
    throw Exception();
  }

  Future<SearchModel> getSearchResult(String userinput) async {
    try {
      Response response = await dio.get("/3/search/multi?query=$userinput");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return searchModelFromJson(jsonString);
      }
      log("Something went wrong on search");
      return SearchModel();
    } on DioException catch (e) {
      log("Error when Search : $e");
      return SearchModel();
    }
  }
}

final apiMovie = Provider<ApiServer>((ref) => ApiServer());
