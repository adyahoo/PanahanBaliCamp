// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      name: fields[2] as String?,
      phone: fields[4] as String?,
      address: fields[5] as String?,
      detailAddress: fields[6] as String?,
      province: fields[7] as String?,
      city: fields[8] as String?,
      email: fields[3] as String?,
      image: fields[9] as String?,
      memberNumber: fields[1] as String?,
      identityNumber: fields[10] as String?,
      startPeriod: fields[11] as String?,
      endPeriod: fields[12] as String?,
      membershipStatus: fields[13] as String?,
      membership: fields[14] as String?,
      bornDate: fields[15] as String?,
      gender: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memberNumber)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.detailAddress)
      ..writeByte(7)
      ..write(obj.province)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.identityNumber)
      ..writeByte(11)
      ..write(obj.startPeriod)
      ..writeByte(12)
      ..write(obj.endPeriod)
      ..writeByte(13)
      ..write(obj.membershipStatus)
      ..writeByte(14)
      ..write(obj.membership)
      ..writeByte(15)
      ..write(obj.bornDate)
      ..writeByte(16)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
