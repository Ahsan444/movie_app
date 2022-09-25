import 'package:flutter/cupertino.dart';
import 'package:movie_app/AppModule/Dashboard/Model/mdoel1.dart';
import 'package:movie_app/AppModule/Dashboard/Model/search_model.dart';


class MovieProvider extends ChangeNotifier {
  bool isShowTextField = true;
  late ModelOne upComingMovieModel;
   SearchMovieModel? searchMovieModel;
   var textController = TextEditingController();
  var list1 = [];

  void showTextField(var value) {
    isShowTextField = value;
    notifyListeners();
  }


  setUpMovieModel(ModelOne model){
    upComingMovieModel = model;
    notifyListeners();
  }
  setSearchMovieModel(SearchMovieModel model){
    searchMovieModel = model;
    notifyListeners();
  }
  ModelOne get getUpComingModel => ModelOne();
  List<Results>? get upComingMovie => upComingMovieModel.results;
  List<ResultsSearch>? get searchMovieResult => searchMovieModel?.results;

}