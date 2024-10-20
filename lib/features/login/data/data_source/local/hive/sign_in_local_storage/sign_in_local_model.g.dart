// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInLocalModelAdapter extends TypeAdapter<SignInLocalModel> {
  @override
  final int typeId = 6;

  @override
  SignInLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignInLocalModel(
      signedIn: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SignInLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.signedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
