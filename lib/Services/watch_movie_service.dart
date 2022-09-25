import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/AppModule/Watch/Model/watch_movie_model.dart';
import 'package:movie_app/AppModule/Watch/Provider/watch_provider.dart';
import 'package:provider/provider.dart';

class WatchMovieService {
  static const WATCH_MOVIE_CATEGORYURL =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=133532731573b0192f31e2607a7e09bb#";
  Future<WatchMovieModel> getCategory(BuildContext context)  async {
    final Dio dio = Dio();
    final Response response;

    WatchMovieModel responseModel = WatchMovieModel();

    try {
      //getting the data from the api
      response = await dio.get(WATCH_MOVIE_CATEGORYURL);
      if (response.statusCode == 200) {
        //checking the response
        responseModel = WatchMovieModel.fromJson(response.data);
        Provider.of<WatchMovieProvider>(context,listen: false)
            .setWatchMovieModel(responseModel);

        debugPrint('---------> Category data: ${response.data}');

      }
    } on DioError catch (e) {
      debugPrint('error while getting the data: ${e.message}');
    }
    return responseModel;
  }
}
