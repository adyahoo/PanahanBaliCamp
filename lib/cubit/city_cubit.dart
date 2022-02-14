import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityInitial());

  Future<void> getCities(int provinceId) async {
    ApiReturnValue<List<CityModel>> result = await CityService.getCities(provinceId: provinceId);

    if (result.value != null) {
      emit(CityLoaded(result.value));
    }
  }
}
