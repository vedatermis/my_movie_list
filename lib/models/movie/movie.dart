import 'package:equatable/equatable.dart';
import 'package:my_movie_list/models/models.dart';

class Movie extends Equatable {
  final String movieSmallImageBasePath = 'https://image.tmdb.org/t/p/w500';
  final String movieOriginalImageBasePath =
      'https://image.tmdb.org/t/p/original';

  bool? adult;
  String? backdropPath;
  Collection? collection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.collection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = movieSmallImageBasePath + json['backdrop_path'];
    var collection = json['belongs_to_collection'] != null
        ? Collection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(Genre.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = movieOriginalImageBasePath + json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompany>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompany.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountry>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountry.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguage>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguage.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = double.tryParse(json['vote_average'].toString());
    voteCount = json['vote_count'];
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        collection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount
      ];
}
