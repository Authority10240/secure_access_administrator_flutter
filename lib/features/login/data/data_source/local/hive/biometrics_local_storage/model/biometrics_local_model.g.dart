// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometrics_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BiometricsLocalModelAdapter extends TypeAdapter<BiometricsLocalModel> {
  @override
  final int typeId = 5;

  @override
  BiometricsLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BiometricsLocalModel(
      enabled: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, BiometricsLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.enabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BiometricsLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
