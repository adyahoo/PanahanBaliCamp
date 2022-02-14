import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'jadwal_state.dart';

class JadwalCubit extends Cubit<JadwalState> {
  JadwalCubit() : super(JadwalInitial());

  Future<void> getJadwals() async {
    ApiReturnValue<List<JadwalModel>> result = await JadwalServices.getJadwals();

    if (result.value != null) {
      emit(JadwalLoaded(result.value));
    } else {
      emit(JadwalLoadedFailed(result.message));
    }
  }
}
