import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreInitial());

  Future<void> getScores(int jadwalId) async {
    ApiReturnValue<List<ScoreModel>> scores =
        await ScoreService.getScores(jadwalId: jadwalId);

    if (scores.value != null) {
      emit(ScoreLoaded(scores.value));
    } else {
      emit(ScoreLoadedFailed(scores.message));
    }
  }

  Future<void> postScore(
      int detailId, int score, int length, int session) async {
    ApiReturnValue<String> result = await ScoreService.postScore(
        detailId: detailId, score: score, length: length, session: session);

    if (result.message != "null") {
      emit(ScorePosted(result.message));
    } else {
      emit(ScoreLoadedFailed(result.message));
    }
  }
}
