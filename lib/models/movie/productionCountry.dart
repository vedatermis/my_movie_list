import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  String? iso31661;
  String? name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  @override
  List<Object?> get props => [iso31661, name];
}
