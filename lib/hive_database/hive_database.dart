import 'package:hive/hive.dart';
part 'hive_database.g.dart';

@HiveType(typeId: 0)
class DataEvent extends HiveObject {
  @HiveField(0)
  dynamic key;
  @HiveField(1)
  late String event_name;
  @HiveField(2)
  late List<DataReminder> list_reminders;
}

@HiveType(typeId: 1)
class DataReminder extends HiveObject {
  @HiveField(0)
  dynamic key;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late DateTime date;
  @HiveField(3)
  late DateTime time;
}