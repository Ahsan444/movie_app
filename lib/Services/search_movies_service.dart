import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/AppModule/Dashboard/Model/search_model.dart';

class SearchMovieService {

 Future<SearchMovieModel> getSearchResults(BuildContext context,String query)async {
   final String searchUrl = 'https://api.themoviedb.org/3/search/movie?api_key=133532731573b0192f31e2607a7e09bb&language=en-US&query=$query&page=1&include_adult=false';
   final Dio dio = Dio();
   final Response response;
   SearchMovieModel responseModel = SearchMovieModel();
   try{
      response = await dio.get(searchUrl);
      if(response.statusCode == 200){
        responseModel = SearchMovieModel.fromJson(response.data);
        debugPrint('---------> Search data: ${response.data}');
      }
    } on DioError catch(e){
      debugPrint('error while getting the data: ${e.message}');
   }
   return responseModel;
 }
}