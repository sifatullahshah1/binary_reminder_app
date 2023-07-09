import 'package:binary_reminder_app/hive_database/hive_database.dart';
import 'package:binary_reminder_app/hive_database/hive_database_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ScreenEventAdd extends StatefulWidget {
  const ScreenEventAdd({Key? key}) : super(key: key);

  @override
  State<ScreenEventAdd> createState() => _ScreenEventAddState();
}

class _ScreenEventAddState extends State<ScreenEventAdd> {

  Box box_event = HiveDatabaseBox.GetDataEvent();

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: Column(
        children: [

          TextFormField(
            controller: textEditingController,
          ),
          
          TextButton(onPressed: (){
            
            String event_name = textEditingController.text.toString();
            
            DataEvent data_event = DataEvent()
            ..key = HiveDatabaseBox.getNewKey()
            ..event_name = event_name
            ..list_reminders = [];
            
            box_event.put(HiveDatabaseBox.getNewKey().toString(), data_event);
            Navigator.pop(context);
            
          }, child: Text("Add Event"))
        ],
      ),
    );
  }
}
