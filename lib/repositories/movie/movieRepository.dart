import 'dart:convert';

import 'package:my_movie_list/models/movie/movie.dart';
import 'package:my_movie_list/repositories/movie/baseMovieRepository.dart';
import 'package:http/http.dart' as http;

class MovieRepository extends BaseMovieRepository {
  @override
  Future<Movie> getMovieById(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/$id?api_key=$movieApiKey'));

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }

  @override
  Future<List<Movie>> getPopulerMovies(String language, int page) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/movie/popular/?api_key=$movieApiKey&language=$language&page=$page'));

    if (response.statusCode == 200) {
      var movieList = json.decode(response.body);

      return movieList["results"]
          .map<Movie>((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
