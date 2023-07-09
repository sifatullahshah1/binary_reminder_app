// not just splash , will ask use for their name here

// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:binary_reminder_app/screens/screen_event_list.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  // const ScreenSplash({Key? key}) : super(key: key);

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {


  void OpenNextScreen() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenEventList()));
  }


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), OpenNextScreen);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      body: Container(
        // decoration: BoxDecoration(gradient: WidgetsSpecific.linear_gradient),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Load a Lottie file from your assets
            // Container(
            //     width: 200,
            //     height: 200,
            //     child:
            //     Lottie.asset(AppAssets.binary_expense_manager, width: 120)),
            SizedBox(height: 25),
            Text("Reminder",
                style: TextStyle(fontSize: 25, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
