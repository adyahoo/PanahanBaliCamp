part of 'models.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String detailAddress;

  UserModel(this.id, this.name, this.phone, this.address, this.detailAddress, this.email);
}

List<UserModel> mockUsers = [
  UserModel(1, "Dyeva M", "089098098089", "Jl. Bratasena VII", "No. 12", "dyevam@gmail.com"),
  UserModel(2, "Maul", "089098098089", "Jl. Bratasena VII", "No. 12", "dyevam@gmail.com"),
  UserModel(3, "Wahyu", "089098098089", "Jl. Bratasena VII", "No. 12", "dyevam@gmail.com"),
  UserModel(4, "Adyahoo", "089098098089", "Jl. Bratasena VII", "No. 12", "dyevam@gmail.com"),
];