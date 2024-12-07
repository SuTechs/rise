// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitCategoryAdapter extends TypeAdapter<HabitCategory> {
  @override
  final int typeId = 3;

  @override
  HabitCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HabitCategory.sports;
      case 1:
        return HabitCategory.health;
      case 2:
        return HabitCategory.work;
      case 3:
        return HabitCategory.study;
      case 4:
        return HabitCategory.food;
      case 5:
        return HabitCategory.finance;
      case 6:
        return HabitCategory.yoga;
      case 7:
        return HabitCategory.social;
      case 8:
        return HabitCategory.fun;
      case 9:
        return HabitCategory.outdoors;
      case 10:
        return HabitCategory.reading;
      case 11:
        return HabitCategory.fitness;
      case 12:
        return HabitCategory.others;
      default:
        return HabitCategory.sports;
    }
  }

  @override
  void write(BinaryWriter writer, HabitCategory obj) {
    switch (obj) {
      case HabitCategory.sports:
        writer.writeByte(0);
        break;
      case HabitCategory.health:
        writer.writeByte(1);
        break;
      case HabitCategory.work:
        writer.writeByte(2);
        break;
      case HabitCategory.study:
        writer.writeByte(3);
        break;
      case HabitCategory.food:
        writer.writeByte(4);
        break;
      case HabitCategory.finance:
        writer.writeByte(5);
        break;
      case HabitCategory.yoga:
        writer.writeByte(6);
        break;
      case HabitCategory.social:
        writer.writeByte(7);
        break;
      case HabitCategory.fun:
        writer.writeByte(8);
        break;
      case HabitCategory.outdoors:
        writer.writeByte(9);
        break;
      case HabitCategory.reading:
        writer.writeByte(10);
        break;
      case HabitCategory.fitness:
        writer.writeByte(11);
        break;
      case HabitCategory.others:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      category: fields[2] as HabitCategory,
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
      ..write(obj.category)
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
      category: $enumDecode(_$HabitCategoryEnumMap, json['category']),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$HabitDataImplToJson(_$HabitDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$HabitCategoryEnumMap[instance.category]!,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$HabitCategoryEnumMap = {
  HabitCategory.sports: 'sports',
  HabitCategory.fitness: 'fitness',
  HabitCategory.health: 'health',
  HabitCategory.work: 'work',
  HabitCategory.study: 'study',
  HabitCategory.food: 'food',
  HabitCategory.finance: 'finance',
  HabitCategory.yoga: 'yoga',
  HabitCategory.social: 'social',
  HabitCategory.fun: 'fun',
  HabitCategory.outdoors: 'outdoors',
  HabitCategory.reading: 'reading',
  HabitCategory.others: 'others',

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
