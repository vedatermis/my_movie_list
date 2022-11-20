enum MovieType { Popular, TopRated, Upcoming }

class MovieTypeNames {
  String getMovieTypeName(MovieType movieType) {
    switch (movieType) {
      case MovieType.Popular:
        return "Popular Movies";

      case MovieType.TopRated:
        return "Top Rated Movies";

      case MovieType.Upcoming:
        return "Upcoming Movies";
    }
  }
}
