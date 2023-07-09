import 'package:binary_reminder_app/hive_database/hive_database.dart';
import 'package:binary_reminder_app/hive_database/hive_database_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ScreenReminderAdd extends StatefulWidget {

  final DataEvent dataEvent;
  ScreenReminderAdd({required this.dataEvent});

  @override
  State<ScreenReminderAdd> createState() => _ScreenReminderAddState();
}

class _ScreenReminderAddState extends State<ScreenReminderAdd> {

  Box box_event = HiveDatabaseBox.GetDataEvent();

  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerTime = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Reminder"),
      ),
      body: Column(
        children: [

          TextFormField(
            controller: controllerDescription,
          ),

          TextFormField(
            controller: controllerDate,
          ),

          TextFormField(
            controller: controllerTime,
          ),

          TextButton(onPressed: (){

            String Description = controllerDescription.text.toString();
            String Date = controllerDate.text.toString();
            String Time = controllerTime.text.toString();

            DataEvent data_event = widget.dataEvent;

            DataReminder data_reminder = DataReminder()
            ..key = HiveDatabaseBox.getNewKey().toString()
            ..description = Description
            ..date = DateTime.now()
            ..time = DateTime.now();

            data_event.list_reminders.add(data_reminder);

            box_event.put(data_event.key.toString(), data_event);
            Navigator.pop(context, data_event);

          }, child: Text("Add Reminder"))
        ],
      ),
    );
  }
}
