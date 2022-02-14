import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'venue_state.dart';

class VenueCubit extends Cubit<VenueState> {
  VenueCubit() : super(VenueInitial());

  Future<void> getVenues() async {
    ApiReturnValue<List<VenueModel>> result = await VenueServices.getVenues();

    if (result.value != null) {
      emit(VenueLoaded(result.value));
    } else {
      emit(VenueLoadedFailed(result.message));
    }
  }
}
