part of 'models.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? memberNumber;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? phone;
  @HiveField(5)
  final String? address;
  @HiveField(6)
  final String? detailAddress;
  @HiveField(7)
  final String? province;
  @HiveField(8)
  final String? city;
  @HiveField(9)
  final String? image;
  @HiveField(10)
  final String? identityNumber;
  @HiveField(11)
  final String? startPeriod;
  @HiveField(12)
  final String? endPeriod;
  @HiveField(13)
  final String? membershipStatus;
  @HiveField(14)
  final String? membership;
  @HiveField(15)
  final String? bornDate;
  @HiveField(16)
  final String? gender;
  static String? token;

  UserModel({this.id,
    this.name,
    this.phone,
    this.address,
    this.detailAddress,
    this.province,
    this.city,
    this.email,
    this.image,
    this.memberNumber,
    this.identityNumber,
    this.startPeriod,
    this.endPeriod,
    this.membershipStatus,
    this.membership,
    this.bornDate,
    this.gender});

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      UserModel(
        id: data['id'],
        name: data['nama'],
        phone: data['no_telp'],
        address: data['alamat'],
        detailAddress: data['alamat'],
        province: data['provinsi'],
        city: data['kota'],
        email: data['email'],
        image: data['foto'],
        memberNumber: data['no_anggota'],
        identityNumber: data['no_ktp'],
        bornDate: data['tanggal_lahir'],
        gender: data['jenis_kelamin'],
        startPeriod: data['start_keanggotaan'],
        endPeriod: data['end_keanggotaan'],
        membershipStatus: data['status_keanggotaan'],
        membership: data['membership'],
      );

  UserModel copyWith({
    int? id,
    String? memberNumber,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? detailAddress,
    String? province,
    String? city,
    String? image,
    String? identityNumber,
    String? startPeriod,
    String? endPeriod,
    String? membershipStatus,
    String? membership,
    String? bornDate,
    String? gender,
  }) =>
      UserModel(
          id: id ?? this.id,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          address: address ?? this.address,
          detailAddress: detailAddress ?? this.detailAddress,
          province: province ?? this.province,
          city: city ?? this.city,
          email: email ?? this.email,
          image: image ?? this.image,
          memberNumber: memberNumber ?? this.memberNumber,
          identityNumber: identityNumber ?? this.identityNumber,
          startPeriod: startPeriod ?? this.startPeriod,
          endPeriod: endPeriod ?? this.endPeriod,
          membershipStatus: membershipStatus ?? this.membershipStatus,
          membership: membership ?? this.membership,
          bornDate: bornDate ?? this.bornDate,
          gender: gender ?? this.gender);

  @override
  List<Object?> get props => [id, name, phone, address, detailAddress, email];
}

List<UserModel> mockUsers = [
  UserModel(
      id: 1,
      name: "Dyeva M",
      phone: "089098098089",
      address: "Jl. Bratasena VII",
      detailAddress: "Jl. Bratasena VII",
      province: "Jl. Bratasena VII",
      city: "No. 12",
      email: "dyevam@gmail.com",
      image: "circle-avatar.jpg",
      memberNumber: "1234",
      identityNumber: "1234",
      startPeriod: "20-1-2022",
      bornDate: "20-1-2000",
      gender: "Pria"),
];
