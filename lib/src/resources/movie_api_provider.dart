import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '91d3db6b9f81a26aaee148ae58b65411'; // your api key
  
  Future<ItemModel> fetchMovieList() async {
    dev.log('MovieApiProvider..fetchMovieList(); entered', name: 'RESOURCE');
    final response = await client.get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    dev.log('MovieApiProvider..fetchMovieList();\n${response.body.substring(0,100)}', name: 'RESOURCE');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // IF the call was not successful, throw an error
      throw Exception('MovieApiProvider..fetchMovieList();\nerror: Failed to load post');
    }
  }
}