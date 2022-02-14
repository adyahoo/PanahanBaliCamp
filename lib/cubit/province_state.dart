part of 'province_cubit.dart';

abstract class ProvinceState extends Equatable {
  const ProvinceState();
}

class ProvinceInitial extends ProvinceState {
  @override
  List<Object> get props => [];
}

class ProvinceLoaded extends ProvinceState {
  final List<ProvinceModel>? provinces;

  ProvinceLoaded(this.provinces);

  @override
  List<Object?> get props => [provinces];
}

class ProvinceLoadedFailed extends ProvinceState {
  final String? message;

  ProvinceLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}