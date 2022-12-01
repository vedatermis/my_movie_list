import 'package:flutter/material.dart';
import 'package:my_movie_list/config/assets.dart';

import '../models/models.dart';

class MovieDetailTopImage extends StatelessWidget {
  final Movie movie;
  const MovieDetailTopImage({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        movie.backdropPath == null
            ? Image.asset(
                AppImages().noImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              )
            : Image.network(
                movie.movieSmallImageBasePath + movie.backdropPath!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
        // Positioned(
        //   left: 10,
        //   top: 10,
        //   child: Container(
        //     width: 37,
        //     height: 20,
        //     decoration: BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Text(
        //       movie.voteAverage!.toStringAsFixed(1),
        //       style: Theme.of(context).textTheme.headline5,
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
