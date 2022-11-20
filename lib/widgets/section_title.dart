import 'package:flutter/material.dart';
import 'package:my_movie_list/models/movie_type.dart';

class SectionTitle extends StatelessWidget {
  final MovieType movieType;
  final String title;
  const SectionTitle({required this.title, required this.movieType, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/seeAll', arguments: movieType),
              child: Text(
                'See All',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red),
              ),
            ),
          ],
        ));
  }
}
