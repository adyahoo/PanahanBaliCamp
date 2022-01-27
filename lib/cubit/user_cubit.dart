import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String email, String password) async {
    ApiReturnValue<UserModel> result = await UserService.login(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }
}
