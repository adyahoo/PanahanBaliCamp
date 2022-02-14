part of 'archer_cubit.dart';

abstract class ArcherState extends Equatable {
  const ArcherState();
}

class ArcherInitial extends ArcherState {
  @override
  List<Object> get props => [];
}

class ArcherLoaded extends ArcherState {
  final List<ArcherModel>? archers;

  ArcherLoaded(this.archers);

  @override
  List<Object?> get props => [archers];
}

class ArcherLoadedFailed extends ArcherState {
  final String? message;

  ArcherLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}