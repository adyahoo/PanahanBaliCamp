import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'province_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  ProvinceCubit() : super(ProvinceInitial());

  Future<void> getProvinces() async {
    ApiReturnValue<List<ProvinceModel>> result =
        await ProvinceService.getProvinces();

    if (result.value != null) {
      emit(ProvinceLoaded(result.value));
    } else {
      emit(ProvinceLoadedFailed(result.message));
    }
  }
}
