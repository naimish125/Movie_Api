import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Screens/model/movie_model.dart';

class ApiHelper
{
  Future<MovieDetails> MovieGerApi(String movie)
  async {
    Uri link = Uri.parse("https://imdb8.p.rapidapi.com/auto-complete?q=$movie");
    var data = await http.get(link,headers:{"X-RapidAPI-Key":"8c97d5c454msh72a9a81f9fe0357p12be3cjsn6fd2c887d5d0","X-RapidAPI-Host":"imdb8.p.rapidapi.com"});
    var json = jsonDecode(data.body);
    MovieDetails jsonData = MovieDetails.fromJson(json);
    return jsonData;
  }
}
