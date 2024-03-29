import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  @override
  List<Object?> get props => [id, name];
}
