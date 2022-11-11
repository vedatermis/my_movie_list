import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}
