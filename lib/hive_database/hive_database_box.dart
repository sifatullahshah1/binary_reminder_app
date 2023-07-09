import 'package:binary_reminder_app/hive_database/hive_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseBox {

  static final database_event = "database_event";
  static final database_reminder = "database_reminder";


  static Box<DataEvent> GetDataEvent() {
    return Hive.box(database_event);
  }


  static GetHiveInitFunction() async {
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DataEventAdapter());
    }

    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(DataReminderAdapter());
    }

    //====

    print("objectobjectobject 1 ${Hive.isBoxOpen(database_event)}");


    if(!Hive.isBoxOpen(database_event)) {
      await Hive.openBox<DataEvent>(database_event);
    }
    print("objectobjectobject 2 ${Hive.isBoxOpen(database_event)}");
    print("objectobjectobject 1 ${Hive.isBoxOpen(database_reminder)}");
    if(!Hive.isBoxOpen(database_reminder)) {
      await Hive.openBox<DataReminder>(database_reminder);
    }

    print("objectobjectobject 2 ${Hive.isBoxOpen(database_reminder)}");

  }

  static String getNewKey() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  }