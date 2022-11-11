import 'package:equatable/equatable.dart';

class SpokenLanguage extends Equatable {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
