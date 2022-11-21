import 'package:flutter/material.dart';
import 'package:my_movie_list/config/assets.dart';
import 'package:my_movie_list/models/models.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id!,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: [
                movie.backdropPath == null
                    ? Image.asset(
                        AppImages().noImage,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.95,
                      )
                    : Image.network(
                        movie.movieSmallImageBasePath + movie.backdropPath!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.95,
                      ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(movie != null ? movie.title! : '',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white)),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  //right: 0,
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
      ),
    );
  }
}
