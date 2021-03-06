part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

//class untuk handle jika berhasil login
class UserLoaded extends UserState {
  final UserModel? user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

//class untuk handle jika gagal login
class UserLoadedFailed extends UserState {
  final String? message;

  UserLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}

//class untuk handle jika method post berhasil
class UserPostSuccess extends UserState {
  final String? message;

  UserPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}