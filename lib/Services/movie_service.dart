import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/AppModule/Dashboard/Model/mdoel1.dart';
import 'package:provider/provider.dart';
import '../AppModule/Dashboard/Provider/movie_provider.dart';

class MovieService  {

  static const BASE_URL = 'https://api.themoviedb.org/3/movie/upcoming?api_key=133532731573b0192f31e2607a7e09bb';
  Future<ModelOne> getUpcomingMovies(BuildContext context)  async {
    final Dio dio = Dio();
    final Response response;

    ModelOne responseModel = ModelOne();

    try {
      //getting the data from the api
      response = await dio.get(BASE_URL);
      if (response.statusCode == 200) {
        //checking the response
        responseModel = ModelOne.fromJson(response.data);
        //mapping the response with the provider setUSerModel
        Provider.of<MovieProvider>(context,listen: false)
            .setUpMovieModel(responseModel);

        debugPrint('data is coming from the api: ${response.data}');

      }
    } on DioError catch (e) {
      debugPrint('error while getting the data: ${e.message}');
    }
    return responseModel;
  }


}
