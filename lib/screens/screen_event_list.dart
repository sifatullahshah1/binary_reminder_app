import 'package:binary_reminder_app/hive_database/hive_database.dart';
import 'package:binary_reminder_app/hive_database/hive_database_box.dart';
import 'package:binary_reminder_app/screens/screen_event_add.dart';
import 'package:binary_reminder_app/screens/screen_reminder_add.dart';
import 'package:binary_reminder_app/screens/screen_reminder_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class ScreenEventList extends StatefulWidget {
  const ScreenEventList({Key? key}) : super(key: key);

  @override
  State<ScreenEventList> createState() => _ScreenEventListState();
}

class _ScreenEventListState extends State<ScreenEventList> {


  Box box_event = HiveDatabaseBox.GetDataEvent();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Events"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenEventAdd()));
      }, child: Icon(Icons.add),),
      body:  Expanded(
        child: Container(
          alignment: Alignment.topCenter,
          child: ValueListenableBuilder<Box<DataEvent>>(
            valueListenable: HiveDatabaseBox.GetDataEvent().listenable(),
            builder: (context, box, _) {
              List<DataEvent> list_event = box.values.toList().cast<DataEvent>();

              return list_event.length > 0 ?
              ListView.builder(
                // padding: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: list_event.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenReminderList(dataEvent: list_event[index],)));

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("${list_event[index].event_name}"),
                      ),
                    );
                  }) :
              Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
