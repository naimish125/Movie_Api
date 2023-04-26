import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/api_helper.dart';
import '../model/movie_model.dart';

class SearchController extends GetxController
{
  RxString movie = "Bahubali".obs;
  TextEditingController txtmovie = TextEditingController();
  Future<MovieDetails> movieGetApiCalling(String movie)
  async {
    ApiHelper api = ApiHelper();
    MovieDetails jsonData = await api.MovieGerApi(movie);
    return jsonData;
  }
}