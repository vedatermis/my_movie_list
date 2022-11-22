import 'package:flutter/material.dart';
import 'package:my_movie_list/config/assets.dart';
import 'package:my_movie_list/models/movie/movie.dart';

class MovieGridCard extends StatelessWidget {
  final Movie movie;
  const MovieGridCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id!,
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, '/movieDetail', arguments: movie.id),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.05)),
            image: DecorationImage(
              image: movie.backdropPath == null
                  ? AssetImage(AppImages().noImage)
                  : NetworkImage(
                          movie.movieSmallImageBasePath + movie.backdropPath!)
                      as ImageProvider,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 37,
                  height: 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.red,
                  ),
                  child: Text(
                    movie.voteAverage.toString(),
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
