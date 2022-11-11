import 'package:my_movie_list/models/movie/movie.dart';

abstract class BaseMovieRepository {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String movieApiKey = '80487f77845d1fa73945e67e36c3c47d';
  final String movieSmallImageBasePath = 'https://image.tmdb.org/t/p/w500';
  final String movieOriginalImageBasePath =
      'https://image.tmdb.org/t/p/original';

  Future<Movie> getMovieById(int id);
  Future<List<Movie>> getPopulerMovies(String language, int page);
}
