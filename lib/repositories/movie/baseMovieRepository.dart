import 'package:my_movie_list/models/movie/movie.dart';

abstract class BaseMovieRepository {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String movieApiKey = '80487f77845d1fa73945e67e36c3c47d';

  Future<Movie> getMovieById(int id, String language);
  Future<List<Movie>> getPopulerMovies(String language, int page);
  Future<List<Movie>> getTopRatedMovies(String language, int page);
  Future<List<Movie>> getUpcomingMovies(String language, int page);
}
