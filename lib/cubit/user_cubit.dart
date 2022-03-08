import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panahan_app/cubit/cubit.dart';
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

  Future<void> register(UserModel user, String password,
      {File? imageFile}) async {
    ApiReturnValue<UserModel> result =
        await UserService.register(user, password, imageFile: imageFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> logout() async {
    ApiReturnValue<String> result = await UserService.logout();

    emit(UserPostSuccess(result.message));
  }

  Future<void> postForgetPassEmail(String email) async {
    ApiReturnValue<String> result = await UserService.postForgetPassEmail(email: email);

    if (result.value == "200") {
      emit(UserPostSuccess(result.message));
    }else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> postForgetPassToken(String token) async {
    ApiReturnValue<String> result = await UserService.postForgetPassToken(token: token);

    if (result.value == "200") {
      emit(UserPostSuccess(result.message));
    }else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> resetPassword(String email, String password, String confPassword) async {
    ApiReturnValue<String> result = await UserService.resetPass(email: email, password: password, confPassword: confPassword);

    if (result.value == "200") {
      emit(UserPostSuccess(result.message));
    }else {
      emit(UserLoadedFailed(result.message));
    }
  }
}
