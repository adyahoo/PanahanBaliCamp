part of 'pertandingan_cubit.dart';

abstract class PertandinganState extends Equatable {
  const PertandinganState();
}

class PertandinganInitial extends PertandinganState {
  @override
  List<Object> get props => [];
}

class PertandinganLoaded extends PertandinganState {
  final List<PertandinganModel>? pertandingans;

  PertandinganLoaded(this.pertandingans);

  @override
  List<Object?> get props => [pertandingans];
}

class PertandinganLoadedFailed extends PertandinganState {
  final String? msg;

  PertandinganLoadedFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}