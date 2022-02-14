import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'pertandingan_state.dart';

class PertandinganCubit extends Cubit<PertandinganState> {
  PertandinganCubit() : super(PertandinganInitial());

  Future<void> getPertandingans() async {
    ApiReturnValue<List<PertandinganModel>> result = await PertandinganServices.getPertandingans();

    if (result.value != null) {
      emit(PertandinganLoaded(result.value));
    } else {
      emit(PertandinganLoadedFailed(result.message));
    }
  }
}
