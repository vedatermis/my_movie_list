import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  static String routeName = '/movieDetail';

  static Route route({required int movieId}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (builder) => MovieDetail(movieId: movieId));
  }

  final int movieId;
  const MovieDetail({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(movieId.toString()),
    );
  }
}
