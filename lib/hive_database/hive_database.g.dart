// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataEventAdapter extends TypeAdapter<DataEvent> {
  @override
  final int typeId = 0;

  @override
  DataEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataEvent()
      ..key = fields[0] as dynamic
      ..event_name = fields[1] as String
      ..list_reminders = (fields[2] as List).cast<DataReminder>();
  }

  @override
  void write(BinaryWriter writer, DataEvent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.event_name)
      ..writeByte(2)
      ..write(obj.list_reminders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataReminderAdapter extends TypeAdapter<DataReminder> {
  @override
  final int typeId = 1;

  @override
  DataReminder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataReminder()
      ..key = fields[0] as dynamic
      ..description = fields[1] as String
      ..date = fields[2] as DateTime
      ..time = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, DataReminder obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataReminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
