part of 'score_cubit.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();
}

class ScoreInitial extends ScoreState {
  @override
  List<Object> get props => [];
}

class ScoreLoaded extends ScoreState {
  final List<ScoreModel>? scores;

  ScoreLoaded(this.scores);

  @override
  List<Object?> get props => [scores];
}

class ScoreLoadedFailed extends ScoreState {
  final String? msg;

  ScoreLoadedFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}

class ScorePosted extends ScoreState {
  final String? msg;

  ScorePosted(this.msg);

  @override
  List<Object?> get props => [msg];
}