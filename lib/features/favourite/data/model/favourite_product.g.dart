// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteProductAdapter extends TypeAdapter<FavouriteProduct> {
  @override
  final int typeId = 0;

  @override
  FavouriteProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteProduct(
      id: fields[0] as int,
      image: (fields[3] as List).cast<dynamic>(),
      name: fields[1] as String,
      price: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
