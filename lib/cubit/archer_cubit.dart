import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'archer_state.dart';

class ArcherCubit extends Cubit<ArcherState> {
  ArcherCubit() : super(ArcherInitial());

  Future<void> getArchers() async {
    ApiReturnValue<List<ArcherModel>> result =
        await ArcherServices.getArchers();

    if (result.value != null) {
      emit(ArcherLoaded(result.value));
    } else {
      emit(ArcherLoadedFailed(result.message));
    }
  }
}
