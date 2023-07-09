import 'package:binary_reminder_app/hive_database/hive_database.dart';
import 'package:binary_reminder_app/hive_database/hive_database_box.dart';
import 'package:binary_reminder_app/screens/screen_event_add.dart';
import 'package:binary_reminder_app/screens/screen_reminder_add.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class ScreenReminderList extends StatefulWidget {

  final DataEvent dataEvent;
  ScreenReminderList({required this.dataEvent});


  @override
  State<ScreenReminderList> createState() => _ScreenReminderListState();
}

class _ScreenReminderListState extends State<ScreenReminderList> {

  DataEvent? dataEvent;

  @override
  void initState() {
    super.initState();

    setState(() {
      dataEvent = widget.dataEvent;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Reminders"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenEventAdd()));
      }, child: Icon(Icons.add),),
      body:  Expanded(
        child: Container(
          alignment: Alignment.topCenter,
          child:  widget.dataEvent.list_reminders.length > 0 ?
          ListView.builder(
            // padding: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: widget.dataEvent.list_reminders.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    DataEvent dataEvent = await Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenReminderAdd(dataEvent: widget.dataEvent)));
                    setState(() {
                      this.dataEvent = dataEvent;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("${widget.dataEvent.list_reminders[index].description}"),
                  ),
                );
              }) :
          Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
