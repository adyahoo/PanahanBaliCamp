part of 'models.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String detailAddress;
  final String image;

  UserModel(this.id, this.name, this.phone, this.address, this.detailAddress,
      this.email, this.image);

  @override
  List<Object?> get props => [id, name, phone, address, detailAddress, email];
}

List<UserModel> mockUsers = [
  UserModel(1, "Dyeva M", "089098098089", "Jl. Bratasena VII", "No. 12",
      "dyevam@gmail.com", "circle-avatar.jpg"),
];
