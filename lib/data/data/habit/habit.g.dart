// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitDataAdapter extends TypeAdapter<_$HabitDataImpl> {
  @override
  final int typeId = 1;

  @override
  _$HabitDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HabitDataImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      categoryId: fields[2] as String,
      createdAt: fields[5] as int,
      updatedAt: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$HabitDataImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HabitRecordDataAdapter extends TypeAdapter<_$HabitRecordDataImpl> {
  @override
  final int typeId = 2;

  @override
  _$HabitRecordDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HabitRecordDataImpl(
      habitId: fields[0] as String,
      date: fields[1] as int,
      createdAt: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$HabitRecordDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.habitId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitRecordDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitDataImpl _$$HabitDataImplFromJson(Map<String, dynamic> json) =>
    _$HabitDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$HabitDataImplToJson(_$HabitDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$HabitRecordDataImpl _$$HabitRecordDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HabitRecordDataImpl(
      habitId: json['habitId'] as String,
      date: (json['date'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$$HabitRecordDataImplToJson(
        _$HabitRecordDataImpl instance) =>
    <String, dynamic>{
      'habitId': instance.habitId,
      'date': instance.date,
      'createdAt': instance.createdAt,
    };
