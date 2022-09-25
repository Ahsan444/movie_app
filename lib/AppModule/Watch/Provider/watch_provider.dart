import 'package:flutter/material.dart';
import '../Model/watch_movie_model.dart';

class WatchMovieProvider extends ChangeNotifier {
   late WatchMovieModel watchMovieModel;

   setWatchMovieModel(WatchMovieModel model){
     watchMovieModel = model;
     notifyListeners();
   }
    WatchMovieModel get getWatchMovieModel => watchMovieModel;
   List<Genres>? get watchMovieName => watchMovieModel.genres;

}