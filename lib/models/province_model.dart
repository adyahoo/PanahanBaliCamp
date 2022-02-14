part of 'models.dart';

class ProvinceModel extends Equatable {
  final int? id;
  final String? name;

  ProvinceModel({this.id, this.name});

  factory ProvinceModel.fromJson(Map<String, dynamic> data) =>
      ProvinceModel(id: data['id'], name: data['nama']);

  @override
  List<Object?> get props => [id, name];
}
