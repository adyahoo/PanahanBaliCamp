part of 'models.dart';

class UserModel extends Equatable {
  final int id;
  final String memberNumber;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String detailAddress;
  final String image;
  final String identityNumber;
  final String membershipPeriod;
  final String bornDate;
  final String gender;
  static String? token;

  UserModel(
      this.id,
      this.name,
      this.phone,
      this.address,
      this.detailAddress,
      this.email,
      this.image,
      this.memberNumber,
      this.identityNumber,
      this.membershipPeriod,
      this.bornDate,
      this.gender);

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      data['id'],
      data['nama'],
      data['no_telp'],
      data['alamat'],
      data['alamat'],
      data['email'],
      data['foto'],
      data['no_anggota'],
      data['no_ktp'],
      data['masa_berlaku_keanggotaan'],
      data['tanggal_lahir'],
      data['jenis_kelamin']);

  @override
  List<Object?> get props => [id, name, phone, address, detailAddress, email];
}

List<UserModel> mockUsers = [
  UserModel(
      1,
      "Dyeva M",
      "089098098089",
      "Jl. Bratasena VII",
      "No. 12",
      "dyevam@gmail.com",
      "circle-avatar.jpg",
      "1234",
      "1234",
      "20-1-2022",
      "20-1-2000",
      "Pria"),
];
