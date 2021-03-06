// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupsphone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupsPhoneAdapter extends TypeAdapter<GroupsPhone> {
  @override
  final int typeId = 3;

  @override
  GroupsPhone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupsPhone(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GroupsPhone obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.numero)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.lien)
      ..writeByte(3)
      ..write(obj.etat)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.saved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupsPhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
