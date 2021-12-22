// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneAdapter extends TypeAdapter<Phone> {
  @override
  final int typeId = 0;

  @override
  Phone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phone(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as bool,
      fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Phone obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.cycle)
      ..writeByte(2)
      ..write(obj.commune)
      ..writeByte(3)
      ..write(obj.gresa)
      ..writeByte(4)
      ..write(obj.ecole)
      ..writeByte(5)
      ..write(obj.nom)
      ..writeByte(6)
      ..write(obj.tel)
      ..writeByte(7)
      ..write(obj.fonction)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.geo)
      ..writeByte(10)
      ..write(obj.fav)
      ..writeByte(11)
      ..write(obj.refgroup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
