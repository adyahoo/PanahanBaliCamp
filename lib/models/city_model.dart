part of 'models.dart';

class CityModel extends Equatable {
  final int? id;
  final String? provinceId;
  final String? name;

  CityModel({this.id, this.provinceId, this.name});

  factory CityModel.fromJson(Map<String, dynamic> data) => CityModel(
      id: data['id'], provinceId: data['id_provinsi'], name: data['nama']);

  CityModel copyWith({int? id, String? provinceId, String? name}) => CityModel(
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
      name: name ?? this.name);

  @override
  List<Object?> get props => [id, provinceId, name];
}
