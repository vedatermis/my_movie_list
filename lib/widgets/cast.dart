import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/models/models.dart';

class Casting extends StatelessWidget {
  final List<Cast> casts;
  const Casting({required this.casts, super.key});

  @override
  Widget build(BuildContext context) {
    const String movieSmallImageBasePath = 'https://image.tmdb.org/t/p/w500';

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: casts.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 220,
            child: Row(
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: movieSmallImageBasePath + casts[index].profilePath!,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      casts[index].name!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      casts[index].knownForDepartment!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }
}
