import 'dart:convert';

import 'package:my_movie_list/models/cast/cast.dart';
import 'package:my_movie_list/repositories/cast/baseCastRepository.dart';
import 'package:http/http.dart' as http;

class CastRepository extends BaseCastRepository {
  @override
  Future<List<Cast>> getCast(int movieId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/movie/$movieId/credits?api_key=$movieApiKey'));

    if (response.statusCode == 200) {
      var cast = json.decode(response.body);

      return cast["cast"].map<Cast>((cast) => Cast.fromJson(cast)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }
}
