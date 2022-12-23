import 'package:my_movie_list/models/models.dart';

abstract class BaseCastRepository {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String movieApiKey = '80487f77845d1fa73945e67e36c3c47d';

  Future<List<Cast>> getCast(int movieId);
}
