import 'package:flutter/material.dart';
import 'package:my_movie_list/models/models.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailHeader({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.red,
            ),
            const SizedBox(width: 2),
            Text(
              movie.voteAverage!.toStringAsFixed(1),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red),
            ),
            const SizedBox(width: 2),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.red,
            ),
            const SizedBox(width: 2),
            Text('${movie.releaseDate}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              movie.originalLanguage!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
