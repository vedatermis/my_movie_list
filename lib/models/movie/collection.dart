import 'package:equatable/equatable.dart';

class Collection extends Equatable {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  Collection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  @override
  List<Object?> get props => [id, name, posterPath, backdropPath];
}
