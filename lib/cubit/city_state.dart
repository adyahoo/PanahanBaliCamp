part of 'city_cubit.dart';

abstract class CityState extends Equatable {
  const CityState();
}

class CityInitial extends CityState {
  @override
  List<Object> get props => [];
}

class CityLoaded extends CityState {
  final List<CityModel>? cities;

  CityLoaded(this.cities);

  @override
  List<Object?> get props => [cities];
}