part of 'jadwal_cubit.dart';

abstract class JadwalState extends Equatable {
  const JadwalState();
}

class JadwalInitial extends JadwalState {
  @override
  List<Object> get props => [];
}

class JadwalLoaded extends JadwalState {
  final List<JadwalModel>? jadwals;

  JadwalLoaded(this.jadwals);

  @override
  List<Object?> get props => [jadwals];
}

class JadwalLoadedFailed extends JadwalState {
  final String? message;

  JadwalLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}